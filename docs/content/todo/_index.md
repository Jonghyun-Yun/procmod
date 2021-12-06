+++
title = "TODO"
author = ["Jonghyun Yun"]
lastmod = 2021-12-05T17:41:31-06:00
draft = false
weight = 1
chapter = true
+++

<div class="ox-hugo-toc toc">
<div></div>

<div class="heading">Table of Contents</div>

- [pattern discovery](#pattern-discovery)
- [justification + what item to use](#justification-plus-what-item-to-use)
    - [no gender effect?](#no-gender-effect)
- [cluster analysis](#cluster-analysis)
- [model validation](#model-validation)

</div>
<!--endtoc-->


# pattern discovery {#pattern-discovery}

-   divide tau by 1) number of actions
-   use 2) total time for visualization
-   1) divided by 2)
-   find persons (small # of actions, large # of actions: right vs wrong)
    -   시간이 많이 걸리고 맞은사람 vs 적게 걸리고 맞은 사람.
    -   적은 액션으로 맞은 사람 vs 많은 액션으로 틀린 사람.
-   무조건 빨리 푼다고 잘하는게 아니고, 느리거나 혹은 상이한 액션 개수로 정답에 이르는 프로세스 발견에 초점.


# justification + what item to use {#justification-plus-what-item-to-use}

select a few items fulfilling the justification sheme!

<https://cran.r-project.org/web/packages/tidyLPA/vignettes/Introduction%5Fto%5FtidyLPA.html>
분화된 그룹 (더 많은 그룹) 이 있으면 OK

observed covaritates + response group classification
observed covaritates + tau and theta + response group classification


## no gender effect? {#no-gender-effect}

Suppose a gender variable was significant RF for tau and theta.
this could be because of effect of other covariates
plot gender against tau or theta, and see if there was diff.
after control gender no significant
find gender diff in EDA, after age control no difference.

<https://data-edu.github.io/tidyLPA/reference/AHP.html>

Some items show the gender difference. However, they are not chosen ones for the further analysis.


# cluster analysis {#cluster-analysis}

characteristics of newly discovered groups using hidden traits
what these groups can tell you about???


# model validation {#model-validation}

see if we can use model validation tech for mutil-state survival model.
See [multi-state survival model validation](posts/.org): posterior predictive checking
