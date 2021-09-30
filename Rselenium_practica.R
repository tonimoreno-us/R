## Primero visionar la web: https://www.booking.com/city/es/sevilla.es.html

install.packages("RSelenium")
library("RSelenium")



rD <- rsDriver()    # runs a chrome browser, wait for necessary files to download
remDr <- rD$client  # Abre una instancia de Chrome - no need for remDr$open() browser should already be open
remDr$navigate("https://www.booking.com/city/es/sevilla.es.html")

remDr$getCurrentWindowHandle()
remDr$getTitle()

webElem <- remDr$findElements(using = 'css selector', "input")

webElem[[1]]$sendKeysToElement(list(email))
webElem[[2]]$sendKeysToElement(list(password))

webElemButton <- remDr$findElements(using = 'css selector', ".smart-button")
webElemButton[[1]]$clickElement() 




webElem <- remDr$findElements(using = 'css selector', "h1.rate")
b.rate <- dato(webElem) 


webElem <- remDr$findElements(using = 'xpath', "//*[@class='ember-view project-sidebar']/ul[1]/li[3]/ul[2]/li[2]")
b.plazoPtmo <- dato(webElem)

webElem <- remDr$findElements(using = 'xpath', "//*[@class='ember-view project-sidebar']/ul[3]/li[4]/ul[8]/li[2]/a")[[1]]$getElementAttribute("href")[[1]]
b.companyWWW <- webElem



dato <- function(we){
  if(length(we)==0){
    return("NA")
  }else{
    return(we[[1]]$getElementText()[[1]])
  }
}


