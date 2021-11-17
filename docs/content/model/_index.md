+++
title = "Model"
author = ["Jonghyun Yun"]
lastmod = 2021-09-28T17:15:39-05:00
draft = false
weight = 2
chapter = true
+++

<div class="ox-hugo-toc toc">
<div></div>

<div class="heading">Table of Contents</div>

- [Model V1](#model-v1)
    - [option1: similar items share the same action space](#option1-similar-items-share-the-same-action-space)
    - [option2: each item has its own action space (item-specific action space)](#option2-each-item-has-its-own-action-space--item-specific-action-space)
- [Model V2](#model-v2)
        - [pattern discovery](#pattern-discovery)
        - [justification + what item to use](#justification-plus-what-item-to-use)
    - [likelihood](#likelihood)
    - [prior](#prior)
    - [pseudo code](#pseudo-code)
        - [update \\(\kappa\_{m}\\)](#update-kappa-m)
        - [update \\(\tau\_{k}\\)](#update-tau-k)
        - [update \\(\theta\_{k}\\)](#update-theta-k)
        - [update \\(\sigma\\)](#update-sigma)
    - [data structure](#data-structure)
        - [msm R package](#msm-r-package)

</div>
<!--endtoc-->


# Model V1 {#model-v1}

See <sup id="ab214fb86f1e503f9acef6f714956ddc"><a href="#jackson_flexsurv_2016" title="Jackson, Flexsurv: {{A Platform}} for {{Parametric Survival Modeling}} in {{R}}, {J Stat Softw}, v(), (2016).">jackson_flexsurv_2016</a></sup> for available baseline functions.
Proportional baseline:
\\[
  \lambda\_{ml}(dt\_{k,n}) = \lambda\_{m0}(t) \lambda\_{l} \tau\_{k} \text{ for } l \in S\_{m} \text{and} \lambda\_{s\_{m,1}}=1.
\\]
\\(dt\_{k,n}\\) denotes t<sub>k,n</sub><sup>stop</sup> - t<sub>k,n</sub><sup>start</sup>

Proportional hazard term:
\\[
  e^{(\theta\_{k} + \beta) D\_{ml} }
\\]

-   add covariate later.

out-of-state, item, person parameters.

-   no incercept term in prop. hazard if baseline contains constant in the same level.
-   action m leads to more/less coherent action
-   \\(D\_{ml}\\) is bi-directional similarity mapping.
-   including \\(\beta\_m\\) doesn't make it directional.
-   is \\(\beta\_k\\) meaningful for item-specific action space? certainly not! this opens up the question about how actions should be defined. loosely defined without event\_desciption or not.


## option1: similar items share the same action space {#option1-similar-items-share-the-same-action-space}

no event description should be used.


## option2: each item has its own action space (item-specific action space) {#option2-each-item-has-its-own-action-space--item-specific-action-space}

-   use multi-state modeling framework to explain?
-   target journal:
-   grant application (check deadline)
-   meeting at 4pm (CST)
-   online learning platform: interaction with online resources, with instructors, with other people (communication length, contents) - team collaboration.
    -   data will be available on Aug.
    -   team science program (NIH)

The intensity function \\(q\_{ml}(\cdot)\\) represents the instantaneous risk of moving from action \\(m\\) to \\(l\\).

\begin{align\*}
  q\_{ml} (t ; \boldsymbol{\lambda}, \boldsymbol{\beta}, \mathbf{z}(t)) = & \lambda\_{ml}(t)  e^{\beta\_j + (\beta\_m +  \theta\_{\beta}) D\_{ml}},
\end{align\*}

where \\(\boldsymbol{\alpha}\\) is a vector of intercepts, and \\(\boldsymbol{\beta}\\) is coefficients associated with \\(\mathbf{z}(t)\\), \\(\lambda\_{k,m\rightarrow l}(t)\\) is a baseline intensity function. For each state \\(l\\), there are competing transitions \\(m\_1, \ldots, m\_{n\_l}\\). This mean there are \\(n\_{l}\\) corresponding survival models for state \\(l\\), and overall \\(K=\sum\_l n\_l\\) models. Models with no shared parameters can be estimated
Common out of state transition: \\(\beta\_{ml}=\beta\_{m}\\).

Baseline hazard:
\\[
  \lambda\_{ml}(t) = \alpha\_{m1}(t) \alpha\_{l} + \theta\_{\lambda} \text{ for } l \neq 1.
\\]
Proportional hazard term:
\\[
  e^{\beta\_j + (\beta\_m +  \theta\_{\beta}) D\_{ml}}
\\]

-   \\(D\_{ml}\\) is bi-directional similarity embedding between actions \\(m\\) and \\(l\\).

The piecewise-constant baseline hazard is used:

\begin{equation}
\label{eq:1}
\lambda(t) = \lambda\_j \text{ if } s\_{j-1} \le t < s\_{j},
\end{equation}

for \\(j = 1,\ldots,J\\). \\(\lambda\_{j}\\) could be a function of the similarity. This would be similar to have a piecewise constant transition matrix (time-inhomogeneous Markov chain), but much simpler as you have a parametric model for constants. The cosine similiarity should be normalized before used.

\begin{align\*}
  q\_{ml} (t ; \boldsymbol{\alpha}, \boldsymbol{\beta}, \mathbf{z}(t)) = & \lambda\_{ml}(t) \exp( \boldsymbol{\beta}\_{m,l}' \mathbf{z}\_{i,m,l}(t) ),
\end{align\*}

\begin{align\*}
  q\_{ml} (t ; \boldsymbol{\alpha}, \boldsymbol{\beta}, \mathbf{z}(t)) = & \lambda\_{k,m \rightarrow l}(t) \exp( \alpha\_m + \alpha\_l + \boldsymbol{\beta} d\_{i,m,l} ),
\end{align\*}

where \\(\boldsymbol{\alpha}\\) is a vector of intercepts, and \\(\boldsymbol{\beta}\\) is coefficients associated with \\(\mathbf{z}(t)\\), \\(\lambda\_{k,m\rightarrow l}(t)\\) is a baseline intensity function. For each state \\(l\\), there are competing transitions \\(m\_1, \ldots, m\_{n\_l}\\). This mean there are \\(n\_{l}\\) corresponding survival models for state \\(l\\), and overall \\(K=\sum\_l n\_l\\) models. Models with no shared parameters can be estimated separately.


# Model V2 {#model-v2}

Let \\(S\\) denotes a set of all possible action. For each state \\(m \in S\\), \\(A\_{m}\\) denotes a set of competing transitions \\(\\{l\_1, \ldots, l\_{n\_m}\\}\\) that can be taken directly after \\(m\\).
Let \\(Y\_k(t)\\) denote an action of k-th respondent at time \\(t\\). All respondents assmed to begin problem solving processes at time \\(t=0\\).

The intensity function \\(q\_{ml}(\cdot)\\) represents the instantaneous risk of moving from action \\(m\\) to \\(l\\):

\begin{align\*}
q\_{ml}\left(t ; \mathcal{F}\_{t}\right)= & \lim \_{\delta t \rightarrow 0} \frac{P\left(Y(t+\delta t)=l \mid Y(t)=m, \mathcal{F}\_{t}\right)}{\delta t}, m \neq l, m, l \in S,
\end{align\*}

where \\(\mathcal{F}\_t\\) denotes the process up to time \\(t\\).

Action transition is assumed to follow Semi-Markovian, which means the intensity depends on the sojourn time (\\(t - t\_{m}\\) ; time spent on the current action). This is often called "clock reset" approach as opposed to "clock forward" approach. Let \\(dt\_{m}\\) denote the sojourn time.

Cox model

\begin{align}
q\_{ml}\left(t ; \mathcal{F}\_{t}\right) = & q\_{ml} (t - t\_{m}; \boldsymbol{\lambda}, \boldsymbol{\beta}, \mathbf{z}(t))\\\\\\
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


### pattern discovery {#pattern-discovery}

-   divide tau by 1) number of actions
-   use 2) total time for visualization
-   1) divided by 2)
-   find persons (small # of actions, large # of actions: right vs wrong)
    -   시간이 많이 걸리고 맞은사람 vs 적게 걸리고 맞은 사람.
    -   적은 액션으로 맞은 사람 vs 많은 액션으로 틀린 사람.
-   무조건 빨리 푼다고 잘하는게 아니고, 느리거나 혹은 상이한 액션 개수로 정답에 이르는 프로세스 발견에 초점.


### justification + what item to use {#justification-plus-what-item-to-use}

select a few items fulfilling the justification sheme!

<https://cran.r-project.org/web/packages/tidyLPA/vignettes/Introduction%5Fto%5FtidyLPA.html>
세분화된 그룹 (더 많은 그룹) 이 있으면 OK

observed covaritates + response group classification
observed covaritates + tau and theta + response group classification

age control gender no significant
was gender diff in EDA, after age control no difference.

<https://data-edu.github.io/tidyLPA/reference/AHP.html>


## likelihood {#likelihood}

\begin{align\*}
    q\_{ml} (t ; \boldsymbol{\lambda}, \boldsymbol{\beta}, \mathbf{z}(t)) = & \lambda\_{ml}(t)  e^{(\boldsymbol{\beta}' \mathbf{z}(t) +  \theta\_{k}) D\_{ml}}\\\\\\
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
\pi\left(\kappa\_{m}\right) & \sim \operatorname{Gamma}\left(a\_{\kappa}, b\_{\kappa})\right); \\\\\\
\pi\left(\tau\_{k}\right) & \sim \operatorname{Gamma}\left(a\_{\kappa}, b\_{\kappa})\right); \\\\\\
\pi\left(\theta\_{k} | \sigma^{2}\right) & \sim \mathrm{N}\left(0, \sigma^{2}\right); \\\\\\
\pi\left(\sigma^{2}\right) & \sim \operatorname{lnv}-\operatorname{Gamma}\left(a\_{\sigma}, b\_{\sigma}\right); \\\\\\
\end{align\*}

inv-Gamma(&theta;|&alpha;,&beta;)
\\[
p(\theta)=\frac{\beta^{\alpha}}{\Gamma(\alpha)} \theta^{-(\alpha+1)} e^{-\beta / \theta}, \quad \theta>0
\\]

where hyperparameters are chosen as
\\[a\_{\sigma}=0.0001, b\_{\sigma}=0.0001, \mu\_{\theta}=0, \text { and } ....\\]

Based on our experience, the inference of \\(\mathbf{\Theta}\\) is highly sensitive to its variance \\(\sigma^2\\). Also, the configuration of latent embeddings highly depends on the scale parameter \\(\gamma\\) of the latent space. Rather than choosing sub-optimal tuning parameters, we use a layer of hyper-priors to learn optimal values of these parameters from data. We choose hyperparameters such that priors are minimally informative to facilitate the flexible Bayesian learning.


## pseudo code {#pseudo-code}

-   [3.2 Normal data with a noninformative prior distribution org-id:{ce3939d9-fb55-4b01-8747-0f486c98c9e7}:org-id](///Users/yunj/Zotero/storage/9D6G7MNF/gelman_bayesian_2014.pdf::79;;1)
-   [Continuous distributions org-id:{5c29e214-f86d-41d5-89a0-e164602bf6b8}:org-id](///Users/yunj/Zotero/storage/9D6G7MNF/gelman_bayesian_2014.pdf::591;;1)


### update \\(\kappa\_{m}\\) {#update-kappa-m}

-   all \\(k\\) person's having action m, all l &isin; A\_m (all possible actions that can jump from m)
-   transition start and stop time \\(dt\_{k,n}\\) for all \\(\delta\_{k,n,m} = 1\\)
-   For each \\(k,c\\), a symmetric MH jumping \\(J(\kappa\_{m}^{(l-1)} \rightarrow \kappa\_{m}^{\* })\\) is used to propose a new sample.
-   We accept \\(\kappa\_{m}^{(l)} = \kappa\_{m}^{\* }\\) with probability \\(\min(1, r\_{{\kappa\_{m}}^{\* }})\\) where

\begin{align\*}
\log r\_{{\kappa\_{m}}^{\* }} =&
\sum \delta\_{k,n,m} (\log \kappa\_{m}^{\* } - \log \kappa\_{m}^{(l-1)})\\\\\\
&-\sum dt (\kappa\_{m}^{\* } - \kappa\_{m}^{(l-1)}) \tau\_{k} e^{(\theta\_{k} + \beta) D\_{ml} }
+ \log \frac{\pi(\kappa\_{m}^{\* })}{\pi(\kappa\_{m}^{t})}.
\end{align\*}


### update \\(\tau\_{k}\\) {#update-tau-k}

-   all \\(k\\) person's m and l &isin; A\_m
-   all kth person's transition start and stop time

\begin{align\*}
\log r\_{{\tau\_{k}}^\*} =&
\sum \delta\_{k,n,m} (\log \tau\_{k}^\* - \log \tau\_{k}^{(l-1)})\\\\\\
&-\sum dt \kappa\_{m}e^{(\theta\_{k} + \beta) D\_{ml}} ( \tau\_{k}^\* -  \tau\_{k}^{(l-1)} )
+ \log \frac{\pi(\tau\_{k}^\*)}{\pi(\theta\_{k}^{t})}.
\end{align\*}


### update \\(\theta\_{k}\\) {#update-theta-k}

-   all \\(k\\) person's m and l &isin; A\_m
-   all kth person's transition start and stop time
-   For each \\(k\\), a symmetric MH jumping \\(J(\theta\_{k}^{(l-1)} \rightarrow \theta\_{k}^{\* }\\) is used to propose a new sample.
-   We accept \\(\theta\_{k}^{(l)} = \theta\_{k}^{\* }\\) with probability \\(\min(1, r\_{{\theta\_{k}}^{\* )}})\\) where

\begin{align\*}
\log r\_{{\theta\_{k}}^{\* }} =& \sum \delta\_{k,n,m} (\theta\_{k}^{\* } - \theta\_{k}^{(l-1)})D\_{ml}\\\\\\
&-\sum dt \kappa\_{m} \tau\_{k} e^{ \beta D\_{ml} }(e^{\theta\_{k}^{\* }D\_{ml}} -  e^{\theta\_{k}^{(l-1)} D\_{ml} })
+ \log \frac{\pi(\theta\_{k}^{\* })}{\pi(\theta\_{k}^{(l-1)})}.\\\\\\
\end{align\*}


### update \\(\sigma\\) {#update-sigma}

\\[
 p( \sigma^2|e.e.) \propto invGamma(\sigma^{2}|a,b) \prod N(\theta\_{k} | \mu, \sigma^2)
\\]
\\(\sigma^{2} \sim inv-gamma(a + 0.5 \* N, b + 0.5 + \sum \theta\_{k}^2)\\)
with flat prior:
\\(\sigma^{2} \sim inv-gamma(0.5 \* N, 0.5 + \sum \theta\_{k}^2)\\)


## data structure {#data-structure}


### msm R package {#msm-r-package}

<https://www.rdocumentation.org/packages/msm/versions/1.6.8/topics/msm2Surv>

```R
library(msm)
msmdat <- data.frame(
 subj = c(1, 1, 1, 1, 1, 2, 2, 2),
 days = c(0, 27, 75, 97, 1106, 0, 90, 1037),
 status = c(1, 2, 3, 4, 4, 1, 2, 2),
 age = c(66, 66, 66, 66, 69, 49, 49, 51),
 treat = c(1, 1, 1, 1, 1, 0, 0, 0)
)
# transitions only allowed to next state up or state 4
Q <- rbind(c(1, 1, 0, 1),
           c(0, 1, 1, 1),
           c(0, 0, 1, 1),
           c(0, 0, 0, 0))
dat <- msm2Surv(data=msmdat, subject="subj", time="days", state="status",
         Q=Q)
dat
attr(dat, "trans")
```
