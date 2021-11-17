+++
title = "Model V1"
author = ["Jonghyun Yun"]
lastmod = 2021-09-28T17:15:45-05:00
draft = false
weight = 2
chapter = true
+++

<div class="ox-hugo-toc toc">
<div></div>

<div class="heading">Table of Contents</div>

- [option1: similar items share the same action space](#option1-similar-items-share-the-same-action-space)
- [option2: each item has its own action space (item-specific action space)](#option2-each-item-has-its-own-action-space--item-specific-action-space)

</div>
<!--endtoc-->

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


# option1: similar items share the same action space {#option1-similar-items-share-the-same-action-space}

no event description should be used.


# option2: each item has its own action space (item-specific action space) {#option2-each-item-has-its-own-action-space--item-specific-action-space}

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
