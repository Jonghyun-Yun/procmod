+++
title = "Draft"
author = ["Jonghyun Yun"]
lastmod = 2021-12-06T13:02:12-06:00
draft = false
weight = 3
chapter = false
+++

<div class="ox-hugo-toc toc">
<div></div>

<div class="heading">Table of Contents</div>

- [Introduction](#introduction)
- [Motivating example](#motivating-example)
    - [Problem Solving in Technology-Rich Environments](#problem-solving-in-technology-rich-environments)
- [Methods](#methods)
    - [Action embedding](#action-embedding)
    - [data structure](#data-structure)
    - [Multistate model](#multistate-model)
    - [likelihood](#likelihood)
    - [prior](#prior)
- [Estimation](#estimation)
    - [update \\(\kappa\_{m}\\):](#update-kappa-m)
    - [update \\(\tau\_{k}\\)](#update-tau-k)
    - [update \\(\theta\_{k}\\)](#update-theta-k)
    - [update \\(\sigma^{2}\\)](#update-sigma-2)
- [Application](#application)
    - [tickets](#tickets)
    - [party\_invitations-1](#party-invitations-1)
    - [book\_order](#book-order)
- [References](#references)

</div>
<!--endtoc-->


# Introduction {#introduction}

% Challenges
While the availability of rich response process data during problem solving comes the great challenge of building appropriate psychometric models to analyze these data.
The raw process data are usually formatted as lines of coded and time-stamped strings.
The vast amount of data on students' potential trial-and-error process makes it less than straightforward to detect patterns in problem solving.

% Exisitng methods and limitations
Several data analysis techniques and models have been explored to uncover problem-solving patterns. For example, researchers used methods such as cluster analysis (Bergner, Shu, \\& von Davier, 2014) and editing distance (Hao, Shu, Bergner, Zhu, \\& von Davier, 2014).
Other researchers explored the method of combining Markov movesl and item response theory (IRT) framework. Process mining techniques such as Petri net were also used to study behavioral patterns (Howard, Johnson, \\& Neitzel, 2010).
In addition, researchers used digraphs to visualize and analyze sequential process data collected from assessment.
Zhu, Shu, and von Davier (2016) used network visualization and analysis for understanding process data.

An important advantage of our approach is the introduction of a virtual Euclidean map of the interplay between actions. This interactive map could offer substantially enhanced insights into how and why learners are different in their response behavior on the current PS-TRE assessment.

A second advantage of our approach is that we can easily link with test takers’ performance outcomes, their background information, as well as any technical accommodations they utilized during the test, which allows educators to identify which accommodations might be more effective than others in helping learners to display their full ability within the digitalized assessment environment.


# Motivating example {#motivating-example}


## Problem Solving in Technology-Rich Environments {#problem-solving-in-technology-rich-environments}

OECD Survey of Adult Skills (PIAAC) Log Data

The OECD Survey of Adult Skills (PIAAC) assesses the proficiency of adults in information processing skills. During the PIAAC assessement, user interactions were logged automatically. This means that most of the users’ actions within the assessment tool were recorded and stored with time stamps in separate files called log files.

> This refers to the ability to use technology to solve problems and accomplish complex tasks. It is not a measurement of “computer literacy”, but rather of the cognitive skills required in the information age – an age in which the accessibility of boundless information has made it essential for people to be able to decide what information they need, to evaluate it critically, and to use it to solve problems. In this survey, higher-order skills are identified along with basic proficiency.

<!--quoteend-->

> The availability of these log files offers new opportunities to researchers, for instance to reproduce test-taking behavior of individuals and to better understand test-taking behavior.

These data opens new research opportunities to researchers, for instance to better understand test-taking behavior.

[Questions we like to answer (from Dr. Jeon's proposal)](posts/.org)

-   which sequences or actions are effective? given the person's ability and item difficulty
-   is the same sequence (strategy) effective for all items or not?
-   is the same sequence effective for all people?
-   if effective sequences are not the same across all items, can we extract some common features of effective sequences ?
-   which sequences or actions are more or less effective for students with disability?
-   any other person covariates? ability? that is, does the effectiveness of sequences depend on person abilities? (interaction between sequence and ability)
-   does the effect of the sequence change depending on how long it took? for instance,  when it was taken in a shorter time, a sequence might have a positive effect, while it might have a negative effect when it was taken in a longer time.
-   instead of using the log time (continuous), it may be better or useful to use a categorical variable?
-   the effect of sequences on the success probability may be a function of item difficulty or other item features, for instance, item position, item types (e.g., multiple-choice vs. open-ended), item contents (algebra, geometry) ?

Ticket data is a task included in PIACC's probem solving in technology-rich environments (PS-TRE) items. The PS-TRE aims to measure cognitive skills such as the ability to decide what information they need, to evaluate it critically, and to use it to solve problems. The ticket data is download from <https://piaac-logdata.tba-hosting.de/>.

The data  involves  a  scenario  in  which  the respondent  is asked to reserve all fooball game tickets that an entire group can attend. A group of friend provides thier availabilities via an online calendar. Respondents  access  and  evaluate  information from ticket-reservation web pages and online calendars in simulated web environment as shown in Figure~[1](#orga8e6bc4). Respondents are able to:

-   Click on tabs for ticket reservation web pages and online calendar;
-   Click on checkboxes to choose game dates;
-   Manipulate drop-down menus for events, locations, and number of tikcets; and
-   Click on menu items or navigation buttons.

<a id="orga8e6bc4"></a>

{{< figure src="/ox-hugo/tickets_demo.png" caption="Figure 1: Ticket data: an example of PS-TRE items. In this simulated web environment, respondents can access information required for ticket reservation." >}}

A action sequence is concatenated into a long string while each action is separted by a white space.
How to call this long string?
This is similar that to form a single sentence

<a id="table--tab:df-action"></a>
<div class="table-caption">
  <span class="table-number"><a href="#table--tab:df-action">Table 1</a></span>:
  An example action sequence of one respondent. A sequence of actions (2nd column) taken is recorded with timestamp (3rd column).
</div>

| ID   | Action                            | Time (sec) |
|------|-----------------------------------|------------|
| 4016 | START                             | 0.0        |
| 4016 | COMBOBOX-default\_menu1.index=7   | 47.3       |
| 4016 | COMBOBOX-default\_menu2.index=2   | 51.8       |
| 4016 | BUTTON\_search-default\_txt23     | 65.0       |
| 4016 | CHECKBOX-check2                   | 93.2       |
| 4016 | BUTTON\_available-pg1\_txt47      | 96.0       |
| 4016 | BUTTON\_available-pg7\_txt47      | 108.2      |
| 4016 | COMBOBOX-pg2\_menu1.index=19      | 136.7      |
| 4016 | COMBOBOX-pg2\_menu6.index=19      | 144.5      |
| 4016 | BUTTON\_submit-pg2\_txt33         | 146.1      |
| 4016 | BUTTON\_submit\_ok-u21p2pu5\_txt2 | 148.9      |
| 4016 | NEXT\_INQUIRY-REQUEST             | 155.8      |
| 4016 | END                               | 157.3      |

There are 172 unique observed actions.
On average, repondents spend 182 (IQR: 107) seconds on this time, and take 23 (IQR: 10) actions.

The process data consists of pairs of actions and time stamps of each respondents.
Major challenges to establish a statistcal model taking the process data as an input are 1) unequal length of respondents' actions sequences; 2) large number of distinct actions transitions; and 3) ...

Thanks to the recent development of natual language processing


# Methods {#methods}

We propose to develop a new modeling framework for analyzing time-stamped sequences of actions taken by PS-TRE test takers. The innovative aspect of our proposal is that we view test takers’ sequences of actions collected in the computer-assisted PS-TRE assessment system as ????? of possible actions.  With our framework, researchers and policymakers can quantify and better understand how learners with disabilities (??) process mathematics test items.

Let \\(S\\) denotes a set of all possible action. For each state \\(m \in S\\), \\(A\_{m}\\) denotes a set of competing transitions \\(\\{l\_1, \ldots, l\_{n\_m}\\}\\) that can be taken directly after \\(m\\).
Let \\(Y\_k(t)\\) denote an action of k-th respondent at time \\(t\\).The $k$-th respondent takes a sequence of \\(M\_{k}\\) actions. We use \\(S\_{k} = \\{y\_{k}(t\_{k,1}),y\_{k}(t\_{k,2}),\ldots, y\_{k}(t\_{k,M\_{k}})\\}\\) to denote the $k$-th respondent's action sequence.

We define \\(  \delta\_{k,n,m} = 1 \\) if person k's n-th action is m; 0 otherwise. Thus, \\( \delta\_{k,n,m}  \delta\_{k,n+1,l} = 1 \\) menas person k's n-th transition (\\(n < M\_{k}\\)) is m to l.
Respondents assumed to begin problem solving processes at time \\(t=0\\).

Let \\(t\_{k,n}\\) denote entry time that the \\(k\\)-th respondent start the $n$-th action. The sojourn time is denoted by \\(dt\_{k,n} = t\_{k,n+1} - t\_{k,n}\\) for \\(n < M\_{k} - 1\\).


## Action embedding {#action-embedding}

A goal for action embedding is to substitute a symbolic representation with a vectoric representation of actions. Similar tasks are taken for natual language processing is called word embedding.

Actions that tend to “behave similarly (_need better term_)” end up close to one another in the embedding space. Instead of using the action symbol as a feature in the model, we can use its vector to exploit such similarities.

\\[
  p\left(w\_{j} \mid w\_{0}, u, v\right)=\frac{\exp \left(u\left(w\_{0}\right)^{\top} v\left(w\_{j}\right)\right)}{\sum\_{w \in V} \exp \left(u\left(w\_{0}\right)^{\top} v(w)\right)}
\\]
where \\(u: V \rightarrow \mathbb{R}^{k} \\) and \\(v: V \rightarrow \mathbb{R}^{k}\\) are functions which map words to a word embedding—one for the pivot words, and the other for context.

Word2Vec <mikolov_distributed_2013> .

-   word2vec: skip-gram models coupled with negative sampling
-   negative sampling: to reduce computational cost of the cosine similarity (the denominator is summation of all words in vocabulary).
-   skip-gram: to maximize the probability of predicting context words given a target word. The probability is defined by the cosine similarity (softmax function) based on word embeddings. Words close in the Euclidean space are words 1) with similar meanings, 2) associated with the same part of a sentence, 3) with semantic association. The similarity can be learned from a large corpus. Unseen words in the training sample are embedded, so one can exploit the similarity information.
-   a bag-of-words (CBOW): to predict a target word given context words (neighbor of a target word)

Continuous Skip-gram Model which predict words within a certain range before and after the current word in the same sentence. While a bag-of-words model predicts a word given the neighboring context, a skip-gram model predicts the context (or neighbors) of a word, given the word itself. The model is trained on skip-grams, which are n-grams that allow tokens to be skipped (n-gram is a contiguous sequence of n items from a given sample of text or speech). The context of a word can be represented through a set of skip-gram pairs of `(target_word, context_word)` where `context_word` appears in the neighboring context of `target_word`.

The context words for each of the 8 words of this sentence are defined by a window size. The window size determines the span of words on either side of a `target_word` that can be considered context word. Take a look at this table of skip-grams for `target_words` based on different window sizes.

The training objective of the skip-gram model is to maximize the probability of predicting context words given the target word. For a sequence of words, the objective can be written as the average log probability
\\[
\frac{1}{T} \sum\_{t=1}^{T} \sum\_{-c \leq j \leq c, j \neq 0} \log p\left(w\_{t+j} \mid w\_{t}\right)
\\]
where `c` is the size of the training context. The basic skip-gram formulation defines this probability using the softmax function.
\\[
p\left(w\_{O} \mid w\_{I}\right)=\frac{\exp \left(v\_{w\_{O}}^{\prime}{ }^{\top} v\_{w\_{I}}\right)}{\sum\_{w=1}^{W} \exp \left(v\_{w}^{\prime}{ }^{\top} v\_{w\_{I}}\right)}
\\]
where \\(u: V \rightarrow \mathbb{R}^{k} \\) and \\(v: V \rightarrow \mathbb{R}^{k}\\) are functions which map words to a word embedding.

Word embeddings tend to cluster together when the words they denote behave similarly. The notion of “behavior” in this case usually remains underspecified, but could refer to syntactic categorization (i.e., words most often associated with the same part of speech will cluster together) or semantic association (words that are semantically related cluster together). The similarity between word embedding vectors is often measured through such measures as the dot product or cosine similarity.
Most prominently, word embeddings assist with the treatment of words which do not appear in the training data of a given problem (such as parsing or part-of-speech tagging). The word embedding function can be learned by exploiting co-occurence data on a large corpus (without any annotation), and thus the vocabulary over which the word embedding function is constructed is larger than the one that the training data consists of, and covers a significant amount of the words in the test data, including “unseen words.” The reliance on co-occurrence statistics is based on the distributional hypothesis (Harris, 1954) which states that co-occurrence of words in similar contexts implies that they have similar meanings.
This model learns parameters that lead to a high-valued dot product for embeddings of frequently co-occuring pivot and context words (as the probability is pushed to the maximum in such cases). Therefore, through the contexts, words that are similar to each other in their co-occurrence patterns map to vectors that are close to each other in the Euclidean space.
Skip-gram modeling of the above form coupled with negative sampling is often referred to as one of the `word2vec` models <mikolov_distributed_2013>. A second proposed model of word2vec is the continuous bag-of-words model (CBOW), which predicts a word from the context—in reverse from the skip-gram model.

[Word2Vec | Skip-grams | TensorFlow Core](posts/.org)

How to convert an action sequence to a sequence
skip-gram
negative sampling
cosine similarity


## data structure {#data-structure}

<https://www.rdocumentation.org/packages/msm/versions/1.6.8/topics/msm2Surv>
Given a configured transition matrix, \texttt{msm} <&jackson_multi-state_2011>

transform data to a desired "long" format:

| person | entry | exit | from | to | observed | cov1           | cov2                   | time cov |
|--------|-------|------|------|----|----------|----------------|------------------------|----------|
| 1      | 0     | 10   | 1    | 2  | 1        | D<sub>12</sub> | &theta; D<sub>12</sub> |          |
| 1      | 0     | 10   | 1    | 3  | 0        | D<sub>12</sub> | &theta; D<sub>12</sub> |          |


## Multistate model {#multistate-model}

The intensity function \\(q\_{ml}(\cdot)\\) represents the instantaneous risk of moving from action \\(m\\) to \\(l\\):

\begin{align\*}
q\_{ml}\left(t ; \mathcal{F}\_{t}\right)= & \lim \_{\delta t \rightarrow 0} \frac{P\left(Y(t+\delta t)=l \mid Y(t)=m, \mathcal{F}\_{t}\right)}{\delta t}, m \neq l, m, l \in S,
\end{align\*}

where \\(\mathcal{F}\_t\\) denotes the process up to time \\(t\\).

Action transition is assumed to follow Semi-Markovian, which means the intensity depends on the sojourn time (\\(t - t\_{m}\\) ; time spent on the current action). This is often called "clock reset" approach as opposed to "clock forward" approach. Let \\(dt\_{m}\\) denote the sojourn time.

Cox model

\begin{align}
q\_{ml}\left(t ; \mathcal{F}\_{t}\right) = & q\_{ml} (t - t\_{m}; \boldsymbol{\lambda}, \boldsymbol{\beta}, \mathbf{z}(t))\\\\
= & \lambda\_{ml}(dt\_{m})  e^{(\boldsymbol{\beta}' \mathbf{z}(t) +  \theta\_{k}) D\_{ml}},
\end{align}

for person \\(k = 1,\ldots,N\\), where \\(\mathbf{z}(t)\\) is time-varying covariates, \\(\lambda\_{kml}(t)\\) is a baseline intensity function, \\(D\_{ml} \in [-1,1]\\) denotes the cosine similarity between actions \\(m\\) and \\(l\\). The cosine similarity is obtained using `word2vec` on action sequences of an item. The closer the cosine value to 1, the greater the similarity between actions. The closer the cosine value to -1, the greater the dis-similarity between actions. This mean there are \\(n\_{m}\\) corresponding intensity functions for state \\(m\\), and overall \\(\sum\_{m in S} n\_m\\) intensity functions.

We use the constant baseline hazard based on out-of-state transition speed and person's transition speed:
\\[
  \lambda\_{ml}(dt) = \kappa\_{m} \tau\_{k} \text{ for } l \in A\_{m}.
\\]

A running model has no coviarate terms:
\\[
q\_{ml}\left(t ; \mathcal{F}\_{t}\right) = q\_{ml}(dt) = \kappa\_{m} \tau\_{k} e^{\theta\_{k} D\_{ml} }.
\\]

-   larger \\(\kappa\_{m}\\) shorter time staying on action \\(m\\) (faster out-of-state transition)
-   larger \\(\tau\_{k}\\), faster transition speed
-   larger \\(\theta\_{k}\\), larger trasition rate towards a similar action. A person with large \\(\theta\_{k}\\) tends to choose more coherent actions


## likelihood {#likelihood}

\begin{align\*}
    q\_{ml} (t ; \boldsymbol{\lambda}, \boldsymbol{\beta}, \mathbf{z}(t)) = & \lambda\_{ml}(t)  e^{(\boldsymbol{\beta}' \mathbf{z}(t) +  \theta\_{k}) D\_{ml}}\\\\
q\_{ml}\left(t ; \mathcal{F}\_{t}\right)= & \lim \_{\delta t \rightarrow 0} \frac{P\left(Y(t+\delta t)=l \mid Y(t)=m, \mathcal{F}\_{t}\right)}{\delta t}, m \neq l, m, l \in S
\end{align\*}

The survival function is
\\[
  S\_{ml}(dt) = e^{-\int\_{0}^{dt\_{m}} q\_{ml}(x) \dd x}.
\\]
Let \\(\nu\_{mlk}(t) = 1\\) if person \\(k\\) jump from actions \\(m\\) to \\(l\\) at time \\(t\\); 0 otherwise.
\\[
  f\_{ml}(t) = q\_{ml}(t) S\_{ml}(t)
\\]
\\[
  likelihood =\prod\_{k} f\_{ml}(dt) \prod\_{g \in A\_{m}} S\_{mg}(t),
\\]
\\[
  f\_{ml} = q\_{ml}(t) S\_{ml}(t),
  S\_{ml}(t) = e^{-\int\_{0}^{t^{stop} - t^{start}} q\_{ml}(t)\dd t}
\\]

\\[
  S\_{ml}(dt) =  e^{-dt \kappa\_{m} \omega\_{l} \tau\_{k} e^{(\theta\_{k} + \beta) D\_{ml} }}
\\]

\\(n = 1,\ldots,M\_{k}\\): n-th action of k-th person, \\(M\_k\\): sequence length

\\(  \delta\_{k,n,m} = 1 \\) if person k's n-th action is m.

\\( \delta\_{k,n,m}  \delta\_{k,n+1,l} = 1 \\) for \\(n < M\_{k}\\) if person k's n-th transition is m to l.

time at starting state (one after START) is set to the first action (n=1), and the corresponding time is set to 0.


## prior {#prior}

The proposed method use a fully Bayesian approach for estimating the proposed latent space model, using MCMC methods. Our prior specification is as follows:

\begin{align\*}
\pi\left(\kappa\_{m}\right) & \sim \operatorname{Gamma}\left(a\_{\kappa}, b\_{\kappa})\right); \\\\
\pi\left(\tau\_{k}\right) & \sim \operatorname{Gamma}\left(a\_{\kappa}, b\_{\kappa})\right); \\\\
\pi\left(\theta\_{k} | \sigma^{2}\right) & \sim \mathrm{N}\left(0, \sigma^{2}\right); \\\\
\pi\left(\sigma^{2}\right) & \sim \operatorname{lnv}-\operatorname{Gamma}\left(a\_{\sigma}, b\_{\sigma}\right); \\\\
\end{align\*}

inv-Gamma(&theta;|&alpha;,&beta;)
\\[
p(\theta)=\frac{\beta^{\alpha}}{\Gamma(\alpha)} \theta^{-(\alpha+1)} e^{-\beta / \theta}, \quad \theta>0
\\]

where hyperparameters are chosen as
\\[a\_{\sigma}=0.0001, b\_{\sigma}=0.0001, \mu\_{\theta}=0, \text { and } ....\\]

Based on our experience, the inference of \\(\mathbf{\Theta}\\) is highly sensitive to its variance \\(\sigma^2\\). Also, the configuration of latent embeddings highly depends on the scale parameter \\(\gamma\\) of the latent space. Rather than choosing sub-optimal tuning parameters, we use a layer of hyper-priors to learn optimal values of these parameters from data. We choose hyperparameters such that priors are minimally informative to facilitate the flexible Bayesian learning.


# Estimation {#estimation}

-   [3.2 Normal data with a noninformative prior distribution org-id:{ce3939d9-fb55-4b01-8747-0f486c98c9e7}:org-id](///Users/yunj/Zotero/storage/9D6G7MNF/gelman_bayesian_2014.pdf::79;;1)
-   [Continuous distributions org-id:{5c29e214-f86d-41d5-89a0-e164602bf6b8}:org-id](///Users/yunj/Zotero/storage/9D6G7MNF/gelman_bayesian_2014.pdf::591;;1)


## update \\(\kappa\_{m}\\): {#update-kappa-m}

For each \\(m\\), we draw \\(\kappa\_m^{(t)}\\) from
\\(\mbox{Gamma}\left(  a\_{\tau} + \sum\_{n=1}^{M\_{k}} \sum\_{k=1}^N \mbox{I}(\delta\_{k,n,m} = 1) ,b\_{\tau} + \sum\_{n=1}^{M\_{k}-1}\sum\_{k=1}^{N} \sum\_{ l \in A\_m } dt\_{k,n} \tau\_{k}e^{(\theta\_{k} + \beta) D\_{ml}}\right)\\)

```cpp
  double post_a = a_kappa + 1.0;
  double post_b = b_kappa;
  for (auto &ii : oos_m) {
    if (status.at(ii)==1) post_a += 1.0;
    post_b += tdiff(ii) * tau(sid.at(ii)) * std::exp((theta(sid.at(ii)) + beta) * dist(ii));
  }
  kappa = stan::math::gamma_rng(post_a, post_b, rng);
```


## update \\(\tau\_{k}\\) {#update-tau-k}

For each \\(k\\), we draw \\(\tau\_k^{(t)}\\) from
\\(\mbox{Gamma}\left(  a\_{\tau} + M\_k, b\_{\tau} + \sum\_{n=1}^{M\_{k}} \sum\_{m \in S, l \in A\_m } dt\_{k,n} \kappa\_{m}e^{(\theta\_{k} + \beta) D\_{ml}}\right)\\)

```cpp
double post_a = a_tau + 1.0;
double post_b = b_tau;
for (auto &ii : person_k) {
    if (status.at(ii) == 1)
        post_a += 1.0;
    post_b +=
        tdiff(ii) * kappa(acfrom.at(ii)) * std::exp((theta_k + beta) * dist(ii));
}
tau = stan::math::gamma_rng(post_a, post_b, rng);
```


## update \\(\theta\_{k}\\) {#update-theta-k}

For each \\(k\\), we draw \\(\theta\_k^{\* }\\)$ from a symmetric MH jumping distribution, and accept \\(\theta\_{m}^{(l)} = \theta\_{m}^{\* }\\) with probability \\(\min(1, r\_{{\theta\_{m}}^{\* }})\\) where

\begin{align\*}
\log r\_{{\theta\_{k}}^{\* }} =& \sum\_{m \in S} \sum\_{n=1}^{M\_{k}} \left[ \delta\_{k,n,m} (\theta\_{k}^{\* } - \theta\_{k}^{(l-1)})D\_{ml} -\sum\_{l \in A\_m} dt\_{k,n} \kappa\_{m} \tau\_{k} e^{ \beta D\_{ml} }(e^{\theta\_{k}^{\* }D\_{ml}} -  e^{\theta\_{k}^{(l-1)} D\_{ml} }) + \log \frac{\pi(\theta\_{k}^{\* })}{\pi(\theta\_{k}^{(l-1)})} \right].\\\\
\end{align\*}


## update \\(\sigma^{2}\\) {#update-sigma-2}

We draw \\((\sigma^{2})^{(t)}\\) from
\\[
 p( \sigma^2|e.e.) \propto \mbox{Inv-Gamma}(\sigma^{2}|a,b) \prod N(\theta\_{k} | \mu, \sigma^2)
\\]
\\(\sigma^{2} \sim \mbox{Inv-Gamma}(a + 0.5 \* N, b + 0.5 + \sum \theta\_{k}^2)\\)
c.f) with flat prior:
\\(\sigma^{2} \sim inv-gamma(0.5 \* N, 0.5 + \sum \theta\_{k}^2)\\)

\\(\mbox{Inv-Gamma}(\alpha,\beta)\\) denotes the inverse gamma distribution with a density
\\[
\mbox{Inv-Gamma}(y|\alpha,\beta) = \frac{\beta^{\alpha}}{\Gamma(\alpha)} y^{-(\alpha+1)} \exp \left(-\beta \frac{1}{y}\right).
\\]


# Application {#application}


## tickets {#tickets}

```sh
out_dir="tickets/"
cd $out_dir
cd figure
convert -density 300 tau_action.pdf tau_action.png
convert -density 300 theta_tau_res.pdf theta_tau_res.png
convert -density 300 time_action_more.pdf time_action_more-%d.png
convert -density 300 time_action.pdf time_action-%d.png
```

```R
ftime = timestamp[1] / 1000, naction = n(), time = timestamp[n()] / 1000, spd = naction / (ftime - time)
```

-   &tau;: person's baseline hazard for action transition
-   &theta;: person's xxx to jump to a similar action for the next one

|Name        |Label                                                                               |Value scheme                                          |
|:-----------|:-----------------------------------------------------------------------------------|:-----------------------------------------------------|
|AGEG5LFS    |Age groups in 5-year intervals based on LFS groupings (derived)                     |Derived - Age groups in equal 5 year intervals (1-10) |
|NFEHRS      |Number of hours of participation in non-formal education (derived)                  |NA                                                    |
|EARNHRDCL   |Hourly earnings excluding bonuses for wage and salary earners, in deciles (derived) |Derived - Decile                                      |
|LEARNATWORK |Index of learning at work (derived)                                                 |NA                                                    |
|ICTHOME     |Index of use of ICT skills at home (derived)                                        |NA                                                    |
|ICTWORK     |Index of use of ICT skills at work (derived)                                        |NA                                                    |
|INFLUENCE   |Index of use of influencing skills at work (derived)                                |NA                                                    |
|NUMHOME     |Index of use of numeracy skills at home (basic and advanced - derived)              |NA                                                    |
|NUMWORK     |Index of use of numeracy skills at work (basic and advanced - derived)              |NA                                                    |
|READHOME    |Index of use of reading skills at home (prose and document texts - derived)         |NA                                                    |
|READWORK    |Index of use of reading skills at work (prose and document texts - derived)         |NA                                                    |
|TASKDISC    |Index of use of task discretion at work (derived)                                   |NA                                                    |
|WRITHOME    |Index of use of writing skills at home (derived)                                    |NA                                                    |
|WRITWORK    |Index of use of writing skills at work (derived)                                    |NA                                                    |

![](/ox-hugo/lpa_plot-0.png)
![](/ox-hugo/lpa_plot-1.png)

{{< figure src="/ox-hugo/lpa_back_line.png" >}}

Response: the smaller, the better

## mean


|        tau|      theta|    naction|        spd|      res|
|----------:|----------:|----------:|----------:|--------:|
| -0.4123013|  0.1939430|  0.0105633|  0.2949513| 3.710588|
|  0.9344900| -0.6655596|  0.3971435|  0.1263112| 5.219081|
|  1.1296467| -1.7866636| -1.9230219| -1.9932064| 7.000000|
| -0.9718218|  1.3403763|  0.1527688| -0.0648598| 3.145251|

## sd


|       tau|    theta|   naction|       spd|      res|
|---------:|--------:|---------:|---------:|--------:|
| 0.4111353| 0.384638| 0.6375695| 0.2628682| 2.989527|
| 0.9065238| 0.553052| 1.2095532| 0.3520752| 2.745995|
| 0.9047816| 1.085768| 0.1671354| 2.6734464| 0.000000|
| 0.2688267| 0.354953| 0.5181867| 0.3940398| 2.883724|

## n


| tau| theta| naction| spd| res|
|---:|-----:|-------:|---:|---:|
| 425|   425|     425| 425| 425|
| 283|   283|     283| 283| 283|
|  75|    75|      75|  75|  75|
| 179|   179|     179| 179| 179|

&tau;'s covaritates:
&theta;'s covaritates:
![](/ox-hugo/theta_tau_res.png)
![](/ox-hugo/tau_action.png)
![](/ox-hugo/time_action-3.png)
![](/ox-hugo/time_action_more-2.png)
![](/ox-hugo/time_action_more-5.png)
![](/ox-hugo/time_action_more-7.png)
![](/ox-hugo/time_action_more-8.png)
![](/ox-hugo/time_action_more-9.png)
![](/ox-hugo/time_action_more-10.png)
![](/ox-hugo/time_action_more-11.png)
![](/ox-hugo/time_action_more-13.png)


## party\_invitations-1 {#party-invitations-1}

![](/ox-hugo/lpa_plot-0.png)
![](/ox-hugo/lpa_plot-1.png)

{{< figure src="/ox-hugo/lpa_back_line.png" >}}

Response: the larger, the better


### clustering w/ tau and theta


|          tau|        theta|      naction|           spd|         res|             n|
|------------:|------------:|------------:|-------------:|-----------:|-------------:|
|  2.06 (1.10)| -1.49 (0.96)|  0.08 (3.72)| -4.43 (11.77)| 0.43 (1.13)|   7.00 (0.00)|
|  0.02 (0.65)|  0.63 (0.43)| -0.21 (0.38)|   0.03 (0.00)| 2.77 (0.56)| 443.00 (0.00)|
| -0.65 (0.57)| -0.58 (1.11)| -0.28 (0.70)|   0.03 (0.00)| 1.18 (1.32)| 309.00 (0.00)|
|  0.83 (1.33)| -0.43 (0.89)|  0.84 (1.51)|   0.03 (0.00)| 1.90 (1.24)| 211.00 (0.00)|

### clustering w/o tau and theta


|      naction|          spd|      CPROB1|      CPROB2|         res|             n|
|------------:|------------:|-----------:|-----------:|-----------:|-------------:|
|  1.82 (4.16)| -3.09 (9.85)| 0.98 (0.05)| 0.02 (0.05)| 0.70 (1.25)|  10.00 (0.00)|
| -0.02 (0.90)|  0.03 (0.00)| 0.00 (0.01)| 1.00 (0.01)| 2.07 (1.23)| 960.00 (0.00)|


## book\_order {#book-order}

![](/ox-hugo/lpa_plot-0.png)
![](/ox-hugo/lpa_plot-1.png)

{{< figure src="/ox-hugo/lpa_back_line.png" >}}

Response: the larger, the better


### w/ tau and theta


|          tau|        theta|      naction|          spd|         res|             n|
|------------:|------------:|------------:|------------:|-----------:|-------------:|
| -0.18 (0.88)|  0.37 (0.49)|  0.21 (0.68)|  0.11 (0.42)| 2.27 (2.45)| 450.00 (0.00)|
|  0.83 (1.06)| -1.67 (0.83)| -1.34 (0.12)| -0.25 (0.80)| 6.32 (1.92)|  88.00 (0.00)|
|  0.31 (1.32)| -0.79 (1.73)|  0.95 (2.48)| -0.96 (3.97)| 4.23 (3.05)|  26.00 (0.00)|

### w/o tau and theta


|      naction|          spd|      CPROB1|      CPROB2|         res|             n|
|------------:|------------:|-----------:|-----------:|-----------:|-------------:|
| -0.04 (0.83)|  0.08 (0.45)| 0.99 (0.03)| 0.01 (0.03)| 2.91 (2.80)| 535.00 (0.00)|
|  0.73 (2.54)| -1.45 (3.73)| 0.11 (0.16)| 0.89 (0.16)| 4.52 (3.01)|  29.00 (0.00)|


# References {#references}

<~/Zotero/myref.bib>
