+++
title = "tickets"
author = ["Jonghyun Yun"]
lastmod = 2021-12-07T16:48:17-06:00
draft = false
weight = 3
chapter = false
+++

```sh
out_dir="tickets/"
cd $out_dir
cd figure
convert -density 300 tau_action.pdf tau_action.png
convert -density 300 theta_tau_res.pdf theta_tau_res.png
convert -density 300 time_action_more.pdf time_action_more-%d.png
convert -density 300 time_action.pdf time_action-%d.png
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

![](figure/lpa_plot-0.png)
![](figure/lpa_plot-1.png)

{{< figure src="figure/lpa_back_line.png" >}}

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
![](figure/theta_tau_res.png)
![](figure/tau_action.png)
![](figure/time_action-3.png)
![](figure/time_action_more-2.png)
![](figure/time_action_more-5.png)
![](figure/time_action_more-7.png)
![](figure/time_action_more-8.png)
![](figure/time_action_more-9.png)
![](figure/time_action_more-10.png)
![](figure/time_action_more-11.png)
![](figure/time_action_more-13.png)
