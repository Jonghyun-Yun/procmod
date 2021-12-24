+++
title = "Applications"
author = ["Jonghyun Yun"]
lastmod = 2021-12-23T20:50:22-06:00
draft = false
weight = 50
chapter = true
+++

<div class="ox-hugo-toc toc">
<div></div>

<div class="heading">Table of Contents</div>

- [party\_invitations-1](#party-invitations-1)
    - [collocation](#collocation)
    - [visual cluster](#visual-cluster)
    - [response](#response)
- [party\_invitations-2](#party-invitations-2)
    - [collocations](#collocations)
    - [visualise cluster](#visualise-cluster)
        - [with tau, theta](#with-tau-theta)
        - [w.o. tau, theta](#w-dot-o-dot-tau-theta)
    - [response](#response)
- [cd\_tally](#cd-tally)
    - [collocations](#collocations)
    - [visualise cluster](#visualise-cluster)
    - [response](#response)
- [sprained\_ankle-1](#sprained-ankle-1)
    - [collocations](#collocations)
    - [visualise cluster](#visualise-cluster)
        - [with tau, theta](#with-tau-theta)
        - [w.o. tau, theta](#w-dot-o-dot-tau-theta)
    - [response](#response)
- [tickets](#tickets)
    - [collocation](#collocation)
    - [visualize clusters](#visualize-clusters)
    - [response](#response)
- [club\_membership-1](#club-membership-1)
    - [collocations](#collocations)
    - [visualise cluster](#visualise-cluster)
        - [with tau, theta](#with-tau-theta)
        - [w.o. tau, theta](#w-dot-o-dot-tau-theta)
    - [response](#response)
- [book\_order](#book-order)
    - [collocations](#collocations)
    - [visual clusters](#visual-clusters)
    - [reponse](#reponse)
- [meeting\_room](#meeting-room)
    - [collocations](#collocations)
    - [visualise cluster](#visualise-cluster)
    - [response](#response)
- [locate\_email](#locate-email)
    - [collocations](#collocations)
    - [visualise cluster](#visualise-cluster)
        - [with tau, theta](#with-tau-theta)
        - [w.o. tau, theta](#w-dot-o-dot-tau-theta)
    - [response](#response)
- [lamp\_return](#lamp-return)
    - [collocations](#collocations)
    - [visualise cluster](#visualise-cluster)
    - [response](#response)

</div>
<!--endtoc-->

We implement the prposed method to our motivating example.

-   `ftime`: time until the first action taken
-   `time`: total time of a person's process

We introduce two rudimentary statistcs.

-   `naction` or `#action`: the action sequence length \\(M\_{k}\\). The total number of actions taken by respondent \\(k\\).
-   `fastness`: `#action` divided by the total time elaped since \\(t\_{k,1}\\).

Multivariate Gaussian mixture for clustering

-   Varying variances and varying covariances (Model 6)

    AIC and BIC ..

I need one more on cluster analysis:

-   [ ] I want to compare sub-sequences between clusters: longest common subsequence <&ulitzsch_combining_2021>
    -   common subsequences in LCS? NLP would be useful here: common phrase?
        -   ans: n-grams like tri-grams
        -   ans: most interesting collocations
-   [ ] map respondent to word embedding, mark speed / &tau; / &theta;
-   [ ] action frequencies cluster: top 5 actions?
-   [ ] how sentences are compared in NLP? Text Summarization

Do

1.  collcations: freq and time -> show what are these actions, explain semantic ass and time efficiency
2.  map respondents marked by &tau;, &theta;: find neighboring actions?? not necessarily what they did
3.  text summary: how it works? too ambiguous.. it seems to work by removing some sentences


# party\_invitations-1 {#party-invitations-1}


## collocation {#collocation}



## Class  1


|bigram                                                                    | likelihood_ratio|
|:-------------------------------------------------------------------------|----------------:|
|('FOLDER_VIEWED-CanComeFolder', 'MAIL_MOVED-item101.CanComeFolder')       |         817.3284|
|('FOLDER_VIEWED-CannotComeFolder', 'MAIL_MOVED-item102.CannotComeFolder') |         723.4372|
|('NEXT_INQUIRY-REQUEST', 'END_CANCEL-endtask_txt4')                       |         510.8037|
|('FOLDER_VIEWED-CanComeFolder', 'MAIL_MOVED-item104.CanComeFolder')       |         495.2927|
|('MAIL_VIEWED-item102', 'MAIL_DRAG-item102')                              |         416.9918|
|('FOLDER_VIEWED-TrashFolder', 'MAIL_MOVED-item103.target=TrashFolder')    |         374.2922|
|('FOLDER_VIEWED-TrashFolder', 'MAIL_MOVED-item105.target=TrashFolder')    |         320.9747|
|('FOLDER_VIEWED-InboxFolder', 'MAIL_MOVED-item103.InboxFolder')           |         315.7787|
|('FOLDER_VIEWED-CannotComeFolder', 'MAIL_VIEWED-item301')                 |         292.7040|
|('FOLDER_VIEWED-CannotComeFolder', 'MAIL_MOVED-item301.CannotComeFolder') |         278.9309|


## Class  2


|bigram                                                                    | likelihood_ratio|
|:-------------------------------------------------------------------------|----------------:|
|('FOLDER_VIEWED-CannotComeFolder', 'MAIL_MOVED-item102.CannotComeFolder') |         894.4766|
|('FOLDER_VIEWED-CanComeFolder', 'MAIL_MOVED-item101.CanComeFolder')       |         865.1981|
|('FOLDER_VIEWED-CanComeFolder', 'MAIL_MOVED-item104.CanComeFolder')       |         654.7479|
|('MAIL_VIEWED-item102', 'MAIL_DRAG-item102')                              |         646.6347|
|('FOLDER_VIEWED-CannotComeFolder', 'MAIL_VIEWED-item301')                 |         485.7336|
|('NEXT_INQUIRY-REQUEST', 'END_CANCEL-endtask_txt4')                       |         449.1188|
|('MAIL_VIEWED-item201', 'MAIL_VIEWED-item202')                            |         310.1378|
|('FOLDER_VIEWED-CanComeFolder', 'MAIL_VIEWED-item201')                    |         259.9339|
|('MAIL_DRAG-item104', 'FOLDER_VIEWED-CanComeFolder')                      |         234.2510|
|('FOLDER_VIEWED-CanComeFolder', 'FOLDER_VIEWED-CanComeFolder')            |         224.1286|


## Class  3


|bigram                                                                    | likelihood_ratio|
|:-------------------------------------------------------------------------|----------------:|
|('FOLDER_VIEWED-CannotComeFolder', 'MAIL_MOVED-item102.CannotComeFolder') |        1920.6574|
|('FOLDER_VIEWED-CanComeFolder', 'MAIL_MOVED-item101.CanComeFolder')       |        1414.3165|
|('FOLDER_VIEWED-CanComeFolder', 'MAIL_MOVED-item104.CanComeFolder')       |        1367.2376|
|('MAIL_VIEWED-item102', 'MAIL_DRAG-item102')                              |        1151.9347|
|('MAIL_MOVED-item104.CanComeFolder', 'MAIL_VIEWED-item105')               |         528.8972|
|('MAIL_VIEWED-item104', 'MAIL_DRAG-item104')                              |         473.7513|
|('MAIL_DRAG-item104', 'FOLDER_VIEWED-CanComeFolder')                      |         462.6390|
|('MAIL_VIEWED-item105', 'NEXT_INQUIRY-REQUEST')                           |         374.3775|
|('MAIL_MOVED-item101.CanComeFolder', 'MAIL_VIEWED-item102')               |         349.0786|
|('MAIL_MOVED-item102.CannotComeFolder', 'MAIL_VIEWED-item103')            |         319.1954|


## Class  4


|bigram                                                                    | likelihood_ratio|
|:-------------------------------------------------------------------------|----------------:|
|('NEXT_INQUIRY-REQUEST', 'END_CANCEL-endtask_txt4')                       |        217.80195|
|('FOLDER_VIEWED-CanComeFolder', 'MAIL_MOVED-item101.CanComeFolder')       |        215.63280|
|('FOLDER_VIEWED-CanComeFolder', 'MAIL_MOVED-item104.CanComeFolder')       |        211.32627|
|('MAIL_MOVED-item101.CanComeFolder', 'MAIL_DRAG-item104')                 |        148.42662|
|('FOLDER_VIEWED-CannotComeFolder', 'MAIL_MOVED-item102.CannotComeFolder') |        141.61502|
|('MAIL_VIEWED-item102', 'MAIL_DRAG-item102')                              |         96.50556|
|('MAIL_DRAG-item104', 'FOLDER_VIEWED-CanComeFolder')                      |         89.07329|
|('FOLDER_VIEWED-CanComeFolder', 'FOLDER_VIEWED-CannotComeFolder')         |         63.34961|
|('FOLDER_VIEWED-CanComeFolder', 'MAIL_VIEWED-item202')                    |         60.13844|
|('MAIL_VIEWED-item103', 'MAIL_VIEWED-item104')                            |         58.77450|


## visual cluster {#visual-cluster}

![](party_invitations-1/figure/lpa_box_all_2.png)
![](party_invitations-1/figure/lpa_box_all_3.png)

![](party_invitations-1/figure/lpa_vio_all_2.png)
![](party_invitations-1/figure/lpa_vio_all_3.png)


## response {#response}

Response: the larger, the better


### w/ tau and theta


|          tau|        theta|      naction|          spd|         res|             n|
|------------:|------------:|------------:|------------:|-----------:|-------------:|
| -0.86 (0.59)|  0.18 (0.87)| -0.29 (0.72)| -0.67 (0.46)| 2.68 (2.70)| 228.00 (0.00)|
|  0.63 (0.57)| -0.03 (0.95)| -0.22 (0.50)|  0.19 (0.73)| 1.31 (1.32)| 255.00 (0.00)|
|  0.42 (1.21)| -0.40 (1.32)|  1.51 (1.45)|  1.30 (1.29)| 2.04 (2.28)|  81.00 (0.00)|

### w/o tau and theta


|      naction|          spd|      CPROB1|      CPROB2|         res|             n|
|------------:|------------:|-----------:|-----------:|-----------:|-------------:|
| -0.36 (0.68)| -0.70 (0.41)| 0.84 (0.12)| 0.12 (0.11)| 2.45 (2.58)| 293.00 (0.00)|
| -0.10 (0.40)|  0.49 (0.49)| 0.10 (0.14)| 0.82 (0.14)| 1.34 (1.39)| 194.00 (0.00)|
|  1.63 (1.41)|  1.42 (1.26)| 0.02 (0.06)| 0.06 (0.11)| 1.70 (1.94)|  77.00 (0.00)|


# party\_invitations-2 {#party-invitations-2}


## collocations {#collocations}

## Class  1


|bigram                                                                               | likelihood_ratio|
|:------------------------------------------------------------------------------------|----------------:|
|('MENU-file-menu', 'MENUITEM_newfolder-key=newfolder')                               |        2528.3556|
|('TEXTBOX_ONFOCUS-createfoldernameinput.value=', 'KEYPRESS')                         |        1799.8624|
|('MAIL_VIEWED-item105', 'MAIL_DRAG-item105')                                         |        1342.5568|
|('MAIL_VIEWED-item103', 'MAIL_DRAG-item103')                                         |        1298.1635|
|('MAIL_VIEWED-item101', 'MAIL_DRAG-item101')                                         |        1172.5856|
|('MAIL_VIEWED-item102', 'MAIL_DRAG-item102')                                         |        1108.3516|
|('MENUITEM_newfolder-key=newfolder', 'TEXTBOX_ONFOCUS-createfoldernameinput.value=') |         992.6872|
|('FOLDER_VIEWED-item0', 'MAIL_MOVED-item101.target=item0')                           |         944.8772|
|('MAIL_VIEWED-item104', 'MAIL_DRAG-item104')                                         |         824.0098|
|('FOLDER_VIEWED-item0', 'MAIL_MOVED-item103.target=item0')                           |         818.9305|
## Class  2


|bigram                                                                               | likelihood_ratio|
|:------------------------------------------------------------------------------------|----------------:|
|('MENU-file-menu', 'MENUITEM_newfolder-key=newfolder')                               |        149.15848|
|('TEXTBOX_ONFOCUS-createfoldernameinput.value=', 'KEYPRESS')                         |        143.13642|
|('FOLDER_UNFOLDED-PartyFolder', 'FOLDER_FOLDED-PartyFolder')                         |         84.27078|
|('MAIL_VIEWED-item104', 'MAIL_VIEWED-item105')                                       |         77.60177|
|('MENUITEM_newfolder-key=newfolder', 'TEXTBOX_ONFOCUS-createfoldernameinput.value=') |         70.86729|
|('MAIL_VIEWED-item102', 'MAIL_VIEWED-item103')                                       |         69.67765|
|('FOLDER_UNFOLDED-myMails', 'FOLDER_FOLDED-myMails')                                 |         68.68677|
|('NEXT_INQUIRY-REQUEST', 'END_CANCEL-endunit_txt4')                                  |         60.63236|
|('FOLDER_VIEWED-CanComeFolder', 'MAIL_MOVED-item104.CanComeFolder')                  |         52.70685|
|('MAIL_VIEWED-item103', 'MAIL_VIEWED-item104')                                       |         51.41539|
## Class  3


|bigram                                                                               | likelihood_ratio|
|:------------------------------------------------------------------------------------|----------------:|
|('MENU-file-menu', 'MENUITEM_newfolder-key=newfolder')                               |         2995.612|
|('TEXTBOX_ONFOCUS-createfoldernameinput.value=', 'KEYPRESS')                         |         2770.209|
|('MAIL_VIEWED-item105', 'MAIL_DRAG-item105')                                         |         2528.411|
|('MAIL_VIEWED-item101', 'MAIL_DRAG-item101')                                         |         2279.772|
|('MAIL_VIEWED-item103', 'MAIL_DRAG-item103')                                         |         1976.424|
|('FOLDER_VIEWED-item0', 'MAIL_MOVED-item101.target=item0')                           |         1835.078|
|('FOLDER_VIEWED-item0', 'MAIL_MOVED-item103.target=item0')                           |         1787.390|
|('FOLDER_VIEWED-item0', 'MAIL_MOVED-item105.target=item0')                           |         1719.341|
|('MENUITEM_newfolder-key=newfolder', 'TEXTBOX_ONFOCUS-createfoldernameinput.value=') |         1487.584|
|('MAIL_VIEWED-item102', 'MAIL_DRAG-item102')                                         |         1375.493|
## Class  4


|bigram                                                  | likelihood_ratio|
|:-------------------------------------------------------|----------------:|
|('FOLDER_VIEWED-CanComeFolder', 'NEXT_INQUIRY-REQUEST') |         6.843888|
|('TOOLBAR_mailApp-mailApp', 'NEXT_INQUIRY-REQUEST')     |         2.256425|


## visualise cluster {#visualise-cluster}


### with tau, theta {#with-tau-theta}

{{< figure src="party_invitations-2/figure/lpa_box_all_3.png" >}}


### w.o. tau, theta {#w-dot-o-dot-tau-theta}

{{< figure src="party_invitations-2/figure/lpa_vio_all_3.png" >}}


## response {#response}


### w/ tau and theta


|          tau|        theta|      naction|          spd|         res|             n|
|------------:|------------:|------------:|------------:|-----------:|-------------:|
|  0.69 (1.21)| -0.14 (0.54)|  0.69 (1.07)|  0.36 (1.03)| 4.23 (3.00)| 342.00 (0.00)|
| -0.12 (0.68)| -0.86 (0.82)| -1.14 (0.24)| -1.13 (0.45)| 6.96 (0.47)| 165.00 (0.00)|
| -0.48 (0.54)|  0.80 (0.40)|  0.09 (0.39)|  0.30 (0.68)| 2.32 (2.49)| 404.00 (0.00)|
| -0.40 (0.24)| -2.33 (0.16)| -1.48 (0.01)| -1.01 (0.87)| 7.00 (0.00)|  56.00 (0.00)|

### w/o tau and theta


|      naction|          spd|      CPROB1|      CPROB2|         res|             n|
|------------:|------------:|-----------:|-----------:|-----------:|-------------:|
| -1.40 (0.09)| -1.46 (0.29)| 0.90 (0.11)| 0.00 (0.00)| 7.00 (0.00)| 112.00 (0.00)|
|  1.71 (1.57)|  1.31 (1.21)| 0.00 (0.00)| 0.82 (0.19)| 4.75 (2.93)|  72.00 (0.00)|
|  0.50 (0.55)|  0.60 (0.71)| 0.00 (0.00)| 0.11 (0.09)| 2.81 (2.76)| 377.00 (0.00)|
| -0.38 (0.49)| -0.39 (0.51)| 0.02 (0.07)| 0.02 (0.03)| 4.28 (2.99)| 406.00 (0.00)|


# cd\_tally {#cd-tally}


## collocations {#collocations}

## Class  1


|bigram                                                                     | likelihood_ratio|
|:--------------------------------------------------------------------------|----------------:|
|('SUBMIT_complete-u03_default_txt14', 'NEXT_INQUIRY-REQUEST')              |       1459.57552|
|('TOOLBAR_spreadApp-spreadApp', 'TOOLBAR_webApp-webApp')                   |       1189.05250|
|('TOOLBAR_webApp-webApp', 'COMBOBOX-menulist.index=9')                     |        455.87983|
|('COMBOBOX-menulist.index=9', 'SUBMIT_complete-u03_default_txt14')         |        404.68816|
|('TOOLBAR_webApp-webApp', 'TOOLBAR_spreadApp-spreadApp')                   |        178.25025|
|('NEXT_INQUIRY-REQUEST', 'SUBMIT_complete-u03_default_txt14')              |         84.10660|
|('SUBMIT_complete-u03_default_txt14', 'SUBMIT_complete-u03_default_txt14') |         77.40740|
|('SUBMIT_complete-u03_default_txt14', 'TOOLBAR_spreadApp-spreadApp')       |         74.16434|
|('TOOLBAR_webApp-webApp', 'NEXT_INQUIRY-REQUEST')                          |         67.95933|
|('TOOLBAR_webApp-webApp', 'COMBOBOX-menulist.index=8')                     |         63.94217|
## Class  2


|bigram                                                             | likelihood_ratio|
|:------------------------------------------------------------------|----------------:|
|('SUBMIT_complete-u03_default_txt14', 'NEXT_INQUIRY-REQUEST')      |        2355.3848|
|('TOOLBAR_spreadApp-spreadApp', 'TOOLBAR_webApp-webApp')           |        1392.4234|
|('COMBOBOX-menulist.index=9', 'SUBMIT_complete-u03_default_txt14') |         865.4099|
|('TOOLBAR_webApp-webApp', 'COMBOBOX-menulist.index=9')             |         832.1501|
|('TOOLBAR_webApp-webApp', 'TOOLBAR_spreadApp-spreadApp')           |         606.5532|
|('NEXT_INQUIRY-REQUEST', 'END_CANCEL-endtask_txt4')                |         502.3374|
|('TOOLBAR_ss-sort-ss-sort', 'COMBOBOX-sortablecol1.index=3')       |         485.4294|
|('MENUITEM_sort-key=sort', 'COMBOBOX-sortablecol1.index=3')        |         453.2708|
|('MENU-ss-data-menu', 'MENUITEM_sort-key=sort')                    |         435.1334|
|('COMBOBOX-sortablecol1.index=3', 'RADIO_BTN-priority1asc')        |         322.2008|
## Class  3


|bigram                                                              | likelihood_ratio|
|:-------------------------------------------------------------------|----------------:|
|('SUBMIT_complete-u03_default_txt14', 'NEXT_INQUIRY-REQUEST')       |       340.964425|
|('COMBOBOX-menulist.index=4', 'SUBMIT_complete-u03_default_txt14')  |       217.307581|
|('COMBOBOX-menulist.index=11', 'SUBMIT_complete-u03_default_txt14') |        26.081798|
|('KEYPRESS', 'BREAKOFF-REQUEST')                                    |        14.724331|
|('COMBOBOX-menulist.index=26', 'SUBMIT_complete-u03_default_txt14') |         7.358132|
|('COMBOBOX-menulist.index=3', 'SUBMIT_complete-u03_default_txt14')  |         7.358132|
|('COMBOBOX-menulist.index=7', 'SUBMIT_complete-u03_default_txt14')  |         7.358132|
|('COMBOBOX-menulist.index=9', 'SUBMIT_complete-u03_default_txt14')  |         7.358132|
|('GET_HELP-REQUEST', 'COMBOBOX-menulist.index=4')                   |         4.880417|
|('COMBOBOX-menulist.index=10', 'SUBMIT_complete-u03_default_txt14') |         3.669923|
## Class  4


|bigram                                                                                | likelihood_ratio|
|:-------------------------------------------------------------------------------------|----------------:|
|('SUBMIT_complete-u03_default_txt14', 'NEXT_INQUIRY-REQUEST')                         |         339.8976|
|('TOOLBAR_spreadApp-spreadApp', 'TOOLBAR_webApp-webApp')                              |         225.6964|
|('COMBOBOX-menulist.index=9', 'SUBMIT_complete-u03_default_txt14')                    |         206.3333|
|('TEXTBOX_ONFOCUS-searchtfield.value=', 'KEYPRESS')                                   |         195.4571|
|('TOOLBAR_webApp-webApp', 'COMBOBOX-menulist.index=9')                                |         192.6315|
|('TOOLBAR_webApp-webApp', 'TOOLBAR_spreadApp-spreadApp')                              |         179.7811|
|('CD_FIND_ok-spread-search-btn', 'TOOLBAR_spread-search-next-spread-search-next-btn') |         177.6448|
|('NEXT_INQUIRY-REQUEST', 'END_CANCEL-endtask_txt4')                                   |         129.0081|
|('TOOLBAR_ss-sort-ss-sort', 'COMBOBOX-sortablecol1.index=3')                          |         115.3623|
|('MENU-ss-data-menu', 'MENUITEM_sort-key=sort')                                       |         104.0280|


## visualise cluster {#visualise-cluster}

![](cd_tally/figure/lpa_box_all_2.png)
![](cd_tally/figure/lpa_box_all_3.png)

![](cd_tally/figure/lpa_vio_all_2.png)
![](cd_tally/figure/lpa_vio_all_3.png)


## response {#response}


### w/ tau and theta


|          tau|        theta|      naction|          spd|     AGEG5LFS|             n|
|------------:|------------:|------------:|------------:|------------:|-------------:|
|  1.01 (1.39)| -0.40 (0.91)|  1.06 (1.57)|  0.66 (1.06)| -0.19 (1.07)| 181.00 (0.00)|
| -0.69 (0.50)|  0.30 (0.89)|  0.32 (0.49)| -0.18 (0.71)|  0.15 (0.98)| 270.00 (0.00)|
|  0.18 (0.57)|  0.66 (0.34)| -0.30 (0.24)|  0.55 (0.70)| -0.33 (0.89)| 304.00 (0.00)|
| -0.25 (0.75)| -0.96 (0.94)| -0.86 (0.33)| -1.11 (0.44)|  0.44 (0.91)| 215.00 (0.00)|

### w/o tau and theta


|      naction|          spd|      CPROB1|      CPROB2|     AGEG5LFS|             n|
|------------:|------------:|-----------:|-----------:|------------:|-------------:|
|  2.61 (1.42)|  1.00 (1.26)| 0.91 (0.15)| 0.09 (0.15)|  0.02 (1.00)|  69.00 (0.00)|
|  0.27 (0.48)|  0.25 (0.84)| 0.06 (0.08)| 0.88 (0.13)| -0.10 (1.04)| 429.00 (0.00)|
| -0.43 (0.11)|  0.06 (0.78)| 0.01 (0.01)| 0.26 (0.07)| -0.08 (0.94)| 321.00 (0.00)|
| -1.05 (0.21)| -1.29 (0.35)| 0.00 (0.00)| 0.07 (0.09)|  0.46 (0.89)| 151.00 (0.00)|


# sprained\_ankle-1 {#sprained-ankle-1}


## collocations {#collocations}

## Class  1


|bigram                                                                              | likelihood_ratio|
|:-----------------------------------------------------------------------------------|----------------:|
|('TEXTLINK-default_txt3.href=u06a_popup1.target=popup', 'BUTTON_close-popup1_txt4') |        1344.4991|
|('RADIO_BTN-u06arg5_prop1', 'NEXT_INQUIRY-REQUEST')                                 |         934.3955|
|('RADIO_BTN-u06arg2_prop4', 'RADIO_BTN-u06arg3_prop1')                              |         912.2600|
|('RADIO_BTN-u06arg4_prop2', 'RADIO_BTN-u06arg5_prop1')                              |         616.5295|
|('RADIO_BTN-u06arg3_prop1', 'RADIO_BTN-u06arg4_prop2')                              |         477.9250|
|('RADIO_BTN-u06arg1_prop3', 'RADIO_BTN-u06arg2_prop4')                              |         461.9316|
|('RADIO_BTN-u06arg3_prop1', 'RADIO_BTN-u06arg4_prop3')                              |         221.0925|
|('RADIO_BTN-u06arg4_prop3', 'RADIO_BTN-u06arg5_prop1')                              |         177.5447|
|('BUTTON_close-popup1_txt4', 'RADIO_BTN-u06arg1_prop3')                             |         166.0958|
|('RADIO_BTN-u06arg1_prop1', 'RADIO_BTN-u06arg2_prop4')                              |         165.2207|
## Class  2


|bigram                                                                                                                           | likelihood_ratio|
|:--------------------------------------------------------------------------------------------------------------------------------|----------------:|
|('TEXTLINK-default_txt3.href=u06a_popup1.target=popup', 'BUTTON_close-popup1_txt4')                                              |        1075.1198|
|('TEXTLINK-default_txt6.href=u06a_popup1.target=popup', 'BUTTON_close-popup1_txt4')                                              |         434.3967|
|('TEXTBOX_ONFOCUS-default_txt2.value=Treatment_sprained_ankle', 'TEXTBOX_KILLFOCUS-default_txt2.value=Treatment_sprained_ankle') |         278.0813|
|('RADIO_BTN-u06arg5_prop1', 'NEXT_INQUIRY-REQUEST')                                                                              |         254.3394|
|('RADIO_BTN-u06arg4_prop2', 'RADIO_BTN-u06arg5_prop1')                                                                           |         238.1879|
|('RADIO_BTN-u06arg2_prop4', 'RADIO_BTN-u06arg3_prop1')                                                                           |         236.0504|
|('RADIO_BTN-u06arg3_prop1', 'RADIO_BTN-u06arg4_prop2')                                                                           |         183.0596|
|('RADIO_BTN-u06arg1_prop3', 'RADIO_BTN-u06arg2_prop4')                                                                           |         181.7720|
|('RADIO_BTN-u06arg3_prop1', 'RADIO_BTN-u06arg4_prop1')                                                                           |         178.4015|
|('TEXTLINK-default_txt9.href=u06a_popup1.target=popup', 'BUTTON_close-popup1_txt4')                                              |         172.8964|
## Class  3


|bigram                                                                                                                           | likelihood_ratio|
|:--------------------------------------------------------------------------------------------------------------------------------|----------------:|
|('TEXTBOX_ONFOCUS-default_txt2.value=Treatment_sprained_ankle', 'TEXTBOX_KILLFOCUS-default_txt2.value=Treatment_sprained_ankle') |        379.02638|
|('TEXTLINK-default_txt3.href=u06a_popup1.target=popup', 'BUTTON_close-popup1_txt4')                                              |        375.52227|
|('TEXTLINK-default_txt6.href=u06a_popup1.target=popup', 'BUTTON_close-popup1_txt4')                                              |        251.72685|
|('RADIO_BTN-u06arg1_prop1', 'RADIO_BTN-u06arg2_prop1')                                                                           |        126.47143|
|('RADIO_BTN-u06arg5_prop1', 'NEXT_INQUIRY-REQUEST')                                                                              |        111.10380|
|('TEXTLINK-default_txt15.href=u06a_popup1.target=popup', 'BUTTON_close-popup1_txt4')                                             |         95.97460|
|('RADIO_BTN-u06arg3_prop1', 'RADIO_BTN-u06arg4_prop1')                                                                           |         82.03548|
|('TEXTLINK-default_txt9.href=u06a_popup1.target=popup', 'BUTTON_close-popup1_txt4')                                              |         81.23657|
|('RADIO_BTN-u06arg4_prop1', 'RADIO_BTN-u06arg5_prop1')                                                                           |         74.60586|
|('TEXTLINK-default_txt12.href=u06a_popup1.target=popup', 'BUTTON_close-popup1_txt4')                                             |         74.02665|
## Class  4


|bigram                                                                              | likelihood_ratio|
|:-----------------------------------------------------------------------------------|----------------:|
|('RADIO_BTN-u06arg5_prop1', 'NEXT_INQUIRY-REQUEST')                                 |        553.96719|
|('RADIO_BTN-u06arg2_prop4', 'RADIO_BTN-u06arg3_prop1')                              |        362.95333|
|('TEXTLINK-default_txt3.href=u06a_popup1.target=popup', 'BUTTON_close-popup1_txt4') |        357.06437|
|('RADIO_BTN-u06arg1_prop3', 'RADIO_BTN-u06arg2_prop4')                              |        350.83133|
|('RADIO_BTN-u06arg4_prop2', 'RADIO_BTN-u06arg5_prop1')                              |        319.63262|
|('RADIO_BTN-u06arg3_prop1', 'RADIO_BTN-u06arg4_prop2')                              |        272.33694|
|('RADIO_BTN-u06arg4_prop1', 'RADIO_BTN-u06arg5_prop1')                              |         80.41556|
|('RADIO_BTN-u06arg3_prop1', 'RADIO_BTN-u06arg4_prop3')                              |         67.51748|
|('RADIO_BTN-u06arg1_prop1', 'RADIO_BTN-u06arg2_prop1')                              |         66.65437|
|('RADIO_BTN-u06arg3_prop1', 'RADIO_BTN-u06arg4_prop1')                              |         62.16008|


## visualise cluster {#visualise-cluster}


### with tau, theta {#with-tau-theta}

{{< figure src="sprained_ankle-1/figure/lpa_box_all_3.png" >}}


### w.o. tau, theta {#w-dot-o-dot-tau-theta}

{{< figure src="sprained_ankle-1/figure/lpa_vio_all_3.png" >}}


## response {#response}


### w/ tau and theta


|          tau|        theta|      naction|          spd|         res|             n|
|------------:|------------:|------------:|------------:|-----------:|-------------:|
| -0.60 (0.46)|  0.34 (0.57)| -0.19 (0.31)| -0.48 (0.32)| 4.35 (2.98)| 385.00 (0.00)|
|  0.27 (0.95)| -0.68 (1.03)|  0.16 (0.97)| -0.06 (0.65)| 6.01 (2.23)| 314.00 (0.00)|
|  1.22 (1.51)| -0.37 (1.40)|  0.82 (2.25)|  1.88 (1.66)| 6.76 (1.18)| 101.00 (0.00)|
|  0.14 (0.58)|  0.74 (0.36)| -0.39 (0.23)|  0.10 (0.62)| 4.06 (3.01)| 163.00 (0.00)|

### w/o tau and theta


|      naction|          spd|      CPROB1|      CPROB2|         res|             n|
|------------:|------------:|-----------:|-----------:|-----------:|-------------:|
| -0.27 (0.27)| -0.43 (0.35)| 0.79 (0.10)| 0.00 (0.00)| 4.50 (2.96)| 556.00 (0.00)|
|  1.48 (2.22)|  2.17 (1.63)| 0.00 (0.00)| 0.93 (0.12)| 6.57 (1.56)|  83.00 (0.00)|
| -0.06 (0.74)|  0.69 (0.39)| 0.08 (0.12)| 0.05 (0.08)| 5.89 (2.33)| 190.00 (0.00)|
|  0.29 (1.16)| -0.55 (0.41)| 0.08 (0.13)| 0.03 (0.06)| 5.52 (2.59)| 134.00 (0.00)|


# tickets {#tickets}

```R
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


## collocation {#collocation}

## Class  1


|bigram                                                               | likelihood_ratio|
|:--------------------------------------------------------------------|----------------:|
|('TAB-tabbutton2', 'TAB-tabbutton1')                                 |        5348.6765|
|('BUTTON_submit-pg2_txt33', 'BUTTON_submit_ok-u21p2pu5_txt2')        |        3823.0690|
|('BUTTON_submit_ok-u21p2pu5_txt2', 'NEXT_INQUIRY-REQUEST')           |        2159.6960|
|('COMBOBOX-default_menu1.index=7', 'COMBOBOX-default_menu2.index=2') |        1966.0726|
|('COMBOBOX-default_menu2.index=2', 'BUTTON_search-default_txt23')    |        1898.1312|
|('CHECKBOX-check2', 'CHECKBOX-check3')                               |        1584.7181|
|('CHECKBOX-check9', 'CHECKBOX-check11')                              |        1578.2255|
|('CHECKBOX-check11', 'BUTTON_available-pg1_txt47')                   |        1189.0331|
|('BUTTON_available-pg1_txt47', 'BUTTON_available-pg7_txt47')         |        1101.9322|
|('COMBOBOX-pg2_menu6.index=8', 'BUTTON_submit-pg2_txt33')            |         922.0956|
## Class  2


|bigram                                                                                                             | likelihood_ratio|
|:------------------------------------------------------------------------------------------------------------------|----------------:|
|('BUTTON_search-default_txt23', 'BUTTON_close-popup1_txt4')                                                        |        55.698957|
|('COMBOBOX-default_menu1.index=7', 'COMBOBOX-default_menu2.index=2')                                               |        37.495676|
|('COMBOBOX-default_menu2.index=2', 'NEXT_INQUIRY-REQUEST')                                                         |        17.586276|
|('TAB-tabbutton2', 'TAB-tabbutton1')                                                                               |        13.757955|
|('CHECKBOX-check4', 'BUTTON_available-pg1_txt47')                                                                  |        13.533514|
|('BUTTON_close-popup1_txt4', 'NEXT_INQUIRY-REQUEST')                                                               |        11.074180|
|('COMBOBOX-default_menu1.index=3', 'COMBOBOX-default_menu2.index=1')                                               |        10.430812|
|('COMBOBOX-default_menu2.index=2', 'BUTTON_search-default_txt23')                                                  |         9.834263|
|('BOX_PRESS-action=as://switchStateButton(u021_default_form1a,unit21page6,u021_default_popup2)', 'TAB-tabbutton1') |         9.714429|
|('TAB-tabbutton1', 'NEXT_INQUIRY-REQUEST')                                                                         |         9.489936|
## Class  3


|bigram                                                               | likelihood_ratio|
|:--------------------------------------------------------------------|----------------:|
|('TAB-tabbutton2', 'TAB-tabbutton1')                                 |        4082.5863|
|('BUTTON_submit-pg2_txt33', 'BUTTON_submit_ok-u21p2pu5_txt2')        |        2397.7490|
|('BUTTON_available-pg1_txt47', 'BUTTON_available-pg7_txt47')         |        1283.7639|
|('BUTTON_submit_ok-u21p2pu5_txt2', 'NEXT_INQUIRY-REQUEST')           |         991.4217|
|('COMBOBOX-default_menu2.index=2', 'BUTTON_search-default_txt23')    |         884.3631|
|('COMBOBOX-default_menu1.index=7', 'COMBOBOX-default_menu2.index=2') |         780.2374|
|('BUTTON_submit_ok-u21p2pu5_txt2', 'BUTTON_close-popup2_txt4')       |         774.0134|
|('CHECKBOX-check2', 'CHECKBOX-check3')                               |         511.6382|
|('CHECKBOX-check9', 'CHECKBOX-check11')                              |         481.3976|
|('CHECKBOX-check11', 'BUTTON_available-pg1_txt47')                   |         378.1517|
## Class  4


|bigram                                                               | likelihood_ratio|
|:--------------------------------------------------------------------|----------------:|
|('TAB-tabbutton2', 'TAB-tabbutton1')                                 |        3693.8423|
|('BUTTON_submit-pg2_txt33', 'BUTTON_submit_ok-u21p2pu5_txt2')        |        1761.9371|
|('BUTTON_submit_ok-u21p2pu5_txt2', 'NEXT_INQUIRY-REQUEST')           |        1335.2799|
|('COMBOBOX-default_menu1.index=7', 'COMBOBOX-default_menu2.index=2') |        1273.6836|
|('COMBOBOX-default_menu2.index=2', 'BUTTON_search-default_txt23')    |        1220.8369|
|('CHECKBOX-check9', 'CHECKBOX-check11')                              |        1099.9491|
|('CHECKBOX-check11', 'BUTTON_available-pg1_txt47')                   |        1069.7063|
|('CHECKBOX-check2', 'CHECKBOX-check3')                               |         885.6972|
|('BUTTON_available-pg1_txt47', 'COMBOBOX-pg2_menu1.index=8')         |         718.7921|
|('COMBOBOX-pg2_menu6.index=8', 'BUTTON_submit-pg2_txt33')            |         703.2595|

## Some covariates

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


## visualize clusters {#visualize-clusters}

![](tickets/figure/lpa_box_all_2.png)
![](tickets/figure/lpa_box_all_3.png)

![](tickets/figure/lpa_vio_all_2.png)
![](tickets/figure/lpa_vio_all_3.png)


## response {#response}

Response: the smaller, the better

### w/ tau and theta


|          tau|        theta|      naction|          spd|     AGEG5LFS|             n|
|------------:|------------:|------------:|------------:|------------:|-------------:|
|  0.88 (1.77)| -1.05 (1.11)|  1.85 (1.79)|  1.02 (1.83)| -0.23 (1.00)|  57.00 (0.00)|
| -0.38 (0.57)| -0.33 (0.91)|  0.04 (0.71)| -0.61 (0.49)|  0.42 (1.01)| 175.00 (0.00)|
|  0.67 (0.94)| -0.08 (0.98)| -0.18 (0.53)|  0.59 (0.79)| -0.45 (0.88)| 144.00 (0.00)|
| -0.43 (0.43)|  0.69 (0.47)| -0.47 (0.27)| -0.19 (0.58)|  0.02 (0.92)| 186.00 (0.00)|

### w/o tau and theta


|      naction|          spd|      CPROB1|      CPROB2|     AGEG5LFS|             n|
|------------:|------------:|-----------:|-----------:|------------:|-------------:|
|  3.06 (1.66)|  1.58 (2.25)| 0.94 (0.14)| 0.00 (0.00)| -0.13 (1.09)|  28.00 (0.00)|
| -0.53 (0.32)| -0.28 (0.60)| 0.01 (0.01)| 0.83 (0.13)|  0.04 (0.98)| 340.00 (0.00)|
|  0.48 (0.52)|  0.26 (0.99)| 0.06 (0.08)| 0.12 (0.15)| -0.06 (1.02)| 194.00 (0.00)|


### w/ tau and theta


|          tau|        theta|      naction|          spd|     AGEG5LFS|             n|
|------------:|------------:|------------:|------------:|------------:|-------------:|
|  1.01 (1.39)| -0.40 (0.91)|  1.06 (1.57)|  0.66 (1.06)| -0.19 (1.07)| 181.00 (0.00)|
| -0.69 (0.50)|  0.30 (0.89)|  0.32 (0.49)| -0.18 (0.71)|  0.15 (0.98)| 270.00 (0.00)|
|  0.18 (0.57)|  0.66 (0.34)| -0.30 (0.24)|  0.55 (0.70)| -0.33 (0.89)| 304.00 (0.00)|
| -0.25 (0.75)| -0.96 (0.94)| -0.86 (0.33)| -1.11 (0.44)|  0.44 (0.91)| 215.00 (0.00)|

### w/o tau and theta


|      naction|          spd|      CPROB1|      CPROB2|     AGEG5LFS|             n|
|------------:|------------:|-----------:|-----------:|------------:|-------------:|
|  2.61 (1.42)|  1.00 (1.26)| 0.91 (0.15)| 0.09 (0.15)|  0.02 (1.00)|  69.00 (0.00)|
|  0.27 (0.48)|  0.25 (0.84)| 0.06 (0.08)| 0.88 (0.13)| -0.10 (1.04)| 429.00 (0.00)|
| -0.43 (0.11)|  0.06 (0.78)| 0.01 (0.01)| 0.26 (0.07)| -0.08 (0.94)| 321.00 (0.00)|
| -1.05 (0.21)| -1.29 (0.35)| 0.00 (0.00)| 0.07 (0.09)|  0.46 (0.89)| 151.00 (0.00)|


# club\_membership-1 {#club-membership-1}


## collocations {#collocations}

## Class  1


|bigram                                                                                                 | likelihood_ratio|
|:------------------------------------------------------------------------------------------------------|----------------:|
|('TEXTBOX_ONFOCUS-u019_email_message.value=...', 'TEXTBOX_KILLFOCUS-u019_email_message.value=...')     |        1350.7463|
|('TEXTBOX_ONFOCUS-u019_email_message.value=....', 'TEXTBOX_KILLFOCUS-u019_email_message.value=....')   |         834.1867|
|('TEXTBOX_ONFOCUS-u019_email_message.value=', 'KEYPRESS')                                              |         743.0269|
|('TOOLBAR_mailApp-mailApp', 'TEXTBOX_ONFOCUS-u019_email_message.value=')                               |         706.1838|
|('TEXTBOX_ONFOCUS-u019_email_message.value=', 'TEXTBOX_KILLFOCUS-u019_email_message.value=')           |         423.1183|
|('TEXTBOX_ONFOCUS-email.value=', 'TEXTBOX_KILLFOCUS-email.value=')                                     |         365.8373|
|('CELL_CHANGE-content_spreadsheet_ColaD_row65', 'TOOLBAR_mailApp-mailApp')                             |         317.9156|
|('TEXTBOX_ONFOCUS-searchtfield.value=', 'KEYPRESS')                                                    |         305.8994|
|('TEXTBOX_ONFOCUS-u019_email_message.value=.....', 'TEXTBOX_KILLFOCUS-u019_email_message.value=.....') |         282.9375|
|('TOOLBAR_ss-find-ss-find', 'TEXTBOX_ONFOCUS-searchtfield.value=')                                     |         226.6560|
## Class  2


|bigram                                                                                                 | likelihood_ratio|
|:------------------------------------------------------------------------------------------------------|----------------:|
|('TEXTBOX_ONFOCUS-u019_email_message.value=....', 'TEXTBOX_KILLFOCUS-u019_email_message.value=....')   |        1637.1887|
|('TEXTBOX_ONFOCUS-u019_email_message.value=...', 'TEXTBOX_KILLFOCUS-u019_email_message.value=...')     |        1353.0898|
|('TOOLBAR_mailApp-mailApp', 'TEXTBOX_ONFOCUS-u019_email_message.value=')                               |        1270.2396|
|('TEXTBOX_ONFOCUS-u019_email_message.value=', 'KEYPRESS')                                              |         990.1056|
|('TEXTBOX_ONFOCUS-u019_email_message.value=', 'TEXTBOX_KILLFOCUS-u019_email_message.value=')           |         562.8241|
|('TEXTBOX_ONFOCUS-email.value=', 'TEXTBOX_KILLFOCUS-email.value=')                                     |         521.7128|
|('TEXTBOX_ONFOCUS-searchtfield.value=', 'KEYPRESS')                                                    |         476.3342|
|('TEXTBOX_KILLFOCUS-searchtfield.value=.....', 'MEM_FIND_ok-spread-search-btn')                        |         382.0834|
|('TEXTBOX_ONFOCUS-u019_email_message.value=.....', 'TEXTBOX_KILLFOCUS-u019_email_message.value=.....') |         370.8978|
|('NEXT_INQUIRY-REQUEST', 'TEXTBOX_ONFOCUS-u019_email_message.value=...')                               |         345.2553|
## Class  3


|bigram                                                                                                                                                                                       | likelihood_ratio|
|:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------:|
|('TEXTBOX_ONFOCUS-u019_email_message.value=...', 'TEXTBOX_KILLFOCUS-u019_email_message.value=...')                                                                                           |        1102.4764|
|('TEXTBOX_ONFOCUS-u019_email_message.value=....', 'TEXTBOX_KILLFOCUS-u019_email_message.value=....')                                                                                         |         986.7735|
|('TEXTBOX_ONFOCUS-u019_email_message.value=', 'TEXTBOX_KILLFOCUS-u019_email_message.value=')                                                                                                 |         776.3836|
|('TEXTBOX_ONFOCUS-email.value=', 'TEXTBOX_KILLFOCUS-email.value=')                                                                                                                           |         563.2145|
|('TEXTBOX_ONFOCUS-clientzone_box3_textbox3.value=', 'TEXTBOX_KILLFOCUS-clientzone_box3_textbox3.value=')                                                                                     |         280.6153|
|('TEXTBOX_ONFOCUS-popup2_txt1.value=The_email_has_been_sent._Please_click_Next_to_continue.', 'TEXTBOX_KILLFOCUS-popup2_txt1.value=The_email_has_been_sent._Please_click_Next_to_continue.') |         280.6153|
|('TOOLBAR_mailApp-mailApp', 'TEXTBOX_ONFOCUS-u019_email_message.value=')                                                                                                                     |         257.7530|
|('TEXTBOX_ONFOCUS-u019_mc_txt4.value=secretary@bikeclub.org', 'TEXTBOX_KILLFOCUS-u019_mc_txt4.value=secretary@bikeclub.org')                                                                 |         251.1673|
|('TEXTBOX_ONFOCUS-searchtfield.value=', 'KEYPRESS')                                                                                                                                          |         241.1137|
|('TEXTBOX_ONFOCUS-u019_email_message.value=', 'KEYPRESS')                                                                                                                                    |         215.5836|


## visualise cluster {#visualise-cluster}


### with tau, theta {#with-tau-theta}

{{< figure src="club_membership-1/figure/lpa_box_all_3.png" >}}


### w.o. tau, theta {#w-dot-o-dot-tau-theta}

{{< figure src="club_membership-1/figure/lpa_vio_all_3.png" >}}


## response {#response}


### w/ tau and theta


|          tau|        theta|      naction|          spd|         res|             n|
|------------:|------------:|------------:|------------:|-----------:|-------------:|
| -0.86 (0.59)|  0.18 (0.87)| -0.29 (0.72)| -0.67 (0.46)| 2.68 (2.70)| 228.00 (0.00)|
|  0.63 (0.57)| -0.03 (0.95)| -0.22 (0.50)|  0.19 (0.73)| 1.31 (1.32)| 255.00 (0.00)|
|  0.42 (1.21)| -0.40 (1.32)|  1.51 (1.45)|  1.30 (1.29)| 2.04 (2.28)|  81.00 (0.00)|

### w/o tau and theta


|      naction|          spd|      CPROB1|      CPROB2|         res|             n|
|------------:|------------:|-----------:|-----------:|-----------:|-------------:|
| -0.36 (0.68)| -0.70 (0.41)| 0.84 (0.12)| 0.12 (0.11)| 2.45 (2.58)| 293.00 (0.00)|
| -0.10 (0.40)|  0.49 (0.49)| 0.10 (0.14)| 0.82 (0.14)| 1.34 (1.39)| 194.00 (0.00)|
|  1.63 (1.41)|  1.42 (1.26)| 0.02 (0.06)| 0.06 (0.11)| 1.70 (1.94)|  77.00 (0.00)|


# book\_order {#book-order}


## collocations {#collocations}

## Class  3


|bigram                                                                                                      | likelihood_ratio|
|:-----------------------------------------------------------------------------------------------------------|----------------:|
|('TEXTLINK-pg1_txt7.href=u07_pg1_popup1.target=popup', 'BUTTON_close-popup1_txt2')                          |        208.86637|
|('CHECK_pg7-pg7_txt4', 'BUTTON_close-popup4_txt3')                                                          |        195.79144|
|('TEXTLINK-default_txt18.href=unit7page7.target=self', 'CHECK_pg7-pg7_txt4')                                |        164.30067|
|('TEXTLINK-default_txt9.href=unit7page3.target=self', 'TEXTLINK-pg3_txt5.href=unit7page8.target=self')      |        157.00750|
|('TEXTLINK-default_txt3.href=unit7page1.target=self', 'TEXTLINK-pg1_txt7.href=u07_pg1_popup1.target=popup') |        151.54740|
|('TEXTLINK-pg6_txt12.href=u07_pg6_popup3.target=popup', 'BUTTON_close-popup3_txt2')                         |        142.00070|
|('TOOLBAR_back-toolbar_back_btn', 'TEXTLINK-default_txt12.href=unit7page4.target=self')                     |        126.70172|
|('BUYNOW_pg4-pg4_txt11', 'BUYBOOK_pg4_ok-pg4_pu6_okbtn')                                                    |        118.39287|
|('TOOLBAR_back-toolbar_back_btn', 'TEXTLINK-default_txt9.href=unit7page3.target=self')                      |        114.73986|
|('BUYBOOK_pg4_ok-pg4_pu6_okbtn', 'NEXT_INQUIRY-REQUEST')                                                    |         87.20094|
## Class  2


|bigram                                                                         | likelihood_ratio|
|:------------------------------------------------------------------------------|----------------:|
|('BUYNOW_pg7-pg7_txt19', 'BUYBOOK_pg7_ok-pg7_pu6_okbtn')                       |        207.41883|
|('TEXTLINK-default_txt18.href=unit7page7.target=self', 'BUYNOW_pg7-pg7_txt19') |        188.35084|
|('BUYNOW_pg1-pg1_txt8', 'BUYBOOK_pg1_ok-pg1_pu6_okbtn')                        |        186.42648|
|('BUYNOW_pg3-pg3_txt4', 'BUYBOOK_pg3_ok-pg3_pu6_okbtn')                        |        175.03323|
|('TEXTLINK-default_txt3.href=unit7page1.target=self', 'BUYNOW_pg1-pg1_txt8')   |        167.84040|
|('TEXTLINK-default_txt9.href=unit7page3.target=self', 'BUYNOW_pg3-pg3_txt4')   |        131.17740|
|('BUYBOOK_pg7_ok-pg7_pu6_okbtn', 'NEXT_INQUIRY-REQUEST')                       |         98.52990|
|('BUYNOW_pg4-pg4_txt11', 'BUYBOOK_pg4_ok-pg4_pu6_okbtn')                       |         94.84852|
|('TEXTLINK-default_txt12.href=unit7page4.target=self', 'BUYNOW_pg4-pg4_txt11') |         94.84852|
|('BUYBOOK_pg1_ok-pg1_pu6_okbtn', 'NEXT_INQUIRY-REQUEST')                       |         90.13419|
## Class  1


|bigram                                                                                                      | likelihood_ratio|
|:-----------------------------------------------------------------------------------------------------------|----------------:|
|('BUYNOW_pg4-pg4_txt11', 'BUYBOOK_pg4_ok-pg4_pu6_okbtn')                                                    |         2993.405|
|('TEXTLINK-pg1_txt7.href=u07_pg1_popup1.target=popup', 'BUTTON_close-popup1_txt2')                          |         2772.062|
|('CHECK_pg7-pg7_txt4', 'BUTTON_close-popup4_txt3')                                                          |         2701.893|
|('TEXTLINK-default_txt9.href=unit7page3.target=self', 'TEXTLINK-pg3_txt5.href=unit7page8.target=self')      |         2658.989|
|('BUYBOOK_pg4_ok-pg4_pu6_okbtn', 'NEXT_INQUIRY-REQUEST')                                                    |         2609.485|
|('TEXTLINK-default_txt18.href=unit7page7.target=self', 'CHECK_pg7-pg7_txt4')                                |         2227.420|
|('TEXTLINK-default_txt3.href=unit7page1.target=self', 'TEXTLINK-pg1_txt7.href=u07_pg1_popup1.target=popup') |         2219.096|
|('TOOLBAR_back-toolbar_back_btn', 'TEXTLINK-default_txt12.href=unit7page4.target=self')                     |         2146.316|
|('TOOLBAR_back-toolbar_back_btn', 'TOOLBAR_back-toolbar_back_btn')                                          |         1956.254|
|('TEXTLINK-pg3_txt5.href=unit7page8.target=self', 'TOOLBAR_back-toolbar_back_btn')                          |         1230.032|


## visual clusters {#visual-clusters}

![](book_order/figure/lpa_box_all_2.png)
![](book_order/figure/lpa_box_all_3.png)

![](book_order/figure/lpa_vio_all_2.png)
![](book_order/figure/lpa_vio_all_3.png)


## reponse {#reponse}

Response: the larger, the better


### w/ tau and theta


|          tau|        theta|      naction|          spd|     AGEG5LFS|             n|
|------------:|------------:|------------:|------------:|------------:|-------------:|
|  1.01 (1.39)| -0.40 (0.91)|  1.06 (1.57)|  0.66 (1.06)| -0.19 (1.07)| 181.00 (0.00)|
| -0.69 (0.50)|  0.30 (0.89)|  0.32 (0.49)| -0.18 (0.71)|  0.15 (0.98)| 270.00 (0.00)|
|  0.18 (0.57)|  0.66 (0.34)| -0.30 (0.24)|  0.55 (0.70)| -0.33 (0.89)| 304.00 (0.00)|
| -0.25 (0.75)| -0.96 (0.94)| -0.86 (0.33)| -1.11 (0.44)|  0.44 (0.91)| 215.00 (0.00)|

### w/o tau and theta


|      naction|          spd|      CPROB1|      CPROB2|     AGEG5LFS|             n|
|------------:|------------:|-----------:|-----------:|------------:|-------------:|
|  2.61 (1.42)|  1.00 (1.26)| 0.91 (0.15)| 0.09 (0.15)|  0.02 (1.00)|  69.00 (0.00)|
|  0.27 (0.48)|  0.25 (0.84)| 0.06 (0.08)| 0.88 (0.13)| -0.10 (1.04)| 429.00 (0.00)|
| -0.43 (0.11)|  0.06 (0.78)| 0.01 (0.01)| 0.26 (0.07)| -0.08 (0.94)| 321.00 (0.00)|
| -1.05 (0.21)| -1.29 (0.35)| 0.00 (0.00)| 0.07 (0.09)|  0.46 (0.89)| 151.00 (0.00)|


# meeting\_room {#meeting-room}


## collocations {#collocations}

## Class  1


|bigram                                                                          | likelihood_ratio|
|:-------------------------------------------------------------------------------|----------------:|
|('FOLDER_VIEWED-InboxFolder', 'FOLDER_VIEWED-myMails')                          |         51.88126|
|('FOLDER_VIEWED-MtgRoomFolder', 'FOLDER_VIEWED-ReservationsFolder')             |         35.22581|
|('TOOLBAR_webApp-webApp', 'TEXTLINK-default_txt3.href=unit02page2.target=self') |         28.36017|
|('TOOLBAR_mailApp-mailApp', 'NEXT_INQUIRY-REQUEST')                             |         23.17940|
|('MAIL_VIEWED-item102', 'MAIL_VIEWED-item103')                                  |         20.35835|
|('FOLDER_VIEWED-myMails', 'FOLDER_VIEWED-MtgRoomFolder')                        |         14.78127|
|('FOLDER_UNFOLDED-MtgRoomFolder', 'FOLDER_FOLDED-MtgRoomFolder')                |         14.42721|
|('MENU-message-menu', 'MENUITEM_move-folder-key=move-folder')                   |         14.42721|
|('MENU-view-menu', 'MENUITEM_sort-mc-key=sort-mc')                              |         14.42721|
|('MENUITEM_sort-mc-key=sort-mc', 'MAIL_SORT_ok-sortValidation')                 |         14.42721|
## Class  2


|bigram                                                                                    | likelihood_ratio|
|:-----------------------------------------------------------------------------------------|----------------:|
|('BUTTON_RESERVE_submit-SUBMIT_RESERVATION_SUCCESS', 'BUTTON_close-popup1_txt2')          |        2428.7755|
|('COMBOBOX-zemenulist4.index=3', 'COMBOBOX-zemenulist5.index=4')                          |        1366.9993|
|('BUTTON_RESERVE_submit-SUBMIT_RESERVATION_FAILURE_conflict', 'BUTTON_close-popup7_txt2') |        1320.6393|
|('BUTTON_UNFILL_submit-pg5_txt21', 'BUTTON_close-popup3_txt2')                            |        1247.8091|
|('MAIL_VIEWED-item102', 'MAIL_VIEWED-item103')                                            |        1180.8554|
|('COMBOBOX-zemenulist4.index=4', 'COMBOBOX-zemenulist5.index=5')                          |        1119.3536|
|('COMBOBOX-zmenulist6.index=7', 'BUTTON_RESERVE_submit-SUBMIT_RESERVATION_SUCCESS')       |         799.9066|
|('MAIL_VIEWED-item103', 'MAIL_VIEWED-item104')                                            |         723.1158|
|('COMBOBOX-menulist.index=6', 'BUTTON_UNFILL_submit-pg5_txt21')                           |         681.4486|
|('TEXTLINK-pg1_txt4.href=unit02page3.target=self', 'COMBOBOX-zmenulist1.index=2')         |         678.0070|
## Class  3


|bigram                                                                                               | likelihood_ratio|
|:----------------------------------------------------------------------------------------------------|----------------:|
|('BUTTON_RESERVE_submit-SUBMIT_RESERVATION_SUCCESS', 'BUTTON_close-popup1_txt2')                     |        3165.7677|
|('BUTTON_RESERVE_submit-SUBMIT_RESERVATION_FAILURE_conflict', 'BUTTON_close-popup7_txt2')            |        2876.2798|
|('COMBOBOX-zemenulist4.index=3', 'COMBOBOX-zemenulist5.index=4')                                     |        1909.3797|
|('BUTTON_UNFILL_submit-pg5_txt21', 'BUTTON_close-popup3_txt2')                                       |        1549.0920|
|('MAIL_VIEWED-item102', 'MAIL_VIEWED-item103')                                                       |        1436.9996|
|('COMBOBOX-zemenulist4.index=4', 'COMBOBOX-zemenulist5.index=5')                                     |        1284.4368|
|('TOOLBAR_mailApp-mailApp', 'TOOLBAR_webApp-webApp')                                                 |        1246.3057|
|('TEXTLINK-pg1_txt4.href=unit02page3.target=self', 'COMBOBOX-zmenulist1.index=2')                    |         874.2876|
|('COMBOBOX-zmenulist6.index=7', 'BUTTON_RESERVE_submit-SUBMIT_RESERVATION_SUCCESS')                  |         817.4273|
|('TEXTLINK-pg3_txt3.href=unit02page2.target=self', 'TEXTLINK-pg2_txt2.href=unit02page1.target=self') |         695.1467|
## Class  4


|bigram                                                                                                                                                                                                               | likelihood_ratio|
|:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------:|
|('BUTTON_RESERVE_submit-SUBMIT_RESERVATION_SUCCESS', 'BUTTON_close-popup1_txt2')                                                                                                                                     |         563.2656|
|('BUTTON_RESERVE_submit-SUBMIT_RESERVATION_FAILURE_conflict', 'BUTTON_close-popup7_txt2')                                                                                                                            |         419.8368|
|('COMBOBOX-zemenulist4.index=3', 'COMBOBOX-zemenulist5.index=4')                                                                                                                                                     |         332.7030|
|('TEXTBOX_ONFOCUS-textbox1.value=', 'TEXTBOX_KILLFOCUS-textbox1.value=')                                                                                                                                             |         330.6313|
|('TEXTBOX_ONFOCUS-textbox1.value=......................................................................', 'TEXTBOX_KILLFOCUS-textbox1.value=......................................................................') |         243.6613|
|('MAIL_VIEWED-item102', 'MAIL_VIEWED-item103')                                                                                                                                                                       |         221.5643|
|('BUTTON_UNFILL_submit-pg5_txt21', 'BUTTON_close-popup3_txt2')                                                                                                                                                       |         219.4852|
|('COMBOBOX-zemenulist4.index=4', 'COMBOBOX-zemenulist5.index=5')                                                                                                                                                     |         200.1086|
|('TEXTLINK-pg3_txt3.href=unit02page2.target=self', 'TEXTLINK-pg2_txt2.href=unit02page1.target=self')                                                                                                                 |         195.8817|
|('FOLDER_VIEWED-ReservationsFolder', 'MAIL_MOVED-item101.target=ReservationsFolder')                                                                                                                                 |         194.3509|


## visualise cluster {#visualise-cluster}

![](meeting_room/figure/lpa_box_all_2.png)
![](meeting_room/figure/lpa_box_all_3.png)

![](meeting_room/figure/lpa_vio_all_2.png)
![](meeting_room/figure/lpa_vio_all_3.png)


## response {#response}

Loading required package: ggplot2

### w/ tau and theta


|          tau|        theta|      naction|          spd|     AGEG5LFS|             n|
|------------:|------------:|------------:|------------:|------------:|-------------:|
|  0.88 (1.77)| -1.05 (1.11)|  1.85 (1.79)|  1.02 (1.83)| -0.23 (1.00)|  57.00 (0.00)|
| -0.38 (0.57)| -0.33 (0.91)|  0.04 (0.71)| -0.61 (0.49)|  0.42 (1.01)| 175.00 (0.00)|
|  0.67 (0.94)| -0.08 (0.98)| -0.18 (0.53)|  0.59 (0.79)| -0.45 (0.88)| 144.00 (0.00)|
| -0.43 (0.43)|  0.69 (0.47)| -0.47 (0.27)| -0.19 (0.58)|  0.02 (0.92)| 186.00 (0.00)|

### w/o tau and theta


|      naction|          spd|      CPROB1|      CPROB2|     AGEG5LFS|             n|
|------------:|------------:|-----------:|-----------:|------------:|-------------:|
|  3.06 (1.66)|  1.58 (2.25)| 0.94 (0.14)| 0.00 (0.00)| -0.13 (1.09)|  28.00 (0.00)|
| -0.53 (0.32)| -0.28 (0.60)| 0.01 (0.01)| 0.83 (0.13)|  0.04 (0.98)| 340.00 (0.00)|
|  0.48 (0.52)|  0.26 (0.99)| 0.06 (0.08)| 0.12 (0.15)| -0.06 (1.02)| 194.00 (0.00)|


# locate\_email {#locate-email}


## collocations {#collocations}

## Class  1


|bigram                                                        | likelihood_ratio|
|:-------------------------------------------------------------|----------------:|
|('FOLDER_VIEWED-item700', 'MAIL_VIEWED-item701')              |         182.6112|
|('MENU-message-menu', 'MENUITEM_move-folder-key=move-folder') |         180.9275|
|('FOLDER_VIEWED-item402', 'MOVE_FOLDER_ok-moveValidation')    |         161.4272|
|('FOLDER_VIEWED-item401', 'MOVE_FOLDER_ok-moveValidation')    |         131.4655|
|('FOLDER_VIEWED-item401', 'MAIL_MOVED-item701.item401')       |         126.2251|
|('MAIL_VIEWED-item701', 'TOOLBAR_move-move')                  |         125.6678|
|('MAIL_VIEWED-item702', 'TOOLBAR_move-move')                  |         122.8810|
|('TOOLBAR_move-move', 'FOLDER_VIEWED-item402')                |         117.3310|
|('FOLDER_VIEWED-item800', 'MAIL_MOVED-item703.item800')       |         101.4094|
|('MOVE_FOLDER_ok-moveValidation', 'MAIL_VIEWED-item702')      |         100.2878|
## Class  2


|bigram                                                        | likelihood_ratio|
|:-------------------------------------------------------------|----------------:|
|('MENU-file-menu', 'MENUITEM_newfolder-key=newfolder')        |         774.2367|
|('FOLDER_VIEWED-item403', 'MAIL_MOVED-item186.item403')       |         576.8293|
|('FOLDER_VIEWED-item403', 'MAIL_MOVED-item113.item403')       |         529.6047|
|('FOLDER_VIEWED-item401', 'MAIL_MOVED-item114.item401')       |         523.2631|
|('FOLDER_VIEWED-item403', 'MAIL_MOVED-item265.item403')       |         517.8293|
|('MAIL_VIEWED-item217', 'MAIL_DRAG-item217')                  |         499.2203|
|('FOLDER_VIEWED-item403', 'MAIL_MOVED-item237.item403')       |         494.3152|
|('FOLDER_VIEWED-item403', 'MAIL_MOVED-item220.item403')       |         488.4443|
|('FOLDER_VIEWED-item800', 'MAIL_MOVED-item217.item800')       |         475.1347|
|('MENU-message-menu', 'MENUITEM_move-folder-key=move-folder') |         440.1133|
## Class  3


|bigram                                                  | likelihood_ratio|
|:-------------------------------------------------------|----------------:|
|('FOLDER_VIEWED-item401', 'MAIL_MOVED-item701.item401') |         354.0859|
|('FOLDER_VIEWED-item402', 'MAIL_MOVED-item702.item402') |         348.3190|
|('FOLDER_VIEWED-item800', 'MAIL_MOVED-item703.item800') |         282.8238|
|('MAIL_VIEWED-item702', 'MAIL_DRAG-item702')            |         218.0837|
|('MAIL_DRAG-item703', 'FOLDER_VIEWED-item800')          |         196.8630|
|('MAIL_VIEWED-item703', 'MAIL_DRAG-item703')            |         193.5513|
|('MAIL_VIEWED-item701', 'MAIL_DRAG-item701')            |         174.3833|
|('MAIL_DRAG-item701', 'FOLDER_VIEWED-item401')          |         157.7659|
|('MAIL_DRAG-item702', 'FOLDER_VIEWED-item402')          |         139.2227|
|('FOLDER_VIEWED-item403', 'MAIL_MOVED-item113.item403') |         134.2558|
## Class  4


|bigram                                                  | likelihood_ratio|
|:-------------------------------------------------------|----------------:|
|('FOLDER_VIEWED-item402', 'MAIL_MOVED-item702.item402') |         822.9731|
|('FOLDER_VIEWED-item401', 'MAIL_MOVED-item701.item401') |         733.5614|
|('FOLDER_VIEWED-item800', 'MAIL_MOVED-item703.item800') |         556.5832|
|('MAIL_VIEWED-item703', 'MAIL_DRAG-item703')            |         423.0686|
|('MAIL_VIEWED-item702', 'MAIL_DRAG-item702')            |         365.1577|
|('MAIL_DRAG-item703', 'FOLDER_VIEWED-item800')          |         355.7715|
|('MAIL_VIEWED-item701', 'MAIL_DRAG-item701')            |         345.9375|
|('MAIL_MOVED-item702.item402', 'MAIL_VIEWED-item703')   |         339.9250|
|('MAIL_DRAG-item702', 'FOLDER_VIEWED-item402')          |         256.4684|
|('FOLDER_VIEWED-item700', 'MAIL_VIEWED-item701')        |         241.3214|


## visualise cluster {#visualise-cluster}


### with tau, theta {#with-tau-theta}

{{< figure src="locate_email/figure/lpa_box_all_3.png" >}}


### w.o. tau, theta {#w-dot-o-dot-tau-theta}

{{< figure src="locate_email/figure/lpa_vio_all_3.png" >}}


## response {#response}


### w/ tau and theta


|          tau|        theta|      naction|          spd|         res|             n|
|------------:|------------:|------------:|------------:|-----------:|-------------:|
| -0.43 (0.67)| -1.14 (0.59)| -0.71 (0.32)| -0.93 (0.54)| 1.23 (1.29)| 145.00 (0.00)|
|  0.81 (1.17)|  0.22 (0.90)|  1.04 (1.07)|  0.87 (0.95)| 0.58 (1.06)| 181.00 (0.00)|
| -0.52 (0.53)|  0.46 (0.87)| -0.08 (0.52)|  0.18 (0.63)| 1.56 (1.30)|  96.00 (0.00)|
| -0.25 (0.57)|  0.58 (0.45)| -0.56 (0.13)| -0.28 (0.54)| 2.25 (0.92)| 140.00 (0.00)|

### w/o tau and theta


|      naction|          spd|      CPROB1|      CPROB2|         res|             n|
|------------:|------------:|-----------:|-----------:|-----------:|-------------:|
| -1.05 (0.04)| -1.46 (0.27)| 0.97 (0.04)| 0.00 (0.00)| 0.00 (0.00)|  47.00 (0.00)|
|  1.16 (1.09)|  1.04 (0.92)| 0.00 (0.00)| 0.92 (0.13)| 0.61 (1.10)| 161.00 (0.00)|
| -0.05 (0.44)| -0.27 (0.48)| 0.02 (0.08)| 0.13 (0.13)| 1.27 (1.30)| 124.00 (0.00)|
| -0.57 (0.13)| -0.29 (0.63)| 0.00 (0.00)| 0.03 (0.06)| 2.13 (1.02)| 230.00 (0.00)|


# lamp\_return {#lamp-return}


## collocations {#collocations}

## Class  1


|bigram                                                                                                               | likelihood_ratio|
|:--------------------------------------------------------------------------------------------------------------------|----------------:|
|('TEXTBOX_ONFOCUS-u023_pg2_txt19.value=', 'TEXTBOX_KILLFOCUS-u023_pg2_txt19.value=')                                 |         589.8216|
|('BUTTON_obtain-u023_pg12_txt6', 'BUTTON_OBTAIN_close-u023_popup2_txt4')                                             |         538.4479|
|('BUTTON_RETURN_submit-u023_pg2_txt22', 'NEXT_INQUIRY-REQUEST')                                                      |         388.4260|
|('RADIO_BTN-u023_pg2_txt8', 'COMBOBOX-u023_pg2_menu1.index=1')                                                       |         320.5374|
|('TEXTBOX_KILLFOCUS-u023_pg2_txt19.value=7834', 'BUTTON_RETURN_submit-u023_pg2_txt22')                               |         306.3855|
|('TEXTLINK-u023_pg1_txt10.href=unit23page2.target=self', 'RADIO_BTN-u023_pg2_txt8')                                  |         300.3013|
|('TEXTLINK-u023_pg2_txt21.href=unit23page12.target=self', 'BUTTON_obtain-u023_pg12_txt6')                            |         237.8251|
|('TEXTLINK-u023_pg1_txt9.href=unit23page12.target=self', 'BUTTON_obtain-u023_pg12_txt6')                             |         227.3003|
|('KEYPRESS', 'TEXTBOX_KILLFOCUS-u023_pg2_txt19.value=7834')                                                          |         222.5735|
|('TEXTLINK-u023_default_txt10.href=unit23page1.target=self', 'TEXTLINK-u023_pg1_txt10.href=unit23page2.target=self') |         213.6009|
## Class  2


|bigram                                                                                    | likelihood_ratio|
|:-----------------------------------------------------------------------------------------|----------------:|
|('BUTTON_obtain-u023_pg12_txt6', 'BUTTON_OBTAIN_close-u023_popup2_txt4')                  |        1718.9581|
|('BUTTON_RETURN_submit-u023_pg2_txt22', 'NEXT_INQUIRY-REQUEST')                           |         851.9591|
|('RADIO_BTN-u023_pg2_txt8', 'COMBOBOX-u023_pg2_menu1.index=1')                            |         814.8844|
|('KEYPRESS', 'TEXTBOX_KILLFOCUS-u023_pg2_txt19.value=7834')                               |         806.4828|
|('TEXTBOX_ONFOCUS-u023_pg2_txt19.value=', 'KEYPRESS')                                     |         790.7215|
|('TEXTLINK-u023_pg1_txt10.href=unit23page2.target=self', 'RADIO_BTN-u023_pg2_txt8')       |         698.9622|
|('TEXTBOX_ONFOCUS-u023_pg2_txt19.value=', 'TEXTBOX_KILLFOCUS-u023_pg2_txt19.value=')      |         655.5400|
|('TEXTLINK-u023_pg2_txt21.href=unit23page12.target=self', 'BUTTON_obtain-u023_pg12_txt6') |         600.6666|
|('TEXTBOX_KILLFOCUS-u023_pg2_txt19.value=7834', 'BUTTON_RETURN_submit-u023_pg2_txt22')    |         586.4540|
|('TOOLBAR_mailApp-mailApp', 'MAIL_VIEWED-item305')                                        |         529.4708|
## Class  3


|bigram                                                                                   | likelihood_ratio|
|:----------------------------------------------------------------------------------------|----------------:|
|('BUTTON_obtain-u023_pg12_txt6', 'BUTTON_OBTAIN_close-u023_popup2_txt4')                 |        1078.8160|
|('BUTTON_RETURN_submit-u023_pg2_txt22', 'NEXT_INQUIRY-REQUEST')                          |         704.2991|
|('TEXTBOX_ONFOCUS-u023_pg2_txt19.value=', 'TEXTBOX_KILLFOCUS-u023_pg2_txt19.value=')     |         658.5855|
|('RADIO_BTN-u023_pg2_txt8', 'COMBOBOX-u023_pg2_menu1.index=1')                           |         649.2960|
|('KEYPRESS', 'TEXTBOX_KILLFOCUS-u023_pg2_txt19.value=7834')                              |         639.5205|
|('TEXTBOX_ONFOCUS-u023_pg2_txt19.value=', 'KEYPRESS')                                    |         604.0866|
|('TEXTLINK-u023_pg1_txt10.href=unit23page2.target=self', 'RADIO_BTN-u023_pg2_txt8')      |         574.7355|
|('TEXTBOX_KILLFOCUS-u023_pg2_txt19.value=7834', 'BUTTON_RETURN_submit-u023_pg2_txt22')   |         554.8621|
|('MAIL_VIEWED-item305', 'TOOLBAR_webApp-webApp')                                         |         443.4153|
|('TEXTLINK-u023_pg1_txt9.href=unit23page12.target=self', 'BUTTON_obtain-u023_pg12_txt6') |         414.3679|
## Class  4


|bigram                                                                                   | likelihood_ratio|
|:----------------------------------------------------------------------------------------|----------------:|
|('BUTTON_obtain-u023_pg12_txt6', 'BUTTON_OBTAIN_close-u023_popup2_txt4')                 |        1507.1803|
|('BUTTON_RETURN_submit-u023_pg2_txt22', 'NEXT_INQUIRY-REQUEST')                          |        1268.0231|
|('RADIO_BTN-u023_pg2_txt8', 'COMBOBOX-u023_pg2_menu1.index=1')                           |        1084.1788|
|('KEYPRESS', 'TEXTBOX_KILLFOCUS-u023_pg2_txt19.value=7834')                              |        1058.9451|
|('TEXTBOX_KILLFOCUS-u023_pg2_txt19.value=7834', 'BUTTON_RETURN_submit-u023_pg2_txt22')   |         991.3056|
|('TEXTBOX_ONFOCUS-u023_pg2_txt19.value=', 'KEYPRESS')                                    |         905.3262|
|('TEXTLINK-u023_pg1_txt10.href=unit23page2.target=self', 'RADIO_BTN-u023_pg2_txt8')      |         866.1994|
|('TOOLBAR_mailApp-mailApp', 'MAIL_VIEWED-item305')                                       |         817.2017|
|('MAIL_VIEWED-item305', 'TOOLBAR_webApp-webApp')                                         |         687.0170|
|('TEXTLINK-u023_pg1_txt9.href=unit23page12.target=self', 'BUTTON_obtain-u023_pg12_txt6') |         662.2376|


## visualise cluster {#visualise-cluster}

![](lamp_return/figure/lpa_box_all_2.png)
![](lamp_return/figure/lpa_box_all_3.png)

![](lamp_return/figure/lpa_vio_all_2.png)
![](lamp_return/figure/lpa_vio_all_3.png)


## response {#response}


### w/ tau and theta


|          tau|        theta|      naction|          spd|     AGEG5LFS|             n|
|------------:|------------:|------------:|------------:|------------:|-------------:|
|  0.88 (1.77)| -1.05 (1.11)|  1.85 (1.79)|  1.02 (1.83)| -0.23 (1.00)|  57.00 (0.00)|
| -0.38 (0.57)| -0.33 (0.91)|  0.04 (0.71)| -0.61 (0.49)|  0.42 (1.01)| 175.00 (0.00)|
|  0.67 (0.94)| -0.08 (0.98)| -0.18 (0.53)|  0.59 (0.79)| -0.45 (0.88)| 144.00 (0.00)|
| -0.43 (0.43)|  0.69 (0.47)| -0.47 (0.27)| -0.19 (0.58)|  0.02 (0.92)| 186.00 (0.00)|

### w/o tau and theta


|      naction|          spd|      CPROB1|      CPROB2|     AGEG5LFS|             n|
|------------:|------------:|-----------:|-----------:|------------:|-------------:|
|  3.06 (1.66)|  1.58 (2.25)| 0.94 (0.14)| 0.00 (0.00)| -0.13 (1.09)|  28.00 (0.00)|
| -0.53 (0.32)| -0.28 (0.60)| 0.01 (0.01)| 0.83 (0.13)|  0.04 (0.98)| 340.00 (0.00)|
|  0.48 (0.52)|  0.26 (0.99)| 0.06 (0.08)| 0.12 (0.15)| -0.06 (1.02)| 194.00 (0.00)|