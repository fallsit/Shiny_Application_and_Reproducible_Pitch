---
title       : Predict Children's Height
subtitle    : Course Project- Shiny Application and Reproducible Pitch
author      : fallsit
date        : 3-06-2016
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides


---

## About the Course Project 
<ui>
<li>This course is part of the "Data Science specialization"</li>
<li>It is the "Developing data products" presentation project</li>
<li>The project include the shiny application and the presentation in Slidify or Rstudio Presenter</li>
<ui/>
</br>
<ui>
<li>We using the Galton's dataset as our dataset to build the child's height predict application with the linear regression analysis method </li>
<li>You can find the application on this <a href="https://fallsit.shinyapps.io/Developing_Data_Products_Course_Project/">link</a>*</li>
<li>For complete code please visit the<a href="https://github.com/fallsit/Shiny-Application-and-Reproducible-Pitch"> Github account</a></li>
</ui>


--- .class #id 

## Galton's Dataset
<ui>
<li>This application uses galton in UsingR library which is a tabulated data set used by Galton in 1885 to study the relationship between a parent’s height and their childrens.</li>
<li>About the Galton's dataset:</li>
<ui>

```r
summary(galton)
```

```
##      child           parent     
##  Min.   :61.70   Min.   :64.00  
##  1st Qu.:66.20   1st Qu.:67.50  
##  Median :68.20   Median :68.50  
##  Mean   :68.09   Mean   :68.31  
##  3rd Qu.:70.20   3rd Qu.:69.50  
##  Max.   :73.70   Max.   :73.00
```

--- 

## Linear Regression Model
<ui>
<li>We use <code>lm</code> function to build the linear regression model.
<li>The Application can predict a child's height based on the average of height of father and mother.(which call midparent)

```r
fit<-lm(child~parent,galton)
coef(fit)
```

```
## (Intercept)      parent 
##  23.9415302   0.6462906
```
<li>The model formula for prediction is:</li>
$$child's height=parent*0.6462906+23.9415302$$
</ui>

---

## Visualization
For save space we only focus on code without executing it. You can view the plot by using the application.There are five main layers consists of the plot : regression line, scattered plot, prediction line,  confidence band, prediction band .


```r
ggplot(galtonAndPred,aes(parent,child))+
    xlab("Parents height")+
    ylab("Children's predicted height")+
    geom_point() +
    geom_smooth(method="lm",...)+
    .......
```
