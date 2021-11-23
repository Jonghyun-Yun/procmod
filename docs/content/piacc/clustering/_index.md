+++
title = "clustering"
author = ["Jonghyun Yun"]
lastmod = 2021-11-23T15:07:49-06:00
draft = false
weight = 1
chapter = true
+++

<div class="ox-hugo-toc toc">
<div></div>

<div class="heading">Table of Contents</div>

- [party\_invitations-1](#party-invitations-1)
- [tickets](#tickets)
- [book\_order](#book-order)

</div>
<!--endtoc-->

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


# party\_invitations-1 {#party-invitations-1}

![](party_invitations-1/figure/lpa_plot-0.png)
![](party_invitations-1/figure/lpa_plot-1.png)

{{< figure src="party_invitations-1/figure/lpa_back_line.png" >}}

Response: the larger, the better


### w/ tau and theta


|          tau|        theta|      naction|           spd|         res|             n|
|------------:|------------:|------------:|-------------:|-----------:|-------------:|
|  2.06 (1.10)| -1.49 (0.96)|  0.08 (3.72)| -4.43 (11.77)| 0.43 (1.13)|   7.00 (0.00)|
|  0.02 (0.65)|  0.63 (0.43)| -0.21 (0.38)|   0.03 (0.00)| 2.77 (0.56)| 443.00 (0.00)|
| -0.65 (0.57)| -0.58 (1.11)| -0.28 (0.70)|   0.03 (0.00)| 1.18 (1.32)| 309.00 (0.00)|
|  0.83 (1.33)| -0.43 (0.89)|  0.84 (1.51)|   0.03 (0.00)| 1.90 (1.24)| 211.00 (0.00)|

### w/o tau and theta


|      naction|          spd|      CPROB1|      CPROB2|         res|             n|
|------------:|------------:|-----------:|-----------:|-----------:|-------------:|
|  1.82 (4.16)| -3.09 (9.85)| 0.98 (0.05)| 0.02 (0.05)| 0.70 (1.25)|  10.00 (0.00)|
| -0.02 (0.90)|  0.03 (0.00)| 0.00 (0.01)| 1.00 (0.01)| 2.07 (1.23)| 960.00 (0.00)|


# tickets {#tickets}

![](tickets/figure/lpa_plot-0.png)
![](tickets/figure/lpa_plot-1.png)

{{< figure src="tickets/figure/lpa_back_line.png" >}}

Response: the smaller, the better


### w/ tau and theta


|          tau|        theta|      naction|          spd|         res|             n|
|------------:|------------:|------------:|------------:|-----------:|-------------:|
| -0.41 (0.41)|  0.19 (0.38)|  0.01 (0.64)|  0.29 (0.26)| 3.71 (2.99)| 425.00 (0.00)|
|  0.93 (0.91)| -0.67 (0.55)|  0.40 (1.21)|  0.13 (0.35)| 5.22 (2.75)| 283.00 (0.00)|
|  1.13 (0.90)| -1.79 (1.09)| -1.92 (0.17)| -1.99 (2.67)| 7.00 (0.00)|  75.00 (0.00)|
| -0.97 (0.27)|  1.34 (0.35)|  0.15 (0.52)| -0.06 (0.39)| 3.15 (2.88)| 179.00 (0.00)|

### w/o tau and theta


|      naction|          spd|      CPROB1|      CPROB2|         res|             n|
|------------:|------------:|-----------:|-----------:|-----------:|-------------:|
|  0.07 (0.75)|  0.22 (0.29)| 0.95 (0.09)| 0.05 (0.09)| 4.06 (3.00)| 841.00 (0.00)|
|  0.85 (1.84)| -0.54 (0.49)| 0.12 (0.15)| 0.87 (0.15)| 5.10 (2.82)|  63.00 (0.00)|
| -1.97 (0.10)| -2.56 (2.76)| 0.10 (0.18)| 0.04 (0.06)| 7.00 (0.00)|  58.00 (0.00)|


# book\_order {#book-order}

![](book_order/figure/lpa_plot-0.png)
![](book_order/figure/lpa_plot-1.png)

{{< figure src="book_order/figure/lpa_back_line.png" >}}

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
