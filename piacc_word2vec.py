#!/usr/bin/env python
# coding: utf-8

# ##### Copyright 2020 The TensorFlow Authors.

# In[27]:


#@title Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


# <table class="tfo-notebook-buttons" align="left">
#   <td>
#     <a target="_blank" href="https://www.tensorflow.org/tutorials/text/word2vec">
#     <img src="https://www.tensorflow.org/images/tf_logo_32px.png" />
#     View on TensorFlow.org</a>
#   </td>
#   <td>
#     <a target="_blank" href="https://colab.research.google.com/github/tensorflow/docs/blob/master/site/en/tutorials/text/word2vec.ipynb">
#     <img src="https://www.tensorflow.org/images/colab_logo_32px.png" />
#     Run in Google Colab</a>
#   </td>
#   <td>
#     <a target="_blank" href="https://github.com/tensorflow/docs/blob/master/site/en/tutorials/text/word2vec.ipynb">
#     <img src="https://www.tensorflow.org/images/GitHub-Mark-32px.png" />
#     View source on GitHub</a>
#   </td>
#   <td>
#     <a href="https://storage.googleapis.com/tensorflow_docs/docs/site/en/tutorials/text/word2vec.ipynb"><img src="https://www.tensorflow.org/images/download_logo_32px.png" />Download notebook</a>
#   </td>
# </table>

# # Word2Vec

# Word2Vec is not a singular algorithm, rather, it is a family of model architectures and optimizations that can be used to learn word embeddings from large datasets. Embeddings learned through Word2Vec have proven to be successful on a variety of downstream natural language processing tasks.
# 
# Note: This tutorial is based on [Efficient Estimation of Word Representations in Vector Space](https://arxiv.org/pdf/1301.3781.pdf) and
# [Distributed
# Representations of Words and Phrases and their Compositionality](https://papers.nips.cc/paper/5021-distributed-representations-of-words-and-phrases-and-their-compositionality.pdf). It is not an exact implementation of the papers. Rather, it is intended to illustrate the key ideas.
# 
# These papers proposed two methods for learning representations of words: 
# 
# *   **Continuous Bag-of-Words Model** which predicts the middle word based on surrounding context words. The context consists of a few words before and after the current (middle) word. This architecture is called a bag-of-words model as the order of words in the context is not important.
# *   **Continuous Skip-gram Model** which predict words within a certain range before and after the current word in the same sentence. A worked example of this is given below.
# 
# 
# You'll use the skip-gram approach in this tutorial. First, you'll explore skip-grams and other concepts using a single sentence for illustration. Next, you'll train your own Word2Vec model on a small dataset. This tutorial also contains code to export the trained embeddings and visualize them in the [TensorFlow Embedding Projector](http://projector.tensorflow.org/).
# 

# ## Skip-gram and Negative Sampling 

# While a bag-of-words model predicts a word given the neighboring context, a skip-gram model predicts the context (or neighbors) of a word, given the word itself. The model is trained on skip-grams, which are n-grams that allow tokens to be skipped (see the diagram below for an example). The context of a word can be represented through a set of skip-gram pairs of `(target_word, context_word)` where `context_word` appears in the neighboring context of `target_word`. 

# Consider the following sentence of 8 words.
# > The wide road shimmered in the hot sun. 
# 
# The context words for each of the 8 words of this sentence are defined by a window size. The window size determines the span of words on either side of a `target_word` that can be considered `context word`. Take a look at this table of skip-grams for target words based on different window sizes.

# Note: For this tutorial, a window size of *n* implies n words on each side with a total window span of 2*n+1 words across a word.

# ![word2vec_skipgrams](images/word2vec_skipgram.png)

# The training objective of the skip-gram model is to maximize the probability of predicting context words given the target word. For a sequence of words *w<sub>1</sub>, w<sub>2</sub>, ... w<sub>T</sub>*, the objective can be written as the average log probability

# ![word2vec_skipgram_objective](images/word2vec_skipgram_objective.png)

# where `c` is the size of the training context. The basic skip-gram formulation defines this probability using the softmax function.

# ![word2vec_full_softmax](images/word2vec_full_softmax.png)

# where *v* and *v<sup>'<sup>* are target and context vector representations of words and *W* is vocabulary size. 

# Computing the denominator of this formulation involves performing a full softmax over the entire vocabulary words which is often large (10<sup>5</sup>-10<sup>7</sup>) terms. 

# The [Noise Contrastive Estimation](https://www.tensorflow.org/api_docs/python/tf/nn/nce_loss) loss function is an efficient approximation for a full softmax. With an objective to learn word embeddings instead of modelling the word distribution, NCE loss can be [simplified](https://papers.nips.cc/paper/5021-distributed-representations-of-words-and-phrases-and-their-compositionality.pdf) to use negative sampling. 

# The simplified negative sampling objective for a target word is to distinguish  the context word from *num_ns* negative samples drawn from noise distribution *P<sub>n</sub>(w)* of words. More precisely, an efficient approximation of full softmax over the vocabulary is, for a skip-gram pair, to pose the loss for a target word as a classification problem between the context word and *num_ns* negative samples. 

# A negative sample is defined as a (target_word, context_word) pair such that the context_word does not appear in the `window_size` neighborhood of the target_word. For the example sentence, these are few potential negative samples (when `window_size` is 2).
# 
# ```
# (hot, shimmered)
# (wide, hot)
# (wide, sun)
# ```

# In the next section, you'll generate skip-grams and negative samples for a single sentence. You'll also learn about subsampling techniques and train a classification model for positive and negative training examples later in the tutorial.

# ## Setup

# In[47]:


import io
import itertools
import numpy as np
import os
import re
import string
import tensorflow as tf
import tqdm

from tensorflow.keras import Model, Sequential
from tensorflow.keras.layers import Activation, Dense, Dot, Embedding, Flatten, GlobalAveragePooling1D, Reshape
from tensorflow.keras.layers.experimental.preprocessing import TextVectorization


# In[48]:


SEED = 42 
AUTOTUNE = tf.data.AUTOTUNE


# ## Compile all steps into one function
# 

# ### Skip-gram Sampling table 

# A large dataset means larger vocabulary with higher number of more frequent words such as stopwords. Training examples obtained from sampling commonly occuring words (such as `the`, `is`, `on`) don't add much useful information  for the model to learn from. [Mikolov et al.](https://papers.nips.cc/paper/5021-distributed-representations-of-words-and-phrases-and-their-compositionality.pdf) suggest subsampling of frequent words as a helpful practice to improve embedding quality. 

# The `tf.keras.preprocessing.sequence.skipgrams` function accepts a sampling table argument to encode probabilities of sampling any token. You can use the `tf.keras.preprocessing.sequence.make_sampling_table` to  generate a word-frequency rank based probabilistic sampling table and pass it to `skipgrams` function. Take a look at the sampling probabilities for a `vocab_size` of 10.

# `sampling_table[i]` denotes the probability of sampling the i-th most common word in a dataset. The function assumes a [Zipf's distribution](https://en.wikipedia.org/wiki/Zipf%27s_law) of the word frequencies for sampling.

# Key point: The `tf.random.log_uniform_candidate_sampler` already assumes that the vocabulary frequency follows a log-uniform (Zipf's) distribution. Using these distribution weighted sampling also helps approximate the Noise Contrastive Estimation (NCE) loss with simpler loss functions for training a negative sampling objective.

# ### Generate training data

# Compile all the steps described above into a function that can be called on a list of vectorized sentences obtained from any text dataset. Notice that the sampling table is built before sampling skip-gram word pairs. You will use this function in the later sections.

# In[49]:


# Generates skip-gram pairs with negative sampling for a list of sequences
# (int-encoded sentences) based on window size, number of negative samples
# and vocabulary size.
def generate_training_data(sequences, window_size, num_ns, vocab_size, seed):
  # Elements of each training example are appended to these lists.
  targets, contexts, labels = [], [], []

  # Build the sampling table for vocab_size tokens.
  sampling_table = tf.keras.preprocessing.sequence.make_sampling_table(vocab_size)

  # Iterate over all sequences (sentences) in dataset.
  for sequence in tqdm.tqdm(sequences):

    # Generate positive skip-gram pairs for a sequence (sentence).
    positive_skip_grams, _ = tf.keras.preprocessing.sequence.skipgrams(
          sequence, 
          vocabulary_size=vocab_size,
          sampling_table=sampling_table,
          window_size=window_size,
          negative_samples=0)
    
    # Iterate over each positive skip-gram pair to produce training examples 
    # with positive context word and negative samples.
    for target_word, context_word in positive_skip_grams:
      context_class = tf.expand_dims(
          tf.constant([context_word], dtype="int64"), 1)
      negative_sampling_candidates, _, _ = tf.random.log_uniform_candidate_sampler(
          true_classes=context_class,
          num_true=1, 
          num_sampled=num_ns, 
          unique=True, 
          range_max=vocab_size, 
          seed=SEED, 
          name="negative_sampling")
      
      # Build context and label vectors (for one target word)
      negative_sampling_candidates = tf.expand_dims(
          negative_sampling_candidates, 1)

      context = tf.concat([context_class, negative_sampling_candidates], 0)
      label = tf.constant([1] + [0]*num_ns, dtype="int64")

      # Append each element from the training example to global lists.
      targets.append(target_word)
      contexts.append(context)
      labels.append(label)

  return targets, contexts, labels


# ## Prepare training data for Word2Vec

# With an understanding of how to work with one sentence for a skip-gram negative sampling based Word2Vec model, you can proceed to generate training examples from a larger list of sentences!

# ### Download text corpus
# 

# You will use a text file of Shakespeare's writing for this tutorial. Change the following line to run this code on your own data.

# In[50]:


path_to_file = 'input/item_sentence.txt'


# Read text from the file and take a look at the first few lines. 

# In[51]:


with open(path_to_file) as f: 
  lines = f.read().splitlines()
for line in lines[:2]:
  print(line)


# Use the non empty lines to construct a `tf.data.TextLineDataset` object for next steps.

# In[52]:


text_ds = tf.data.TextLineDataset(path_to_file).filter(lambda x: tf.cast(tf.strings.length(x), bool))


# ### Vectorize sentences from the corpus

# You can use the `TextVectorization` layer to vectorize sentences from the corpus. Learn more about using this layer in this [Text Classification](https://www.tensorflow.org/tutorials/keras/text_classification) tutorial. Notice from the first few sentences above that the text needs to be in one case and punctuation needs to be removed. To do this, define a `custom_standardization function` that can be used in the TextVectorization layer.

# In[53]:


# We create a custom standardization function to lowercase the text and 
# remove punctuation.
def custom_standardization(input_data):
  lowercase = tf.strings.lower(input_data)
  return tf.strings.regex_replace(lowercase,
                                  '[%s]' % re.escape(string.punctuation), '')

def custom_standardization(input_data):
  return input_data

# Define the vocabulary size and number of words in a sequence.
vocab_size = 200
sequence_length = 171

# Use the text vectorization layer to normalize, split, and map strings to
# integers. Set output_sequence_length length to pad all samples to same length.
vectorize_layer = TextVectorization(
    standardize=custom_standardization,
    max_tokens=vocab_size,
    output_mode='int',
    output_sequence_length=sequence_length)


# Call `adapt` on the text dataset to create vocabulary.
# 

# In[54]:


vectorize_layer.adapt(text_ds.batch(1024))


# Once the state of the layer has been adapted to represent the text corpus, the vocabulary can be accessed with `get_vocabulary()`. This function returns a list of all vocabulary tokens sorted (descending) by their frequency. 

# In[55]:


# Save the created vocabulary for reference.
inverse_vocab = vectorize_layer.get_vocabulary()
print(inverse_vocab[:20])


# The vectorize_layer can now be used to generate vectors for each element in the `text_ds`.

# In[56]:


def vectorize_text(text):
  text = tf.expand_dims(text, -1)
  return tf.squeeze(vectorize_layer(text))

# Vectorize the data in text_ds.
text_vector_ds = text_ds.batch(1024).prefetch(AUTOTUNE).map(vectorize_layer).unbatch()


# ### Obtain sequences from the dataset

# You now have a `tf.data.Dataset` of integer encoded sentences. To prepare the dataset for training a Word2Vec model, flatten the dataset into a list of sentence vector sequences. This step is required as you would iterate over each sentence in the dataset to produce positive and negative examples. 
# 
# Note: Since the `generate_training_data()` defined earlier uses non-TF python/numpy functions, you could also use a `tf.py_function` or `tf.numpy_function` with `tf.data.Dataset.map()`.

# In[57]:


sequences = list(text_vector_ds.as_numpy_iterator())
print(len(sequences))


# Take a look at few examples from `sequences`.
# 

# In[58]:


for seq in sequences[:2]:
  print(f"{seq} => {[inverse_vocab[i] for i in seq]}")


# ### Generate training examples from sequences

# `sequences` is now a list of int encoded sentences. Just call the `generate_training_data()` function defined earlier to generate training examples for the Word2Vec model. To recap, the function iterates over each word from each sequence to collect positive and negative context words. Length of target, contexts and labels should be same, representing the total number of training examples.

# In[59]:


targets, contexts, labels = generate_training_data(
    sequences=sequences, 
    window_size=2, 
    num_ns=4, 
    vocab_size=vocab_size, 
    seed=SEED)
print(len(targets), len(contexts), len(labels))


# ### Configure the dataset for performance

# To perform efficient batching for the potentially large number of training examples, use the `tf.data.Dataset` API. After this step, you would have a `tf.data.Dataset` object of `(target_word, context_word), (label)` elements to train your Word2Vec model!
# 
# https://stackoverflow.com/questions/63231811/valueerror-expect-x-to-be-a-non-empty-array-or-dataset-tensor-flow-lite-model
# BATCH_SIZE > size of training data??

# In[71]:


BATCH_SIZE = 512
BUFFER_SIZE = 10000
dataset = tf.data.Dataset.from_tensor_slices(((targets, contexts), labels))
dataset = dataset.shuffle(BUFFER_SIZE).batch(BATCH_SIZE, drop_remainder=True)
print(dataset)


# Add `cache()` and `prefetch()` to improve performance.

# In[72]:


dataset = dataset.cache().prefetch(buffer_size=AUTOTUNE)
print(dataset)


# ## Model and Training

# The Word2Vec model can be implemented as a classifier to distinguish between true context words from skip-grams and false context words obtained through negative sampling. You can perform a dot product between the embeddings of target and context words to obtain predictions for labels and compute loss against true labels in the dataset.

# ### Subclassed Word2Vec Model

# Use the [Keras Subclassing API](https://www.tensorflow.org/guide/keras/custom_layers_and_models) to define your Word2Vec model with the following layers:
# 
# 
# * `target_embedding`: A `tf.keras.layers.Embedding` layer which looks up the embedding of a word when it appears as a target word. The number of parameters in this layer are `(vocab_size * embedding_dim)`.
# * `context_embedding`: Another `tf.keras.layers.Embedding` layer which looks up the embedding of a word when it appears as a context word. The number of parameters in this layer are the same as those in `target_embedding`, i.e. `(vocab_size * embedding_dim)`.
# * `dots`: A `tf.keras.layers.Dot` layer that computes the dot product of target and context embeddings from a training pair.
# * `flatten`: A `tf.keras.layers.Flatten` layer to flatten the results of `dots` layer into logits.
# 
# With the sublassed model, you can define the `call()` function that accepts `(target, context)` pairs which can then be passed into their corresponding embedding layer. Reshape the `context_embedding` to perform a dot product with `target_embedding` and return the flattened result.

# Key point: The `target_embedding` and `context_embedding` layers can be shared as well. You could also use a concatenation of both embeddings as the final Word2Vec embedding.

# In[73]:


class Word2Vec(Model):
  def __init__(self, vocab_size, embedding_dim):
    super(Word2Vec, self).__init__()
    self.target_embedding = Embedding(vocab_size, 
                                      embedding_dim,
                                      input_length=1,
                                      name="w2v_embedding", )
    self.context_embedding = Embedding(vocab_size, 
                                       embedding_dim, 
                                       input_length=num_ns+1)
    self.dots = Dot(axes=(3,2))
    self.flatten = Flatten()

  def call(self, pair):
    target, context = pair
    we = self.target_embedding(target)
    ce = self.context_embedding(context)
    dots = self.dots([ce, we])
    return self.flatten(dots)


# ### Define loss function and compile model
# 

# For simplicity, you can use `tf.keras.losses.CategoricalCrossEntropy` as an alternative to the negative sampling loss. If you would like to write your own custom loss function, you can also do so as follows:
# 
# ``` python
# def custom_loss(x_logit, y_true):
#       return tf.nn.sigmoid_cross_entropy_with_logits(logits=x_logit, labels=y_true)
# ```
# 
# It's time to build your model! Instantiate your Word2Vec class with an embedding dimension of 128 (you could experiment with different values). Compile the model with the `tf.keras.optimizers.Adam` optimizer. 

# In[74]:


embedding_dim = 16
num_ns = 4
word2vec = Word2Vec(vocab_size, embedding_dim)
word2vec.compile(optimizer='adam',
              loss=tf.keras.losses.CategoricalCrossentropy(from_logits=True),
              metrics=['accuracy'])


# Also define a callback to log training statistics for tensorboard.

# In[75]:


tensorboard_callback = tf.keras.callbacks.TensorBoard(log_dir="logs")


# Train the model with `dataset` prepared above for some number of epochs.

# In[76]:


word2vec.fit(dataset, epochs=50, callbacks=[tensorboard_callback])


# In[70]:


print(dataset)


# Tensorboard now shows the Word2Vec model's accuracy and loss.

# ```python
# %tensorboard --logdir logs
# ```

# ![word2vec_tensorboard](images/word2vec_tensorboard.png)

# ## Embedding lookup and analysis

# Obtain the weights from the model using `get_layer()` and `get_weights()`. The `get_vocabulary()` function provides the vocabulary to build a metadata file with one token per line. 

# In[23]:


weights = word2vec.get_layer('w2v_embedding').get_weights()[0]
vocab = vectorize_layer.get_vocabulary()


# Create and save the vectors and metadata file. 

# In[26]:


out_v = io.open('input/vectors.tsv', 'w', encoding='utf-8')
out_m = io.open('input/metadata.tsv', 'w', encoding='utf-8')

for index, word in enumerate(vocab):
  if  index == 0: continue # skip 0, it's padding.
  vec = weights[index] 
  out_v.write('\t'.join([str(x) for x in vec]) + "\n")
  out_m.write(word + "\n")
out_v.close()
out_m.close()


# Download the `vectors.tsv` and `metadata.tsv` to analyze the obtained embeddings in the [Embedding Projector](https://projector.tensorflow.org/).

# ## Next steps
# 

# This tutorial has shown you how to implement a skip-gram Word2Vec model with negative sampling from scratch and visualize the obtained word embeddings.
# 
# * To learn more about word vectors and their mathematical representations, refer to these [notes](https://web.stanford.edu/class/cs224n/readings/cs224n-2019-notes01-wordvecs1.pdf).
# 
# * To learn more about advanced text processing, read the [Transformer model for language understanding](https://www.tensorflow.org/tutorials/text/transformer) tutorial.
# 
# * If you’re interested in pre-trained embedding models, you may also be interested in [Exploring the TF-Hub CORD-19 Swivel Embeddings](https://www.tensorflow.org/hub/tutorials/cord_19_embeddings_keras), or the [Multilingual Universal Sentence Encoder](https://www.tensorflow.org/hub/tutorials/cross_lingual_similarity_with_tf_hub_multilingual_universal_encoder)
# 
# * You may also like to train the model on a new dataset (there are many available in [TensorFlow Datasets](https://www.tensorflow.org/datasets)).
# 
