import io

def tuple2file(fobj, fname):
  out_m = io.open(fname, 'w', encoding='utf-8')
  for vv in fobj:
    out_m.write('\t'.join([str(x) for x in vv]) + "\n")
  out_m.close()

with open('input/item_sentence.txt') as f:
    lines = f.readlines()

def convert(lst):
    return ' '.join(lst).split()

# Driver code
print(convert(lines))
words = convert(lines)

import nltk
from nltk.collocations import *
from nltk.collocations import BigramCollocationFinder
from nltk.collocations import TrigramCollocationFinder
from nltk.collocations import QuadgramCollocationFinder
from nltk.collocations import BigramAssocMeasures
from nltk.collocations import TrigramAssocMeasures
from nltk.collocations import QuadgramAssocMeasures
bigram_measures = nltk.collocations.BigramAssocMeasures()
trigram_measures = nltk.collocations.TrigramAssocMeasures()
quadgram_measures = nltk.collocations.QuadgramAssocMeasures()

piacc_stopwords = ["START", "END"]
stopset = set(piacc_stopwords)
filter_stops = lambda w: len(w) < 3 or w in stopset

biagram_collocation = BigramCollocationFinder.from_words(words)
biagram_collocation.apply_word_filter(filter_stops)
# biagram_collocation.nbest(BigramAssocMeasures.likelihood_ratio, 10)

scored = biagram_collocation.score_ngrams(bigram_measures.likelihood_ratio)
bi_ss = sorted(scored, key=lambda score: score[1], reverse = True)[0:10]

triagram_collocation = TrigramCollocationFinder.from_words(words)
triagram_collocation.apply_word_filter(filter_stops)
# triagram_collocation.nbest(TrigramAssocMeasures.likelihood_ratio, 15)
scored = triagram_collocation.score_ngrams(trigram_measures.likelihood_ratio)
tri_ss = sorted(scored, key=lambda score: score[1], reverse = True)[0:10]

quadagram_collocation = QuadgramCollocationFinder.from_words(words)
quadagram_collocation.apply_word_filter(filter_stops)
# quadagram_collocation.nbest(QuadgramAssocMeasures.likelihood_ratio, 10)
scored = quadagram_collocation.score_ngrams(quadgram_measures.likelihood_ratio)
quad_ss = sorted(scored, key=lambda score: score[1], reverse = True)[0:10]

tuple2file(bi_ss, "input/bi_ss.tsv")
tuple2file(tri_ss, "input/tri_ss.tsv")
tuple2file(quad_ss, "input/quad_ss.tsv")
