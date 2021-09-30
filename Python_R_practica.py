---
title: "Test"
author: "unknown"
date: "2020/0114"
output:
  slidy_presentation: default
  ioslides_presentation: default
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE, error=TRUE)
``

```{r echo=F}
library(reticulate)
virtualenv_create("test")
use_virtualenv("test")
``

## Slide 1

```{python}
import requests 
from bs4 import BeautifulSoup
import json 
from pandas import DataFrame as df 
``

## Slide 2

Totally okay error
```{python error=TRUE}
print(A)
``

## Slide 2

```{python}
page = requests.get("https://locations.familydollar.com/id/")
soup = BeautifulSoup(page.text, 'html.parser') 
``

## Slide 3

not okay error 
```{python error=TRUE}
dollar_tree_list = soup.find_all(class = 'itemlist')
