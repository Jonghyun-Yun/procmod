+++
title = "PIACC"
author = ["Jonghyun Yun"]
lastmod = 2021-09-28T16:34:12-05:00
draft = false
weight = 1
chapter = true
+++

<div class="ox-hugo-toc toc">
<div></div>

<div class="heading">Table of Contents</div>

- [item home](#item-home)
    - [party\_invitations-1](#party-invitations-1)
    - [party\_invitations-2](#party-invitations-2)
    - [cd\_tally](#cd-tally)
    - [sprained\_ankle-1](#sprained-ankle-1)
    - [sprained\_ankle-2](#sprained-ankle-2)
    - [tickets](#tickets)
    - [class\_attendance](#class-attendance)
    - [club\_membership-1](#club-membership-1)
    - [club\_membership-2](#club-membership-2)
    - [book\_order](#book-order)
    - [meeting\_room](#meeting-room)
    - [reply\_all](#reply-all)
    - [locate\_email](#locate-email)
    - [lamp\_return](#lamp-return)
- [item codebook](#item-codebook)
- [item results](#item-results)
    - [important background covaraites](#important-background-covaraites)
    - [variables](#variables)
    - [summaries](#summaries)
    - [LPA](#lpa)
    - [party\_invitations-1](#party-invitations-1)
        - [Covariates](#covariates)
    - [party\_invitations-2](#party-invitations-2)
        - [Covariates](#covariates)
    - [cd\_tally](#cd-tally)
        - [Covariates](#covariates)
    - [sprained\_ankle-1](#sprained-ankle-1)
        - [Covariates](#covariates)
    - [tickets](#tickets)
        - [Covariates](#covariates)
    - [club\_membership-1](#club-membership-1)
        - [Covariates](#covariates)
    - [book\_order](#book-order)
        - [Covariates](#covariates)
    - [meeting\_room](#meeting-room)
        - [Covariates](#covariates)
    - [locate\_email](#locate-email)
        - [Covariates](#covariates)
    - [lamp\_return](#lamp-return)
        - [Covariates](#covariates)

</div>
<!--endtoc-->

### Chapter 1

# PIACC

Programme for the International Assessment of Adult Competencies (PIAAC)


# item home {#item-home}

See the codebook for details....... [PS\_BOOKLET\_ITEM.csv](/ox-hugo/PS_BOOKLET_ITEM.csv)


## party\_invitations-1 {#party-invitations-1}

{{< figure src="/ox-hugo/_20210904_171956pi-start.png" >}}


## party\_invitations-2 {#party-invitations-2}

{{< figure src="/ox-hugo/_20210904_172034pi-home.png" >}}


## cd\_tally {#cd-tally}

{{< figure src="/ox-hugo/_20210904_172043cd-start.png" >}}


## sprained\_ankle-1 {#sprained-ankle-1}

{{< figure src="/ox-hugo/_20210904_172056sa-start.png" >}}


## sprained\_ankle-2 {#sprained-ankle-2}

{{< figure src="/ox-hugo/_20210904_172105sa-start2.png" >}}


## tickets {#tickets}

{{< figure src="/ox-hugo/_20210904_172128ft-home.png" >}}


## class\_attendance {#class-attendance}

{{< figure src="/ox-hugo/_20210904_172140ca-email-home.png" >}}


## club\_membership-1 {#club-membership-1}

{{< figure src="/ox-hugo/_20210904_172148cm-start.png" >}}


## club\_membership-2 {#club-membership-2}

{{< figure src="/ox-hugo/_20210904_172157cm-home.png" >}}


## book\_order {#book-order}

{{< figure src="/ox-hugo/_20210904_172208bo-start.png" >}}


## meeting\_room {#meeting-room}

{{< figure src="/ox-hugo/_20210904_172218mr-email-home.png" >}}


## reply\_all {#reply-all}

{{< figure src="/ox-hugo/_20210904_172228ra-home.png" >}}


## locate\_email {#locate-email}

{{< figure src="/ox-hugo/_20210904_172236le-home.png" >}}


## lamp\_return {#lamp-return}

{{< figure src="/ox-hugo/_20210904_172248lr-home.png" >}}


# item codebook {#item-codebook}

| ITEM   | NAME                  | CODEBOOK | RESPONSE                                                                 |
|--------|-----------------------|----------|--------------------------------------------------------------------------|
| PS1\_1 | Party Invitations - 1 | U01a000S | POLYTOMOUS (0 to 3), No response (R ), Not reached / not attempted (N)   |
| PS1\_2 | Party Invitations - 2 | U01b000S | MISSING (0), CORRECT (1), INCORRECT (7), Not reached / not attempted (N) |
| PS1\_3 | CD Tally              | U03a000S | MISSING (0), CORRECT (1), INCORRECT (7), Not reached / not attempted (N) |
| PS1\_4 | Sprained Ankle - 1    | U06a000S | MISSING (0), CORRECT (1), INCORRECT (7), Not reached / not attempted (N) |
| PS1\_5 | Sprained Ankle - 2    | U06b000S | MISSING (0), CORRECT (1), INCORRECT (7), Not reached / not attempted (N) |
| PS1\_6 | Tickets               | U21x000S | MISSING (0), CORRECT (1), INCORRECT (7), Not reached / not attempted (N) |
| PS1\_7 | Class Attendance      | U04a000S | POLYTOMOUS (0 to 2), No response (R ), Not reached / not attempted (N)   |
| PS2\_1 | Club Membership - 1   | U19a000S | MISSING (0), CORRECT (1), INCORRECT (7), Not reached / not attempted (N) |
| PS2\_2 | Club Membership - 2   | U19b000S | POLYTOMOUS (0 to 3), No response (R ), Not reached / not attempted (N)   |
| PS2\_3 | Book Order            | U07x000S | MISSING (0), CORRECT (1), INCORRECT (7), Not reached / not attempted (N) |
| PS2\_4 | Meeting Room          | U02x000S | POLYTOMOUS (0 to 3), No response (R ), Not reached / not attempted (N)   |
| PS2\_5 | Reply All             | U16x000S | MISSING (0), CORRECT (1), INCORRECT (7), Not reached / not attempted (N) |
| PS2\_6 | Locate Email          | U11b000S | POLYTOMOUS (0 to 3), No response (R ), Not reached / not attempted (N)   |
| PS2\_7 | Lamp Return           | U23x000S | POLYTOMOUS (0 to 3), No response (R ), Not reached / not attempted (N)   |


# item results {#item-results}


## important background covaraites {#important-background-covaraites}

Random forest regression is used with &tau; or &theta; as a response and background variables in some categoires as covariates. P-value for the importance is reported. The selected categories are
c("Sampling / weighting", "Not assigned" ,"Sampling / weighting (derived)", "Background questionnaire (trend)"  ,"Background questionnaire", "Background questionnaire (derived)"


## variables {#variables}

-   `ftime`: time until the first action taken
-   `time`: total time of a person's process
-   `naction` or `#action`: the number of actions of a person's process


## summaries {#summaries}

-   Total or first action time has weak association with &theta;.
-   \# of actions and first action time have weak or no assciation.
-   \# of actions has some association with the response.
-   &tau; and first action time has negative correaltion.
-   &tau; and # of actions have weak or no association
-   \# of actions and &theta; time have positive correlation.


## LPA {#lpa}

Latent profile analysis is done by `tidyLAP`. This R package uses multivariate Gaussian mixture models and reports many model selection criteria. See <https://cran.r-project.org/web/packages/tidyLPA/vignettes/Introduction%5Fto%5FtidyLPA.html>
The clustering is perfomed based on person characteristics. We compare models based on our estimated parameters, observed covariates and both.


## party\_invitations-1 {#party-invitations-1}

```text

--------------------------------------------------------------
tau and theta
--------------------------------------------------------------
Compare tidyLPA solutions:

 Model Classes AIC      AWE      BIC      CLC      KIC
 6     1       5436.555 5508.328 5460.942 5428.555 5444.555
 6     2       5157.195 5318.291 5210.845 5136.400 5171.195
 6     3       5007.841 5257.449 5090.755 4975.061 5027.841
 6     4       4978.291 5316.508 5090.469 4933.430 5004.291

Best model according to AIC is Model 6 with 4 classes.
Best model according to AWE is Model 6 with 3 classes.
Best model according to BIC is Model 6 with 4 classes.
Best model according to CLC is Model 6 with 4 classes.
Best model according to KIC is Model 6 with 4 classes.

An analytic hierarchy process, based on the fit indices AIC, AWE, BIC, CLC, and KIC (Akogul & Erisoglu, 2017), suggests the best solution is Model 6 with 4 classes.

--------------------------------------------------------------
tau and theta + naction, spd
--------------------------------------------------------------
Compare tidyLPA solutions:

 Model Classes AIC       AWE       BIC       CLC       KIC       Warnings
 6     1       10910.498 11115.062 10978.780 10884.498 10927.498
 6     2       -1594.572 -1168.675 -1453.130 -1650.586 -1562.572
 6     3       -2567.803 -1920.286 -2353.202 -2654.119 -2520.803
 6     4       -3213.190 -2344.358 -2925.430 -3329.501 -3151.190 Warning

Best model according to AIC is Model 6 with 4 classes.
Best model according to AWE is Model 6 with 4 classes.
Best model according to BIC is Model 6 with 4 classes.
Best model according to CLC is Model 6 with 4 classes.
Best model according to KIC is Model 6 with 4 classes.

An analytic hierarchy process, based on the fit indices AIC, AWE, BIC, CLC, and KIC (Akogul & Erisoglu, 2017), suggests the best solution is Model 6 with 2 classes.

--------------------------------------------------------------
naction, spd
--------------------------------------------------------------
Compare tidyLPA solutions:

 Model Classes AIC       AWE       BIC       CLC       KIC       Warnings
 6     1        5511.691  5583.464  5536.077  5503.691  5519.691
 6     2       -6107.032 -5946.724 -6053.382 -6127.040 -6093.032
 6     3                                                         Warning
 6     4                                                         Warning

Best model according to AIC is Model 6 with 2 classes.
Best model according to AWE is Model 6 with 2 classes.
Best model according to BIC is Model 6 with 2 classes.
Best model according to CLC is Model 6 with 2 classes.
Best model according to KIC is Model 6 with 2 classes.

An analytic hierarchy process, based on the fit indices AIC, AWE, BIC, CLC, and KIC (Akogul & Erisoglu, 2017), suggests the best solution is Model 6 with 1 classes.
```


### Covariates {#covariates}

&tau;'s covaritates:

|Name            |Label                                                                                                                   |       imp|      pval|
|:---------------|:-----------------------------------------------------------------------------------------------------------------------|---------:|---------:|
|AETPOP          |Adult education/training population (AET) - excludes youths 16-24 in initial cycle of studies (derived)                 | 0.4760353| 0.0099010|
|FNFAET12JR      |Participated in formal or non-formal AET for job-related reasons in 12 months preceding survey (see AETPOP - derived)   | 0.5620771| 0.0099010|
|FNFAET12NJR     |Participated in formal or non-formal AET for non job-related reasons in 12 mon. preceding survey (see AETPOP - derived) | 0.6782908| 0.0099010|
|AGEG5LFS        |Age groups in 5-year intervals based on LFS groupings (derived)                                                         | 1.4775310| 0.0297030|
|READWORK        |Index of use of reading skills at work (prose and document texts - derived)                                             | 1.6950860| 0.0396040|
|ICTHOME         |Index of use of ICT skills at home (derived)                                                                            | 0.6373768| 0.0693069|
|ICTWORK         |Index of use of ICT skills at work (derived)                                                                            | 0.9159008| 0.1089109|
|WRITWORK        |Index of use of writing skills at work (derived)                                                                        | 1.2849569| 0.1287129|
|INFLUENCE       |Index of use of influencing skills at work (derived)                                                                    | 1.0713545| 0.1485149|
|LEARNATWORK     |Index of learning at work (derived)                                                                                     | 0.8104232| 0.1782178|
|ISCO2C          |Occupational classification of respondent's job at 2-digit level (ISCO 2008), current job (derived)                     | 1.0913545| 0.2277228|
|NUMHOME         |Index of use of numeracy skills at home (basic and advanced - derived)                                                  | 0.5536242| 0.2475248|
|WRITHOME_WLE_CA |Index of use of writing skills at home, categorised WLE (derived)                                                       | 0.3360830| 0.2574257|
|WRITHOME        |Index of use of writing skills at home (derived)                                                                        | 0.5458969| 0.2673267|
|EARNHRBONUSDCL  |Hourly earnings including bonuses for wage and salary earners, in deciles (derived)                                     | 0.5569200| 0.3861386|
|EARNHRDCL       |Hourly earnings excluding bonuses for wage and salary earners, in deciles (derived)                                     | 0.5770771| 0.3960396|
|ISCO1C          |Occupational classification of respondent's job at 1-digit level (ISCO 2008), current job (derived)                     | 0.4600582| 0.4653465|
|PLANNING        |Index of use of planning skills at work (derived)                                                                       | 0.2950204| 0.5346535|
|C_Q09_C         |Current status/work history - Years of paid work during lifetime (top-coded at 47)                                      | 0.5895942| 0.5445545|
|ISIC2C          |Industry classification of respondent's job at 2-digit level (ISIC rev 4), current job (derived)                        | 0.5206061| 0.6930693|
|D_Q10_T         |Hours per week at this job or business - number of hours (top coded at 97, Trend-IALS/ALL)                              | 0.4386678| 0.7128713|
|TASKDISC        |Index of use of task discretion at work (derived)                                                                       | 0.5504840| 0.7227723|
|NUMWORK         |Index of use of numeracy skills at work (basic and advanced - derived)                                                  | 0.2945469| 0.7920792|
|PLANNING_WLE_CA |Index of use of planning skills at work, categorised WLE (derived)                                                      | 0.1557439| 0.8811881|

&theta;'s covaritates:

|Name            |Label                                                                                               |       imp|      pval|
|:---------------|:---------------------------------------------------------------------------------------------------|---------:|---------:|
|J_Q08           |Background - Number of books at home                                                                | 0.0438188| 0.0099010|
|AGEG5LFS        |Age groups in 5-year intervals based on LFS groupings (derived)                                     | 0.1470972| 0.0099010|
|ICTHOME         |Index of use of ICT skills at home (derived)                                                        | 0.1615933| 0.0099010|
|ISCO2C          |Occupational classification of respondent's job at 2-digit level (ISCO 2008), current job (derived) | 0.0602383| 0.0693069|
|WRITHOME        |Index of use of writing skills at home (derived)                                                    | 0.0473309| 0.0792079|
|ICTHOME_WLE_CA  |Index of use of ICT skills at home, categorised WLE (derived)                                       | 0.0193539| 0.2574257|
|WRITHOME_WLE_CA |Index of use of writing skills at home, categorised WLE (derived)                                   | 0.0193950| 0.2871287|
|INFLUENCE       |Index of use of influencing skills at work (derived)                                                | 0.0231479| 0.4554455|
|C_Q09_C         |Current status/work history - Years of paid work during lifetime (top-coded at 47)                  | 0.0511671| 0.5346535|

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


## party\_invitations-2 {#party-invitations-2}

```text

--------------------------------------------------------------
tau and theta
--------------------------------------------------------------
Compare tidyLPA solutions:

 Model Classes AIC      AWE      BIC      CLC      KIC
 6     1       5405.320 5477.062 5429.691 5397.320 5413.320
 6     2       4813.399 4974.190 4867.016 4792.841 4827.399
 6     3       4634.604 4883.826 4717.465 4602.105 4654.604
 6     4       4497.875 4835.859 4609.981 4453.104 4523.875

Best model according to AIC is Model 6 with 4 classes.
Best model according to AWE is Model 6 with 4 classes.
Best model according to BIC is Model 6 with 4 classes.
Best model according to CLC is Model 6 with 4 classes.
Best model according to KIC is Model 6 with 4 classes.

An analytic hierarchy process, based on the fit indices AIC, AWE, BIC, CLC, and KIC (Akogul & Erisoglu, 2017), suggests the best solution is Model 6 with 4 classes.

--------------------------------------------------------------
tau and theta + naction, spd
--------------------------------------------------------------
Compare tidyLPA solutions:

 Model Classes AIC       AWE       BIC       CLC       KIC
 6     1       10528.035 10732.512 10596.273 10502.035 10545.035
 6     2       8617.342  9043.348  8758.694  8561.040  8649.342
 6     3       7533.600  8180.873  7748.064  7447.256  7580.600
 6     4       7252.546  8121.072  7540.124  7136.176  7314.546

Best model according to AIC is Model 6 with 4 classes.
Best model according to AWE is Model 6 with 4 classes.
Best model according to BIC is Model 6 with 4 classes.
Best model according to CLC is Model 6 with 4 classes.
Best model according to KIC is Model 6 with 4 classes.

An analytic hierarchy process, based on the fit indices AIC, AWE, BIC, CLC, and KIC (Akogul & Erisoglu, 2017), suggests the best solution is Model 6 with 4 classes.

--------------------------------------------------------------
naction, spd
--------------------------------------------------------------
Compare tidyLPA solutions:

 Model Classes AIC      AWE      BIC      CLC      KIC
 6     1       5471.194 5542.936 5495.565 5463.194 5479.194
 6     2       4818.378 4979.088 4871.994 4797.899 4832.378
 6     3       4443.725 4692.913 4526.586 4411.259 4463.725
 6     4       4397.854 4735.792 4509.961 4353.130 4423.854

Best model according to AIC is Model 6 with 4 classes.
Best model according to AWE is Model 6 with 3 classes.
Best model according to BIC is Model 6 with 4 classes.
Best model according to CLC is Model 6 with 4 classes.
Best model according to KIC is Model 6 with 4 classes.

An analytic hierarchy process, based on the fit indices AIC, AWE, BIC, CLC, and KIC (Akogul & Erisoglu, 2017), suggests the best solution is Model 6 with 4 classes.
```


### Covariates {#covariates}

&tau;'s covaritates:

|Name             |Label                                                                                                                 |       imp|      pval|
|:----------------|:---------------------------------------------------------------------------------------------------------------------|---------:|---------:|
|AGEG5LFS         |Age groups in 5-year intervals based on LFS groupings (derived)                                                       | 7.5208090| 0.0099010|
|FNFAET12JR       |Participated in formal or non-formal AET for job-related reasons in 12 months preceding survey (see AETPOP - derived) | 3.0103397| 0.0297030|
|EDWORK           |Interaction between adults' work and education status (derived)                                                       | 4.0462860| 0.0396040|
|WRITHOME         |Index of use of writing skills at home (derived)                                                                      | 3.0624310| 0.0495050|
|INFLUENCE_WLE_CA |Index of use of influencing skills at work, categorised WLE (derived)                                                 | 2.3613901| 0.0693069|
|C_Q07            |Current status/work history - Subjective status                                                                       | 1.9239820| 0.1485149|
|D_Q04_T          |Status at this job or business - six levels (Trend-IALS/ALL)                                                          | 2.8720376| 0.1485149|
|NFEHRS           |Number of hours of participation in non-formal education (derived)                                                    | 2.6359362| 0.1485149|
|INFLUENCE        |Index of use of influencing skills at work (derived)                                                                  | 4.2617952| 0.1485149|
|C_Q07_T          |Current work situation (Trend-IALS/ALL)                                                                               | 1.9143029| 0.1584158|
|C_Q09_C          |Current status/work history - Years of paid work during lifetime (top-coded at 47)                                    | 3.5475500| 0.1584158|
|NFEHRSNJR        |Number of hours of participation in non-formal education for non-job-related reasons (derived)                        | 2.0954807| 0.1881188|
|WRITWORK         |Index of use of writing skills at work (derived)                                                                      | 3.0903374| 0.2574257|
|ISIC2C           |Industry classification of respondent's job at 2-digit level (ISIC rev 4), current job (derived)                      | 3.1067881| 0.2673267|
|WRITHOME_WLE_CA  |Index of use of writing skills at home, categorised WLE (derived)                                                     | 1.3527919| 0.3168317|
|ICTWORK          |Index of use of ICT skills at work (derived)                                                                          | 1.4332122| 0.4851485|
|ISCO2C           |Occupational classification of respondent's job at 2-digit level (ISCO 2008), current job (derived)                   | 2.7864662| 0.5544554|
|ICTHOME          |Index of use of ICT skills at home (derived)                                                                          | 0.9518398| 0.5742574|
|READHOME         |Index of use of reading skills at home (prose and document texts - derived)                                           | 1.6072193| 0.5742574|
|TASKDISC         |Index of use of task discretion at work (derived)                                                                     | 1.8104794| 0.6831683|
|READWORK         |Index of use of reading skills at work (prose and document texts - derived)                                           | 2.1720472| 0.8019802|
|EARNHRBONUSDCL   |Hourly earnings including bonuses for wage and salary earners, in deciles (derived)                                   | 1.2542224| 0.8316832|
|EARNHRDCL        |Hourly earnings excluding bonuses for wage and salary earners, in deciles (derived)                                   | 1.1310512| 0.8811881|

&theta;'s covaritates:

|Name           |Label                                                                              |       imp|      pval|
|:--------------|:----------------------------------------------------------------------------------|---------:|---------:|
|ICTHOME        |Index of use of ICT skills at home (derived)                                       | 0.7747457| 0.0099010|
|ICTHOME_WLE_CA |Index of use of ICT skills at home, categorised WLE (derived)                      | 0.3920334| 0.0099010|
|G_Q07          |Skill use work - ICT - Computer - Got the skills needed                            | 0.1055491| 0.0495050|
|AGEG5LFS       |Age groups in 5-year intervals based on LFS groupings (derived)                    | 0.3130297| 0.0891089|
|ICTWORK_WLE_CA |Index of use of ICT skills at work, categorised WLE (derived)                      | 0.0453193| 0.4455446|
|C_Q09_C        |Current status/work history - Years of paid work during lifetime (top-coded at 47) | 0.1399846| 0.7227723|

![](party_inviations-2/figure/theta_tau_res.png)
![](party_inviations-2/figure/tau_action.png)
![](party_inviations-2/figure/time_action-3.png)
![](party_inviations-2/figure/time_action_more-2.png)
![](party_inviations-2/figure/time_action_more-5.png)
![](party_inviations-2/figure/time_action_more-7.png)
![](party_inviations-2/figure/time_action_more-8.png)
![](party_inviations-2/figure/time_action_more-9.png)
![](party_inviations-2/figure/time_action_more-10.png)
![](party_inviations-2/figure/time_action_more-11.png)
![](party_inviations-2/figure/time_action_more-13.png)


## cd\_tally {#cd-tally}

PROPERTIES:
EXPORT\_FILE\_NAME: \_index
EXPORT\_HUGO\_BUNDLE: cd\_tally
END:

```text

--------------------------------------------------------------
tau and theta
--------------------------------------------------------------
Compare tidyLPA solutions:

 Model Classes AIC      AWE      BIC      CLC      KIC
 6     1       5441.902 5513.634 5466.268 5433.902 5449.902
 6     2       5367.159 5528.666 5420.764 5345.861 5381.159
 6     3       5358.972 5608.736 5441.816 5325.896 5378.972
 6     4       5354.049 5692.223 5466.131 5309.040 5380.049

Best model according to AIC is Model 6 with 4 classes.
Best model according to AWE is Model 6 with 1 classes.
Best model according to BIC is Model 6 with 2 classes.
Best model according to CLC is Model 6 with 4 classes.
Best model according to KIC is Model 6 with 3 classes.

An analytic hierarchy process, based on the fit indices AIC, AWE, BIC, CLC, and KIC (Akogul & Erisoglu, 2017), suggests the best solution is Model 6 with 2 classes.

--------------------------------------------------------------
tau and theta + naction, spd
--------------------------------------------------------------
Compare tidyLPA solutions:

 Model Classes AIC       AWE       BIC       CLC       KIC
 6     1       10616.761 10821.210 10684.985 10590.761 10633.761
 6     2       8739.081  9165.029  8880.403  8682.777  8771.081
 6     3       7151.543  7798.508  7365.962  7065.416  7198.543
 6     4       6860.021  7728.367  7147.538  6743.709  6922.021

Best model according to AIC is Model 6 with 4 classes.
Best model according to AWE is Model 6 with 4 classes.
Best model according to BIC is Model 6 with 4 classes.
Best model according to CLC is Model 6 with 4 classes.
Best model according to KIC is Model 6 with 4 classes.

An analytic hierarchy process, based on the fit indices AIC, AWE, BIC, CLC, and KIC (Akogul & Erisoglu, 2017), suggests the best solution is Model 6 with 4 classes.

--------------------------------------------------------------
naction, spd
--------------------------------------------------------------
Compare tidyLPA solutions:

 Model Classes AIC      AWE      BIC      CLC      KIC
 6     1       5450.414 5522.146 5474.780 5442.414 5458.414
 6     2       4077.384 4238.032 4130.989 4056.945 4091.384
 6     3       3721.695 3970.906 3804.539 3689.172 3741.695
 6     4       2862.139 3199.806 2974.222 2817.638 2888.139

Best model according to AIC is Model 6 with 4 classes.
Best model according to AWE is Model 6 with 4 classes.
Best model according to BIC is Model 6 with 4 classes.
Best model according to CLC is Model 6 with 4 classes.
Best model according to KIC is Model 6 with 4 classes.

An analytic hierarchy process, based on the fit indices AIC, AWE, BIC, CLC, and KIC (Akogul & Erisoglu, 2017), suggests the best solution is Model 6 with 4 classes.
```


### Covariates {#covariates}

&tau;'s covaritates:

|Name       |Label                                                                                      |       imp|      pval|
|:----------|:------------------------------------------------------------------------------------------|---------:|---------:|
|AGEG5LFS   |Age groups in 5-year intervals based on LFS groupings (derived)                            | 13.225172| 0.0198020|
|LEAVER1624 |Youth aged 16 to 24 who have left education without completing ISCED 3 or higher (derived) |  3.181545| 0.0198020|
|INFLUENCE  |Index of use of influencing skills at work (derived)                                       |  6.290272| 0.0198020|
|ICTWORK    |Index of use of ICT skills at work (derived)                                               |  4.230648| 0.0891089|
|WRITWORK   |Index of use of writing skills at work (derived)                                           |  4.635795| 0.2079208|
|C_Q09_C    |Current status/work history - Years of paid work during lifetime (top-coded at 47)         |  4.174670| 0.5445545|

&theta;'s covaritates:

|Name           |Label                                                                                                   |       imp|      pval|
|:--------------|:-------------------------------------------------------------------------------------------------------|---------:|---------:|
|FAET12JR       |Participated in formal AET for job-related reasons in 12 months preceding survey (see AETPOP - derived) | 0.0226119| 0.0099010|
|ICTHOME        |Index of use of ICT skills at home (derived)                                                            | 0.0675867| 0.0099010|
|ICTHOME_WLE_CA |Index of use of ICT skills at home, categorised WLE (derived)                                           | 0.0258062| 0.0099010|
|C_Q09_C        |Current status/work history - Years of paid work during lifetime (top-coded at 47)                      | 0.0417345| 0.0297030|
|J_Q08          |Background - Number of books at home                                                                    | 0.0161170| 0.0297030|
|WRITHOME       |Index of use of writing skills at home (derived)                                                        | 0.0342809| 0.0594059|
|YRSGET         |Imputed years of formal education needed to get the job (self-reported - derived)                       | 0.0302366| 0.0693069|
|AGEG5LFS       |Age groups in 5-year intervals based on LFS groupings (derived)                                         | 0.0327879| 0.0990099|
|ISCO2C         |Occupational classification of respondent's job at 2-digit level (ISCO 2008), current job (derived)     | 0.0384570| 0.1188119|
|ISIC2C         |Industry classification of respondent's job at 2-digit level (ISIC rev 4), current job (derived)        | 0.0289311| 0.2178218|
|EDCAT8         |Highest level of formal education obtained (8 categories - derived)                                     | 0.0141250| 0.2277228|
|READHOME       |Index of use of reading skills at home (prose and document texts - derived)                             | 0.0232100| 0.2970297|
|EARNHRDCL      |Hourly earnings excluding bonuses for wage and salary earners, in deciles (derived)                     | 0.0159185| 0.4455446|
|ICTWORK        |Index of use of ICT skills at work (derived)                                                            | 0.0150712| 0.4554455|
|TASKDISC       |Index of use of task discretion at work (derived)                                                       | 0.0127158| 0.7623762|
|NUMHOME        |Index of use of numeracy skills at home (basic and advanced - derived)                                  | 0.0057798| 0.7920792|
|READWORK       |Index of use of reading skills at work (prose and document texts - derived)                             | 0.0015423| 0.9900990|

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


## sprained\_ankle-1 {#sprained-ankle-1}

PROPERTIES:
EXPORT\_FILE\_NAME: \_index
EXPORT\_HUGO\_BUNDLE: sprained\_ankle-1
END:

```text

--------------------------------------------------------------
tau and theta
--------------------------------------------------------------
Compare tidyLPA solutions:

 Model Classes AIC      AWE      BIC      CLC      KIC
 6     1       5282.108 5353.809 5306.459 5274.108 5290.108
 6     2       5028.547 5189.740 5082.118 5007.496 5042.547
 6     3       4967.105 5216.558 5049.896 4934.234 4987.105
 6     4       4949.354 5287.326 5061.365 4904.404 4975.354

Best model according to AIC is Model 6 with 4 classes.
Best model according to AWE is Model 6 with 2 classes.
Best model according to BIC is Model 6 with 3 classes.
Best model according to CLC is Model 6 with 4 classes.
Best model according to KIC is Model 6 with 4 classes.

An analytic hierarchy process, based on the fit indices AIC, AWE, BIC, CLC, and KIC (Akogul & Erisoglu, 2017), suggests the best solution is Model 6 with 4 classes.

--------------------------------------------------------------
tau and theta + naction, spd
--------------------------------------------------------------
Compare tidyLPA solutions:

 Model Classes AIC      AWE       BIC       CLC       KIC      Warnings
 6     1       10725.58 10929.943 10793.763 10699.582 10742.58
 6     2       -2650.57 -2225.082 -2509.338 -2706.594 -2618.57
 6     3                                                       Warning
 6     4                                                       Warning

Best model according to AIC is Model 6 with 2 classes.
Best model according to AWE is Model 6 with 2 classes.
Best model according to BIC is Model 6 with 2 classes.
Best model according to CLC is Model 6 with 2 classes.
Best model according to KIC is Model 6 with 2 classes.

An analytic hierarchy process, based on the fit indices AIC, AWE, BIC, CLC, and KIC (Akogul & Erisoglu, 2017), suggests the best solution is Model 6 with 2 classes.

--------------------------------------------------------------
naction, spd
--------------------------------------------------------------
Compare tidyLPA solutions:

 Model Classes AIC       AWE       BIC       CLC       KIC       Warnings
 6     1        5471.117  5542.817  5495.467  5463.117  5479.117
 6     2       -6367.190 -6207.009 -6313.620 -6387.231 -6353.190
 6     3                                                         Warning
 6     4                                                         Warning

Best model according to AIC is Model 6 with 2 classes.
Best model according to AWE is Model 6 with 2 classes.
Best model according to BIC is Model 6 with 2 classes.
Best model according to CLC is Model 6 with 2 classes.
Best model according to KIC is Model 6 with 2 classes.

An analytic hierarchy process, based on the fit indices AIC, AWE, BIC, CLC, and KIC (Akogul & Erisoglu, 2017), suggests the best solution is Model 6 with 1 classes.
```


### Covariates {#covariates}

&tau;'s covaritates:

|Name               |Label                                                                                                  |       imp|      pval|
|:------------------|:------------------------------------------------------------------------------------------------------|---------:|---------:|
|AGEG5LFS           |Age groups in 5-year intervals based on LFS groupings (derived)                                        | 2.2158222| 0.0099010|
|LEAVER1624         |Youth aged 16 to 24 who have left education without completing ISCED 3 or higher (derived)             | 1.0392552| 0.0099010|
|READHOME           |Index of use of reading skills at home (prose and document texts - derived)                            | 1.5162550| 0.0099010|
|C_Q07              |Current status/work history - Subjective status                                                        | 1.3855259| 0.0198020|
|C_Q09_C            |Current status/work history - Years of paid work during lifetime (top-coded at 47)                     | 1.2549421| 0.0594059|
|ICTHOME            |Index of use of ICT skills at home (derived)                                                           | 0.7734625| 0.0891089|
|LEARNATWORK_WLE_CA |Index of learning at work, categorised WLE (derived)                                                   | 0.5628345| 0.1584158|
|EARNHRBONUSDCL     |Hourly earnings including bonuses for wage and salary earners, in deciles (derived)                    | 0.9855860| 0.1881188|
|EARNHRDCL          |Hourly earnings excluding bonuses for wage and salary earners, in deciles (derived)                    | 0.9860484| 0.2079208|
|NUMHOME_WLE_CA     |Index of use of numeracy skills at home (basic and advanced), categorised WLE (derived)                | 0.4211173| 0.2475248|
|WRITHOME           |Index of use of writing skills at home (derived)                                                       | 0.7256336| 0.3069307|
|WRITHOME_WLE_CA    |Index of use of writing skills at home, categorised WLE (derived)                                      | 0.4139999| 0.3168317|
|NUMHOME            |Index of use of numeracy skills at home (basic and advanced - derived)                                 | 0.7042356| 0.3663366|
|LEARNATWORK        |Index of learning at work (derived)                                                                    | 0.7724518| 0.4752475|
|ISCO2C             |Occupational classification of respondent's job at 2-digit level (ISCO 2008), current job (derived)    | 0.8514091| 0.4851485|
|INFLUENCE          |Index of use of influencing skills at work (derived)                                                   | 0.6249595| 0.5544554|
|EARNMTHALLDCL      |Monthly earnings including bonuses for wage and salary earners and self-employed, in deciles (derived) | 0.6435811| 0.7128713|
|READWORK           |Index of use of reading skills at work (prose and document texts - derived)                            | 0.6363074| 0.7623762|
|TASKDISC           |Index of use of task discretion at work (derived)                                                      | 0.4460782| 0.8910891|
|D_Q10              |Current work - Hours/week                                                                              | 0.5838641| 0.9108911|

&theta;'s covaritates:

|Name            |Label                                                                                               |       imp|      pval|
|:---------------|:---------------------------------------------------------------------------------------------------|---------:|---------:|
|J_Q08           |Background - Number of books at home                                                                | 0.0301127| 0.0099010|
|ICTHOME         |Index of use of ICT skills at home (derived)                                                        | 0.0827937| 0.0099010|
|WRITHOME        |Index of use of writing skills at home (derived)                                                    | 0.1051451| 0.0099010|
|WRITHOME_WLE_CA |Index of use of writing skills at home, categorised WLE (derived)                                   | 0.0921124| 0.0099010|
|NUMHOME         |Index of use of numeracy skills at home (basic and advanced - derived)                              | 0.0544875| 0.0198020|
|NUMHOME_WLE_CA  |Index of use of numeracy skills at home (basic and advanced), categorised WLE (derived)             | 0.0324993| 0.0198020|
|READHOME        |Index of use of reading skills at home (prose and document texts - derived)                         | 0.0576644| 0.0198020|
|ICTHOME_WLE_CA  |Index of use of ICT skills at home, categorised WLE (derived)                                       | 0.0209526| 0.1188119|
|LEARNATWORK     |Index of learning at work (derived)                                                                 | 0.0235951| 0.3267327|
|ISIC2C          |Industry classification of respondent's job at 2-digit level (ISIC rev 4), current job (derived)    | 0.0244875| 0.3465347|
|AGEG5LFS        |Age groups in 5-year intervals based on LFS groupings (derived)                                     | 0.0222532| 0.3663366|
|INFLUENCE       |Index of use of influencing skills at work (derived)                                                | 0.0084937| 0.7029703|
|ISCO1C          |Occupational classification of respondent's job at 1-digit level (ISCO 2008), current job (derived) | 0.0113159| 0.7227723|
|C_Q09_C         |Current status/work history - Years of paid work during lifetime (top-coded at 47)                  | 0.0118967| 0.7821782|
|ISCO2C          |Occupational classification of respondent's job at 2-digit level (ISCO 2008), current job (derived) | 0.0172004| 0.7920792|

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


## tickets {#tickets}

PROPERTIES:
EXPORT\_FILE\_NAME: \_index
EXPORT\_HUGO\_BUNDLE: tickets
END:

```text

--------------------------------------------------------------
tau and theta
--------------------------------------------------------------
Compare tidyLPA solutions:

 Model Classes AIC      AWE      BIC      CLC      KIC
 6     1       4649.876 4721.566 4674.221 4641.876 4657.876
 6     2       4228.453 4389.258 4282.013 4207.767 4242.453
 6     3       4062.354 4311.590 4145.128 4029.665 4082.354
 6     4       4033.771 4371.540 4145.758 3988.977 4059.771

Best model according to AIC is Model 6 with 4 classes.
Best model according to AWE is Model 6 with 3 classes.
Best model according to BIC is Model 6 with 3 classes.
Best model according to CLC is Model 6 with 4 classes.
Best model according to KIC is Model 6 with 4 classes.

An analytic hierarchy process, based on the fit indices AIC, AWE, BIC, CLC, and KIC (Akogul & Erisoglu, 2017), suggests the best solution is Model 6 with 4 classes.

--------------------------------------------------------------
tau and theta + naction, spd
--------------------------------------------------------------
Compare tidyLPA solutions:

 Model Classes AIC      AWE      BIC      CLC      KIC
 6     1       9741.434 9945.767 9809.601 9715.434 9758.434
 6     2       6976.934 7402.489 7118.135 6920.782 7008.934
 6     3       5955.984 6602.815 6170.221 5869.626 6002.984
 6     4       5589.996 6457.851 5877.267 5473.684 5651.996

Best model according to AIC is Model 6 with 4 classes.
Best model according to AWE is Model 6 with 4 classes.
Best model according to BIC is Model 6 with 4 classes.
Best model according to CLC is Model 6 with 4 classes.
Best model according to KIC is Model 6 with 4 classes.

An analytic hierarchy process, based on the fit indices AIC, AWE, BIC, CLC, and KIC (Akogul & Erisoglu, 2017), suggests the best solution is Model 6 with 4 classes.

--------------------------------------------------------------
naction, spd
--------------------------------------------------------------
Compare tidyLPA solutions:

 Model Classes AIC      AWE      BIC      CLC      KIC
 6     1       5391.087 5462.777 5415.432 5383.087 5399.087
 6     2       3693.159 3853.480 3746.718 3672.956 3707.159
 6     3       3370.270 3619.131 3453.043 3337.955 3390.270
 6     4       3506.481 3844.076 3618.469 3461.861 3532.481

Best model according to AIC is Model 6 with 3 classes.
Best model according to AWE is Model 6 with 3 classes.
Best model according to BIC is Model 6 with 3 classes.
Best model according to CLC is Model 6 with 3 classes.
Best model according to KIC is Model 6 with 3 classes.

An analytic hierarchy process, based on the fit indices AIC, AWE, BIC, CLC, and KIC (Akogul & Erisoglu, 2017), suggests the best solution is Model 6 with 3 classes.
```


### Covariates {#covariates}

&tau;'s covaritates:

|Name             |Label                                                                                               |       imp|      pval|
|:----------------|:---------------------------------------------------------------------------------------------------|---------:|---------:|
|WRITHOME         |Index of use of writing skills at home (derived)                                                    | 2.1231496| 0.0198020|
|INFLUENCE        |Index of use of influencing skills at work (derived)                                                | 1.6894554| 0.0396040|
|AGEG5LFS         |Age groups in 5-year intervals based on LFS groupings (derived)                                     | 1.7446838| 0.0495050|
|NFEHRSNJR        |Number of hours of participation in non-formal education for non-job-related reasons (derived)      | 0.8342717| 0.0495050|
|READWORK_WLE_CA  |Index of use of reading skills at work (prose and document texts), categorised WLE (derived)        | 1.4503579| 0.0495050|
|C_Q09_C          |Current status/work history - Years of paid work during lifetime (top-coded at 47)                  | 1.6404999| 0.0594059|
|WRITHOME_WLE_CA  |Index of use of writing skills at home, categorised WLE (derived)                                   | 1.0314101| 0.0693069|
|EARNHRDCL        |Hourly earnings excluding bonuses for wage and salary earners, in deciles (derived)                 | 1.3956484| 0.0792079|
|ICTHOME          |Index of use of ICT skills at home (derived)                                                        | 1.0688005| 0.0891089|
|ICTWORK_WLE_CA   |Index of use of ICT skills at work, categorised WLE (derived)                                       | 0.6859478| 0.1386139|
|READHOME         |Index of use of reading skills at home (prose and document texts - derived)                         | 1.7679788| 0.1485149|
|EARNHRBONUSDCL   |Hourly earnings including bonuses for wage and salary earners, in deciles (derived)                 | 0.9460383| 0.1782178|
|NUMHOME          |Index of use of numeracy skills at home (basic and advanced - derived)                              | 0.9874929| 0.1980198|
|ISIC2C           |Industry classification of respondent's job at 2-digit level (ISIC rev 4), current job (derived)    | 1.1823535| 0.2178218|
|INFLUENCE_WLE_CA |Index of use of influencing skills at work, categorised WLE (derived)                               | 0.4292938| 0.3069307|
|READYTOLEARN     |Index of readiness to learn (derived)                                                               | 0.5313548| 0.3960396|
|READWORK         |Index of use of reading skills at work (prose and document texts - derived)                         | 1.3939640| 0.4752475|
|WRITWORK_WLE_CA  |Index of use of writing skills at work, categorised WLE (derived)                                   | 0.4690732| 0.5247525|
|ISCO2C           |Occupational classification of respondent's job at 2-digit level (ISCO 2008), current job (derived) | 0.8617603| 0.5544554|
|ICTWORK          |Index of use of ICT skills at work (derived)                                                        | 0.6082405| 0.6237624|
|D_Q04_T          |Status at this job or business - six levels (Trend-IALS/ALL)                                        | 0.4182107| 0.6336634|
|WRITWORK         |Index of use of writing skills at work (derived)                                                    | 0.7363190| 0.6336634|
|LEARNATWORK      |Index of learning at work (derived)                                                                 | 0.2285450| 0.9207921|

&theta;'s covaritates:

|Name            |Label                                                                                               |       imp|      pval|
|:---------------|:---------------------------------------------------------------------------------------------------|---------:|---------:|
|ICTHOME         |Index of use of ICT skills at home (derived)                                                        | 0.0873188| 0.0099010|
|C_Q09_C         |Current status/work history - Years of paid work during lifetime (top-coded at 47)                  | 0.0684523| 0.0297030|
|AGEG5LFS        |Age groups in 5-year intervals based on LFS groupings (derived)                                     | 0.0587393| 0.0495050|
|READHOME        |Index of use of reading skills at home (prose and document texts - derived)                         | 0.0792555| 0.0891089|
|NUMHOME         |Index of use of numeracy skills at home (basic and advanced - derived)                              | 0.0733666| 0.0990099|
|READHOME_WLE_CA |Index of use of reading skills at home (prose and document texts), categorised WLE (derived)        | 0.0295889| 0.1089109|
|ICTHOME_WLE_CA  |Index of use of ICT skills at home, categorised WLE (derived)                                       | 0.0288521| 0.1782178|
|NFEHRS          |Number of hours of participation in non-formal education (derived)                                  | 0.0203631| 0.1980198|
|READWORK_WLE_CA |Index of use of reading skills at work (prose and document texts), categorised WLE (derived)        | 0.0321537| 0.2079208|
|WRITHOME        |Index of use of writing skills at home (derived)                                                    | 0.0437597| 0.2178218|
|EDCAT7          |Highest level of formal education obtained (7 categories - derived)                                 | 0.0245782| 0.2277228|
|INFLUENCE       |Index of use of influencing skills at work (derived)                                                | 0.0532552| 0.2673267|
|NUMHOME_WLE_CA  |Index of use of numeracy skills at home (basic and advanced), categorised WLE (derived)             | 0.0241701| 0.2871287|
|EARNHRDCL       |Hourly earnings excluding bonuses for wage and salary earners, in deciles (derived)                 | 0.0314467| 0.3861386|
|WRITHOME_WLE_CA |Index of use of writing skills at home, categorised WLE (derived)                                   | 0.0234279| 0.4059406|
|ICTWORK_WLE_CA  |Index of use of ICT skills at work, categorised WLE (derived)                                       | 0.0226457| 0.4257426|
|ISCO1C          |Occupational classification of respondent's job at 1-digit level (ISCO 2008), current job (derived) | 0.0282249| 0.5049505|
|READWORK        |Index of use of reading skills at work (prose and document texts - derived)                         | 0.0666289| 0.5049505|
|ICTWORK         |Index of use of ICT skills at work (derived)                                                        | 0.0409673| 0.5445545|
|ISCO2C          |Occupational classification of respondent's job at 2-digit level (ISCO 2008), current job (derived) | 0.0372888| 0.6732673|
|WRITWORK        |Index of use of writing skills at work (derived)                                                    | 0.0283248| 0.7722772|
|WRITWORK_WLE_CA |Index of use of writing skills at work, categorised WLE (derived)                                   | 0.0176027| 0.7821782|
|TASKDISC        |Index of use of task discretion at work (derived)                                                   | 0.0217740| 0.8811881|
|ISIC2C          |Industry classification of respondent's job at 2-digit level (ISIC rev 4), current job (derived)    | 0.0180295| 0.8910891|
|LEARNATWORK     |Index of learning at work (derived)                                                                 | 0.0135484| 0.9603960|

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


## club\_membership-1 {#club-membership-1}

PROPERTIES:
EXPORT\_FILE\_NAME: \_index
EXPORT\_HUGO\_BUNDLE: club\_membership-1
END:

```text

--------------------------------------------------------------
tau and theta
--------------------------------------------------------------
Compare tidyLPA solutions:

 Model Classes AIC      AWE      BIC      CLC      KIC
 6     1       3195.453 3261.804 3217.128 3187.453 3203.453
 6     2       3161.946 3310.763 3209.632 3141.500 3175.946
 6     3       3152.293 3383.561 3225.989 3119.418 3172.293
 6     4       3159.872 3473.157 3259.578 3115.000 3185.872

Best model according to AIC is Model 6 with 3 classes.
Best model according to AWE is Model 6 with 1 classes.
Best model according to BIC is Model 6 with 2 classes.
Best model according to CLC is Model 6 with 4 classes.
Best model according to KIC is Model 6 with 3 classes.

An analytic hierarchy process, based on the fit indices AIC, AWE, BIC, CLC, and KIC (Akogul & Erisoglu, 2017), suggests the best solution is Model 6 with 2 classes.

--------------------------------------------------------------
tau and theta + naction, spd
--------------------------------------------------------------
Compare tidyLPA solutions:

 Model Classes AIC      AWE      BIC      CLC      KIC
 6     1       6134.530 6323.912 6195.221 6108.530 6151.530
 6     2       5670.979 6065.906 5796.695 5614.485 5702.979
 6     3       5569.672 6169.886 5760.414 5482.942 5616.672
 6     4       5543.584 6348.872 5799.352 5426.832 5605.584

Best model according to AIC is Model 6 with 4 classes.
Best model according to AWE is Model 6 with 2 classes.
Best model according to BIC is Model 6 with 3 classes.
Best model according to CLC is Model 6 with 4 classes.
Best model according to KIC is Model 6 with 4 classes.

An analytic hierarchy process, based on the fit indices AIC, AWE, BIC, CLC, and KIC (Akogul & Erisoglu, 2017), suggests the best solution is Model 6 with 3 classes.

--------------------------------------------------------------
naction, spd
--------------------------------------------------------------
Compare tidyLPA solutions:

 Model Classes AIC      AWE      BIC      CLC      KIC
 6     1       3205.646 3271.997 3227.322 3197.646 3213.646
 6     2       2940.339 3089.335 2988.024 2919.714 2954.339
 6     3       2882.730 3113.981 2956.426 2849.871 2902.730
 6     4       2880.659 3193.956 2980.365 2835.773 2906.659

Best model according to AIC is Model 6 with 4 classes.
Best model according to AWE is Model 6 with 2 classes.
Best model according to BIC is Model 6 with 3 classes.
Best model according to CLC is Model 6 with 4 classes.
Best model according to KIC is Model 6 with 3 classes.

An analytic hierarchy process, based on the fit indices AIC, AWE, BIC, CLC, and KIC (Akogul & Erisoglu, 2017), suggests the best solution is Model 6 with 3 classes.
```


### Covariates {#covariates}

&tau;'s covaritates:

|Name           |Label                                                                                                                   |       imp|      pval|
|:--------------|:-----------------------------------------------------------------------------------------------------------------------|---------:|---------:|
|AGEG5LFS       |Age groups in 5-year intervals based on LFS groupings (derived)                                                         | 14.373833| 0.0099010|
|AETPOP         |Adult education/training population (AET) - excludes youths 16-24 in initial cycle of studies (derived)                 |  4.640859| 0.0099010|
|ICTHOME        |Index of use of ICT skills at home (derived)                                                                            | 13.353906| 0.0099010|
|ICTHOME_WLE_CA |Index of use of ICT skills at home, categorised WLE (derived)                                                           |  5.592832| 0.0198020|
|FAET12NJR      |Participated in formal AET for non job-related reasons in 12 months preceding survey (see AETPOP - derived)             |  3.717283| 0.0297030|
|FNFAET12NJR    |Participated in formal or non-formal AET for non job-related reasons in 12 mon. preceding survey (see AETPOP - derived) |  2.997349| 0.0297030|
|INFLUENCE      |Index of use of influencing skills at work (derived)                                                                    |  6.754744| 0.0495050|
|ICTWORK        |Index of use of ICT skills at work (derived)                                                                            |  6.200792| 0.1089109|
|NFEHRS         |Number of hours of participation in non-formal education (derived)                                                      |  4.888798| 0.3168317|
|NFEHRSJR       |Number of hours of participation in non-formal education for job-related reasons (derived)                              |  4.400971| 0.3663366|

&theta;'s covaritates:

|Name             |Label                                                                                                  |        imp|      pval|
|:----------------|:------------------------------------------------------------------------------------------------------|----------:|---------:|
|G_Q07            |Skill use work - ICT - Computer - Got the skills needed                                                |  0.0086191| 0.0396040|
|EARNFLAG         |Earnings including bonuses reporting method (derived)                                                  |  0.0075101| 0.0396040|
|ICTWORK_WLE_CA   |Index of use of ICT skills at work, categorised WLE (derived)                                          |  0.0123213| 0.0495050|
|ISCO2C           |Occupational classification of respondent's job at 2-digit level (ISCO 2008), current job (derived)    |  0.0198953| 0.0594059|
|G_Q08            |Skill use work - ICT - Computer - Lack of skills affect career                                         |  0.0042630| 0.0693069|
|AGEG5LFS         |Age groups in 5-year intervals based on LFS groupings (derived)                                        |  0.0099424| 0.1089109|
|ISCO1C           |Occupational classification of respondent's job at 1-digit level (ISCO 2008), current job (derived)    |  0.0091321| 0.1881188|
|WRITHOME         |Index of use of writing skills at home (derived)                                                       |  0.0090213| 0.2178218|
|EDCAT6           |Highest level of formal education obtained (6 categories - derived)                                    |  0.0040663| 0.3069307|
|E_Q09            |Last job - Hours/week                                                                                  |  0.0025210| 0.3267327|
|READWORK_WLE_CA  |Index of use of reading skills at work (prose and document texts), categorised WLE (derived)           |  0.0058231| 0.4257426|
|D_Q04_T1         |Status at this job or business - four levels (Trend-IALS/ALL)                                          |  0.0038598| 0.4554455|
|READHOME         |Index of use of reading skills at home (prose and document texts - derived)                            |  0.0030265| 0.5544554|
|YRSQUAL_T        |Derived variable on total years of schooling during lifetime - top coded at 24 (Trend-IALS/ALL)        |  0.0016241| 0.5841584|
|PLANNING         |Index of use of planning skills at work (derived)                                                      |  0.0052826| 0.6237624|
|NUMWORK          |Index of use of numeracy skills at work (basic and advanced - derived)                                 |  0.0066305| 0.6534653|
|NUMWORK_WLE_CA   |Index of use of numeracy skills at work (basic and advanced), categorised WLE (derived)                |  0.0041318| 0.6633663|
|D_Q04_T          |Status at this job or business - six levels (Trend-IALS/ALL)                                           |  0.0037368| 0.6831683|
|ISIC2C           |Industry classification of respondent's job at 2-digit level (ISIC rev 4), current job (derived)       |  0.0049443| 0.7425743|
|D_Q10_C          |Current work - Hours/week (top-coded at 60)                                                            |  0.0054921| 0.7623762|
|EDCAT7           |Highest level of formal education obtained (7 categories - derived)                                    |  0.0016754| 0.7722772|
|INFLUENCE_WLE_CA |Index of use of influencing skills at work, categorised WLE (derived)                                  |  0.0021573| 0.8316832|
|WRITWORK         |Index of use of writing skills at work (derived)                                                       |  0.0054889| 0.8415842|
|ICTWORK          |Index of use of ICT skills at work (derived)                                                           |  0.0055861| 0.8613861|
|TASKDISC_WLE_CA  |Index of use of task discretion at work, categorised WLE (derived)                                     |  0.0017446| 0.8613861|
|EARNMTHALLDCL    |Monthly earnings including bonuses for wage and salary earners and self-employed, in deciles (derived) |  0.0023484| 0.9405941|
|NFEHRSJR         |Number of hours of participation in non-formal education for job-related reasons (derived)             | -0.0044239| 0.9900990|

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


## book\_order {#book-order}

PROPERTIES:
EXPORT\_FILE\_NAME: \_index
EXPORT\_HUGO\_BUNDLE: book\_order
END:

```text

--------------------------------------------------------------
tau and theta
--------------------------------------------------------------
Compare tidyLPA solutions:

 Model Classes AIC      AWE      BIC      CLC      KIC
 6     1       3070.992 3137.343 3092.668 3062.992 3078.992
 6     2       2763.965 2912.853 2811.650 2743.448 2777.965
 6     3       2758.060 2989.195 2831.756 2725.317 2778.060
 6     4       2759.583 3072.663 2859.290 2714.916 2785.583

Best model according to AIC is Model 6 with 3 classes.
Best model according to AWE is Model 6 with 2 classes.
Best model according to BIC is Model 6 with 2 classes.
Best model according to CLC is Model 6 with 4 classes.
Best model according to KIC is Model 6 with 2 classes.

An analytic hierarchy process, based on the fit indices AIC, AWE, BIC, CLC, and KIC (Akogul & Erisoglu, 2017), suggests the best solution is Model 6 with 2 classes.

--------------------------------------------------------------
tau and theta + naction, spd
--------------------------------------------------------------
Compare tidyLPA solutions:

 Model Classes AIC      AWE      BIC      CLC      KIC      Warnings
 6     1       5832.225 6021.606 5892.915 5806.225 5849.225
 6     2       4339.421 4734.053 4465.137 4283.221 4371.421
 6     3       3919.151 4518.706 4109.894 3833.081 3966.151
 6     4                                                    Warning

Best model according to AIC is Model 6 with 3 classes.
Best model according to AWE is Model 6 with 3 classes.
Best model according to BIC is Model 6 with 3 classes.
Best model according to CLC is Model 6 with 3 classes.
Best model according to KIC is Model 6 with 3 classes.

An analytic hierarchy process, based on the fit indices AIC, AWE, BIC, CLC, and KIC (Akogul & Erisoglu, 2017), suggests the best solution is Model 6 with 3 classes.

--------------------------------------------------------------
naction, spd
--------------------------------------------------------------
Compare tidyLPA solutions:

 Model Classes AIC      AWE      BIC      CLC      KIC      Warnings
 6     1       3181.591 3247.941 3203.266 3173.591 3189.591
 6     2       2481.236 2629.784 2528.921 2461.058 2495.236
 6     3                                                    Warning
 6     4                                                    Warning

Best model according to AIC is Model 6 with 2 classes.
Best model according to AWE is Model 6 with 2 classes.
Best model according to BIC is Model 6 with 2 classes.
Best model according to CLC is Model 6 with 2 classes.
Best model according to KIC is Model 6 with 2 classes.

An analytic hierarchy process, based on the fit indices AIC, AWE, BIC, CLC, and KIC (Akogul & Erisoglu, 2017), suggests the best solution is Model 6 with 2 classes.
```


### Covariates {#covariates}

&tau;'s covaritates:

|Name           |Label                                                                                                       |      imp|      pval|
|:--------------|:-----------------------------------------------------------------------------------------------------------|--------:|---------:|
|B_Q11          |Education - Formal qualification - Grant from employer                                                      | 2.039946| 0.0099010|
|FAET12         |Participated in formal AET in 12 months preceding survey (see AETPOP - derived)                             | 1.316256| 0.0099010|
|FAET12NJR      |Participated in formal AET for non job-related reasons in 12 months preceding survey (see AETPOP - derived) | 1.818654| 0.0198020|
|ISCO1C         |Occupational classification of respondent's job at 1-digit level (ISCO 2008), current job (derived)         | 1.609067| 0.0891089|
|ISCO2C         |Occupational classification of respondent's job at 2-digit level (ISCO 2008), current job (derived)         | 1.975223| 0.1386139|
|EARNHRBONUSDCL |Hourly earnings including bonuses for wage and salary earners, in deciles (derived)                         | 1.053179| 0.2079208|
|AGEG5LFS       |Age groups in 5-year intervals based on LFS groupings (derived)                                             | 2.005220| 0.2970297|
|C_Q09_C        |Current status/work history - Years of paid work during lifetime (top-coded at 47)                          | 2.223969| 0.3168317|

&theta;'s covaritates:

|Name           |Label                                                                                               |       imp|      pval|
|:--------------|:---------------------------------------------------------------------------------------------------|---------:|---------:|
|J_Q08          |Background - Number of books at home                                                                | 0.0271501| 0.0099010|
|ICTHOME        |Index of use of ICT skills at home (derived)                                                        | 0.0709937| 0.0099010|
|C_Q09_C        |Current status/work history - Years of paid work during lifetime (top-coded at 47)                  | 0.0289934| 0.0891089|
|READHOME       |Index of use of reading skills at home (prose and document texts - derived)                         | 0.0475137| 0.1386139|
|ISCO2C         |Occupational classification of respondent's job at 2-digit level (ISCO 2008), current job (derived) | 0.0389882| 0.2376238|
|NUMHOME        |Index of use of numeracy skills at home (basic and advanced - derived)                              | 0.0327606| 0.2475248|
|ICTHOME_WLE_CA |Index of use of ICT skills at home, categorised WLE (derived)                                       | 0.0096426| 0.3663366|
|NFEHRS         |Number of hours of participation in non-formal education (derived)                                  | 0.0207122| 0.4653465|
|TASKDISC       |Index of use of task discretion at work (derived)                                                   | 0.0150106| 0.5742574|
|READWORK       |Index of use of reading skills at work (prose and document texts - derived)                         | 0.0304869| 0.5841584|
|INFLUENCE      |Index of use of influencing skills at work (derived)                                                | 0.0229463| 0.5940594|
|NFEHRSJR       |Number of hours of participation in non-formal education for job-related reasons (derived)          | 0.0019651| 0.9207921|

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


## meeting\_room {#meeting-room}

PROPERTIES:
EXPORT\_FILE\_NAME: \_index
EXPORT\_HUGO\_BUNDLE: meeting\_room
END:

```text

--------------------------------------------------------------
tau and theta
--------------------------------------------------------------
Compare tidyLPA solutions:

 Model Classes AIC      AWE      BIC      CLC      KIC
 6     1       3028.185 3094.536 3049.861 3020.185 3036.185
 6     2       2337.140 2485.728 2384.826 2316.924 2351.140
 6     3       2233.845 2464.647 2307.541 2201.434 2253.845
 6     4       2205.603 2518.707 2305.309 2160.912 2231.603

Best model according to AIC is Model 6 with 4 classes.
Best model according to AWE is Model 6 with 3 classes.
Best model according to BIC is Model 6 with 4 classes.
Best model according to CLC is Model 6 with 4 classes.
Best model according to KIC is Model 6 with 4 classes.

An analytic hierarchy process, based on the fit indices AIC, AWE, BIC, CLC, and KIC (Akogul & Erisoglu, 2017), suggests the best solution is Model 6 with 4 classes.

--------------------------------------------------------------
tau and theta + naction, spd
--------------------------------------------------------------
Compare tidyLPA solutions:

 Model Classes AIC      AWE      BIC      CLC      KIC
 6     1       5905.357 6094.738 5966.048 5879.357 5922.357
 6     2       3923.226 4317.819 4048.943 3867.067 3955.226
 6     3       3606.538 4206.399 3797.280 3520.162 3653.538
 6     4       3421.805 4226.696 3677.573 3305.450 3483.805

Best model according to AIC is Model 6 with 4 classes.
Best model according to AWE is Model 6 with 3 classes.
Best model according to BIC is Model 6 with 4 classes.
Best model according to CLC is Model 6 with 4 classes.
Best model according to KIC is Model 6 with 4 classes.

An analytic hierarchy process, based on the fit indices AIC, AWE, BIC, CLC, and KIC (Akogul & Erisoglu, 2017), suggests the best solution is Model 6 with 4 classes.

--------------------------------------------------------------
naction, spd
--------------------------------------------------------------
Compare tidyLPA solutions:

 Model Classes AIC      AWE      BIC      CLC      KIC      Warnings
 6     1       3151.879 3218.229 3173.554 3143.879 3159.879
 6     2       2168.985 2317.588 2216.671 2148.754 2182.985
 6     3                                                    Warning
 6     4       2086.559 2399.489 2186.265 2042.042 2112.559

Best model according to AIC is Model 6 with 4 classes.
Best model according to AWE is Model 6 with 2 classes.
Best model according to BIC is Model 6 with 4 classes.
Best model according to CLC is Model 6 with 4 classes.
Best model according to KIC is Model 6 with 4 classes.

An analytic hierarchy process, based on the fit indices AIC, AWE, BIC, CLC, and KIC (Akogul & Erisoglu, 2017), suggests the best solution is Model 6 with 4 classes.
```


### Covariates {#covariates}

&tau;'s covaritates:

|Name           |Label                                                                                                              |       imp|      pval|
|:--------------|:------------------------------------------------------------------------------------------------------------------|---------:|---------:|
|AGEG5LFS       |Age groups in 5-year intervals based on LFS groupings (derived)                                                    | 10.574260| 0.0099010|
|NFE12          |Participated in non-formal education in 12 months preceding survey (derived)                                       |  4.066070| 0.0099010|
|NOPAIDWORKEVER |Adults who never had paid work including self-employment in past (derived)                                         |  2.430960| 0.0099010|
|NFE12JR        |Participated in non-formal education for job-related reasons in 12 months preceding survey (derived)               |  4.028282| 0.0198020|
|NFE12NJR       |Participated in non-formal education for non job-related reasons in 12 months preceding survey (derived)           |  3.117735| 0.0198020|
|ICTWORK        |Index of use of ICT skills at work (derived)                                                                       |  7.580768| 0.0594059|
|C_Q09_C        |Current status/work history - Years of paid work during lifetime (top-coded at 47)                                 |  7.175381| 0.0792079|
|FNFE12JR       |Participated in formal or non-formal education for job-related reasons in 12 months preceding the survey (derived) |  1.744144| 0.0792079|
|B_Q17          |Activities - Last year - Time spend - Unit                                                                         |  2.801032| 0.0891089|
|G_Q06          |Skill use work - ICT - Computer - Level of computer use                                                            |  4.067908| 0.1089109|
|WRITHOME       |Index of use of writing skills at home (derived)                                                                   |  4.522780| 0.1089109|
|B_Q16          |Activities - Last year - Grant from employer                                                                       |  4.424977| 0.1584158|
|NFEHRSNJR      |Number of hours of participation in non-formal education for non-job-related reasons (derived)                     |  5.588817| 0.1584158|
|PLANNING       |Index of use of planning skills at work (derived)                                                                  |  3.179292| 0.2178218|
|YRSGET         |Imputed years of formal education needed to get the job (self-reported - derived)                                  |  3.865380| 0.3267327|
|ICTHOME        |Index of use of ICT skills at home (derived)                                                                       |  3.549376| 0.3564356|
|NUMHOME        |Index of use of numeracy skills at home (basic and advanced - derived)                                             |  2.697814| 0.3663366|
|B_Q13          |Activities - Last year - Activity specified                                                                        |  1.810237| 0.4059406|
|EARNHRDCL      |Hourly earnings excluding bonuses for wage and salary earners, in deciles (derived)                                |  3.448778| 0.4158416|
|EARNHRBONUSDCL |Hourly earnings including bonuses for wage and salary earners, in deciles (derived)                                |  3.263442| 0.4554455|
|NFEHRS         |Number of hours of participation in non-formal education (derived)                                                 |  3.260719| 0.4950495|
|LEARNATWORK    |Index of learning at work (derived)                                                                                |  2.990704| 0.5049505|
|NFEHRSJR       |Number of hours of participation in non-formal education for job-related reasons (derived)                         |  2.709997| 0.5148515|
|ISCO2C         |Occupational classification of respondent's job at 2-digit level (ISCO 2008), current job (derived)                |  4.420293| 0.5544554|
|ICTHOME_WLE_CA |Index of use of ICT skills at home, categorised WLE (derived)                                                      |  1.327060| 0.7227723|
|ISCO1C         |Occupational classification of respondent's job at 1-digit level (ISCO 2008), current job (derived)                |  2.318859| 0.7326733|
|READWORK       |Index of use of reading skills at work (prose and document texts - derived)                                        |  3.215353| 0.7722772|
|D_Q10_T        |Hours per week at this job or business - number of hours (top coded at 97, Trend-IALS/ALL)                         |  2.600368| 0.9108911|
|D_Q10_C        |Current work - Hours/week (top-coded at 60)                                                                        |  1.640815| 0.9207921|

&theta;'s covaritates:

|Name           |Label                                                                              |       imp|      pval|
|:--------------|:----------------------------------------------------------------------------------|---------:|---------:|
|ICTHOME        |Index of use of ICT skills at home (derived)                                       | 0.2770673| 0.0099010|
|G_Q07          |Skill use work - ICT - Computer - Got the skills needed                            | 0.1497847| 0.0198020|
|ICTHOME_WLE_CA |Index of use of ICT skills at home, categorised WLE (derived)                      | 0.0935616| 0.0198020|
|ICTWORK        |Index of use of ICT skills at work (derived)                                       | 0.1938268| 0.0198020|
|AGEG5LFS       |Age groups in 5-year intervals based on LFS groupings (derived)                    | 0.2759343| 0.0297030|
|C_Q09_C        |Current status/work history - Years of paid work during lifetime (top-coded at 47) | 0.2060004| 0.1188119|
|READYTOLEARN   |Index of readiness to learn (derived)                                              | 0.0308734| 0.3861386|

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


## locate\_email {#locate-email}

PROPERTIES:
EXPORT\_FILE\_NAME: \_index
EXPORT\_HUGO\_BUNDLE: locate\_email
END:


### Covariates {#covariates}

&tau;'s covaritates:

|Name           |Label                                                                                               |      imp|      pval|
|:--------------|:---------------------------------------------------------------------------------------------------|--------:|---------:|
|AGEG5LFS       |Age groups in 5-year intervals based on LFS groupings (derived)                                     | 9.885435| 0.0495050|
|C_Q09_C        |Current status/work history - Years of paid work during lifetime (top-coded at 47)                  | 7.626948| 0.1683168|
|EARNHRBONUSDCL |Hourly earnings including bonuses for wage and salary earners, in deciles (derived)                 | 4.612719| 0.1683168|
|EARNHRDCL      |Hourly earnings excluding bonuses for wage and salary earners, in deciles (derived)                 | 2.667057| 0.4356436|
|ISCO2C         |Occupational classification of respondent's job at 2-digit level (ISCO 2008), current job (derived) | 3.068539| 0.6039604|
|WRITWORK       |Index of use of writing skills at work (derived)                                                    | 2.090278| 0.6039604|

&theta;'s covaritates:

|Name             |Label                                                                                               |        imp|      pval|
|:----------------|:---------------------------------------------------------------------------------------------------|----------:|---------:|
|AGEG5LFS         |Age groups in 5-year intervals based on LFS groupings (derived)                                     |  0.0244116| 0.0198020|
|ICTWORK          |Index of use of ICT skills at work (derived)                                                        |  0.0472448| 0.0198020|
|ICTWORK_WLE_CA   |Index of use of ICT skills at work, categorised WLE (derived)                                       |  0.0214467| 0.0495050|
|NUMHOME          |Index of use of numeracy skills at home (basic and advanced - derived)                              |  0.0339415| 0.0693069|
|EDCAT6           |Highest level of formal education obtained (6 categories - derived)                                 |  0.0216979| 0.0891089|
|D_Q04_T          |Status at this job or business - six levels (Trend-IALS/ALL)                                        |  0.0158932| 0.1386139|
|NFEHRS           |Number of hours of participation in non-formal education (derived)                                  |  0.0242799| 0.1386139|
|NFEHRSJR         |Number of hours of participation in non-formal education for job-related reasons (derived)          |  0.0150190| 0.2574257|
|NUMWORK          |Index of use of numeracy skills at work (basic and advanced - derived)                              |  0.0212383| 0.2772277|
|TASKDISC         |Index of use of task discretion at work (derived)                                                   |  0.0186273| 0.3168317|
|ISCO2C           |Occupational classification of respondent's job at 2-digit level (ISCO 2008), current job (derived) |  0.0178071| 0.3564356|
|INFLUENCE        |Index of use of influencing skills at work (derived)                                                |  0.0212973| 0.3960396|
|EARNHRDCL        |Hourly earnings excluding bonuses for wage and salary earners, in deciles (derived)                 |  0.0083536| 0.5841584|
|INFLUENCE_WLE_CA |Index of use of influencing skills at work, categorised WLE (derived)                               |  0.0063890| 0.5940594|
|READWORK         |Index of use of reading skills at work (prose and document texts - derived)                         |  0.0169418| 0.6336634|
|ICTHOME          |Index of use of ICT skills at home (derived)                                                        |  0.0002208| 0.7128713|
|READYTOLEARN     |Index of readiness to learn (derived)                                                               | -0.0016250| 0.7623762|

![](/ox-hugo/theta_tau_res.png)
![](/ox-hugo/tau_action.png)
![](/ox-hugo/time_action-3.png)
![](/ox-hugo/time_action_more-2.png)
![](/ox-hugo/time_action_more-5.png)
![](/ox-hugo/time_action_more-7.png)
![](/ox-hugo/time_action_more-8.png)
[![](/ox-hugo/time_action_more-9.png)
![](/ox-hugo/time_action_more-10.png)
![](/ox-hugo/time_action_more-11.png)
![](/ox-hugo/time_action_more-13.png)


## lamp\_return {#lamp-return}

```text

--------------------------------------------------------------
tau and theta
--------------------------------------------------------------
Compare tidyLPA solutions:

 Model Classes AIC      AWE      BIC      CLC      KIC
 6     1       2984.923 3051.238 3006.580 2976.923 2992.923
 6     2       2843.422 2992.713 2891.068 2822.424 2857.422
 6     3       2834.686 3066.037 2908.321 2801.606 2854.686
 6     4       2837.236 3150.652 2936.861 2792.070 2863.236

Best model according to AIC is Model 6 with 3 classes.
Best model according to AWE is Model 6 with 2 classes.
Best model according to BIC is Model 6 with 2 classes.
Best model according to CLC is Model 6 with 4 classes.
Best model according to KIC is Model 6 with 3 classes.

An analytic hierarchy process, based on the fit indices AIC, AWE, BIC, CLC, and KIC (Akogul & Erisoglu, 2017), suggests the best solution is Model 6 with 2 classes.

--------------------------------------------------------------
tau and theta + naction, spd
--------------------------------------------------------------
Compare tidyLPA solutions:

 Model Classes AIC      AWE      BIC      CLC      KIC
 6     1       5305.384 5494.666 5366.025 5279.384 5322.384
 6     2       4687.024 5081.824 4812.637 4630.451 4719.024
 6     3       4486.831 5086.505 4677.417 4400.329 4533.831
 6     4       4382.983 5187.603 4638.541 4266.480 4444.983

Best model according to AIC is Model 6 with 4 classes.
Best model according to AWE is Model 6 with 2 classes.
Best model according to BIC is Model 6 with 4 classes.
Best model according to CLC is Model 6 with 4 classes.
Best model according to KIC is Model 6 with 4 classes.

An analytic hierarchy process, based on the fit indices AIC, AWE, BIC, CLC, and KIC (Akogul & Erisoglu, 2017), suggests the best solution is Model 6 with 4 classes.

--------------------------------------------------------------
naction, spd
--------------------------------------------------------------
Compare tidyLPA solutions:

 Model Classes AIC      AWE      BIC      CLC      KIC
 6     1       3081.781 3148.096 3103.438 3073.781 3089.781
 6     2       2727.342 2876.222 2774.988 2706.754 2741.342
 6     3       2656.305 2887.444 2729.940 2623.437 2676.305
 6     4       2632.494 2945.687 2732.119 2587.550 2658.494

Best model according to AIC is Model 6 with 4 classes.
Best model according to AWE is Model 6 with 2 classes.
Best model according to BIC is Model 6 with 3 classes.
Best model according to CLC is Model 6 with 4 classes.
Best model according to KIC is Model 6 with 4 classes.

An analytic hierarchy process, based on the fit indices AIC, AWE, BIC, CLC, and KIC (Akogul & Erisoglu, 2017), suggests the best solution is Model 6 with 4 classes.
```


### Covariates {#covariates}

&tau;'s covaritates:

|Name      |Label                                                                                                       |        imp|      pval|
|:---------|:-----------------------------------------------------------------------------------------------------------|----------:|---------:|
|FAET12NJR |Participated in formal AET for non job-related reasons in 12 months preceding survey (see AETPOP - derived) |  1.0300584| 0.4851485|
|AETPOP    |Adult education/training population (AET) - excludes youths 16-24 in initial cycle of studies (derived)     |  0.1879347| 0.6633663|
|EDWORK    |Interaction between adults' work and education status (derived)                                             |  1.4991299| 0.7524752|
|FAET12JR  |Participated in formal AET for job-related reasons in 12 months preceding survey (see AETPOP - derived)     |  0.3786924| 0.9009901|
|AGEG5LFS  |Age groups in 5-year intervals based on LFS groupings (derived)                                             |  0.6285724| 0.9405941|
|C_Q09_C   |Current status/work history - Years of paid work during lifetime (top-coded at 47)                          | -0.8047911| 0.9603960|

&theta;'s covaritates:

|Name            |Label                                                                                                  |       imp|      pval|
|:---------------|:------------------------------------------------------------------------------------------------------|---------:|---------:|
|J_Q08           |Background - Number of books at home                                                                   | 0.0135860| 0.0198020|
|C_Q09_C         |Current status/work history - Years of paid work during lifetime (top-coded at 47)                     | 0.0309081| 0.0495050|
|B_Q11           |Education - Formal qualification - Grant from employer                                                 | 0.0081927| 0.0891089|
|EARNMTHALLDCL   |Monthly earnings including bonuses for wage and salary earners and self-employed, in deciles (derived) | 0.0272210| 0.0990099|
|ISCOSKIL4       |Occupational classification of respondent's job (4 skill based categories), last or current (derived)  | 0.0092023| 0.1287129|
|INFLUENCE       |Index of use of influencing skills at work (derived)                                                   | 0.0316348| 0.1386139|
|NFEHRS          |Number of hours of participation in non-formal education (derived)                                     | 0.0180541| 0.1485149|
|PLANNING        |Index of use of planning skills at work (derived)                                                      | 0.0172973| 0.1683168|
|G_Q07           |Skill use work - ICT - Computer - Got the skills needed                                                | 0.0063477| 0.2475248|
|PLANNING_WLE_CA |Index of use of planning skills at work, categorised WLE (derived)                                     | 0.0135498| 0.2475248|
|D_Q04_T1        |Status at this job or business - four levels (Trend-IALS/ALL)                                          | 0.0102142| 0.2871287|
|B_Q16           |Activities - Last year - Grant from employer                                                           | 0.0101070| 0.2970297|
|WRITWORK        |Index of use of writing skills at work (derived)                                                       | 0.0168268| 0.3267327|
|ISCO1C          |Occupational classification of respondent's job at 1-digit level (ISCO 2008), current job (derived)    | 0.0116369| 0.3564356|
|EARNHRDCL       |Hourly earnings excluding bonuses for wage and salary earners, in deciles (derived)                    | 0.0133331| 0.3564356|
|NFEHRSNJR       |Number of hours of participation in non-formal education for non-job-related reasons (derived)         | 0.0106176| 0.3762376|
|TASKDISC        |Index of use of task discretion at work (derived)                                                      | 0.0165097| 0.3861386|
|READYTOLEARN    |Index of readiness to learn (derived)                                                                  | 0.0042571| 0.4950495|
|ICTHOME         |Index of use of ICT skills at home (derived)                                                           | 0.0033957| 0.4950495|
|D_Q10           |Current work - Hours/week                                                                              | 0.0133820| 0.6039604|
|D_Q10_T         |Hours per week at this job or business - number of hours (top coded at 97, Trend-IALS/ALL)             | 0.0105554| 0.8019802|

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
