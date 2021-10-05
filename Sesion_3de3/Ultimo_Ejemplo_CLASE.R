## Primero visionar la web: https://www.booking.com/city/es/sevilla.es.html

install.packages("RSelenium")
library("RSelenium")

#  Versión 94.0.4606.71
rD <- rsDriver(browser = c("chrome"),chromever = "94.0.4606.61")

## rD <- rsDriver()    # runs a chrome browser, wait for necessary files to download
remDr <- rD$client  # Abre una instancia de Chrome - no need for remDr$open() browser should already be open

remDr$navigate("https://www.booking.com/city/es/sevilla.es.html")





# remDr$getCurrentWindowHandle()
# remDr$getTitle()

## Pagina inicial
webElem <- remDr$findElements(using = 'xpath', '//*[@id="c-lp-top-hotels"]/div[2]/div[4]/div/div[2]/div[1]/div[1]/header/a/h3/span[1]')
webElem <- remDr$findElements(using = 'xpath', '//*[@id="c-lp-top-hotels"]/div[2]/div[4]/div/div[2]/div[1]/div[2]/div[1]/div[1]')

nombreHoteles <- sapply(1:10,function(x) webElem[[x]]$getElementText())

tablaHoteles <- as.data.frame(cbind(nombreHoteles,valoracionHoteles))



## Pagina despues ampliacion
webElem <- remDr$findElements(using = 'xpath', '//*[@id="hotellist_inner"]/div/div[2]/div[1]/div[1]/div[1]/h3/a/span[1]')
nombreHoteles <- sapply(1:length(webElem),function(x) webElem[[x]]$getElementText())

webElem <- remDr$findElements(using = 'xpath', '//*[@id="hotellist_inner"]/div/div[2]/div[1]/div[2]/div/div[1]/a[1]/div/div[1]')
valoracionHoteles <- sapply(1:length(webElem),function(x) webElem[[x]]$getElementText())

tablaHoteles <- as.data.frame(cbind(nombreHoteles,valoracionHoteles))

# //*[@id="c-lp-top-hotels"]/div[2]/div[4]/div[2]/div[2]/div[1]/div[1]/header/a/h3/span[1]
# //*[@id="c-lp-top-hotels"]/div[2]/div[4]/div[1]
# //*[@id="c-lp-top-hotels"]/div[2]/div[4]/div[2]/div[2]/div[1]/div[2]/div[1]/div[1]


# //*[@id="hotellist_inner"]/div[3]/div[2]/div[1]/div[1]/div[1]/h3/a/span[1]
# //*[@id="hotellist_inner"]/div[3]
# //*[@id="hotellist_inner"]/div[3]/div[2]/div[1]/div[2]/div/div[1]/a[1]/div/div[1]


extrae <- function(xpath){
  wee <- remDr$findElements(using = 'xpath', xpath)
  return(unlist(sapply(1:length(wee),function(x) wee[[x]]$getElementText())))
}


urlH <- "https://www.booking.com/searchresults.es.html?aid=304142&label=gen173nr-1FCAMoRjiEA0gKWARoRogBAZgBCrgBF8gBDNgBAegBAfgBAogCAagCA7gCzKbwigbAAgHSAiQ0MjU1YTA3NC02YmQ4LTQ2YjktYWUyOC05MTMzMjcxMWUzZWPYAgXgAgE&sid=444b58ac9597a2ff279cf1dc20d32ef2&tmpl=searchresults&city=-402849&class_interval=1&dest_id=-402849&dest_type=city&group_adults=2&group_children=0&label_click=undef&no_rooms=1&raw_dest_type=city&room1=A%2CA&sb_price_type=total&shw_aparth=1&slp_r_match=0&srpvid=24bd4353ea6800db&ssb=empty&top_ufis=1&rows=25&offset="

tablaDefinitiva <- NULL

sapply(seq(1, 100, by=25 ), function(x){
  remDr$navigate(paste0(urlH,x))
  
  webElem <- remDr$findElements(using = 'xpath', '//*[@id="hotellist_inner"]/div/div[2]/div[1]/div[1]/div[1]/h3/a/span[1]')
  nombreHoteles <- sapply(1:length(webElem),function(x) webElem[[x]]$getElementText())
  
  webElem <- remDr$findElements(using = 'xpath', '//*[@id="hotellist_inner"]/div/div[2]/div[1]/div[2]/div/div[1]/a[1]/div/div[1]')
  valoracionHoteles <- sapply(1:length(webElem),function(x) webElem[[x]]$getElementText())
  
  keywords <- extrae('//*[@id="hotellist_inner"]/div/div[2]/div[1]/div[1]/div[2]/a')
  
  distanciaCentro <- extrae('//*[@id="hotellist_inner"]/div/div[2]/div[1]/div[1]/div[2]/span[2]/span')
  
  
  
  
  
  
  #### CUIDADO ERROR devuelve el doble de URLs ####
  webElem <- remDr$findElements(using = 'xpath', '//*[@id="hotellist_inner"]/div/div[2]/div[1]/div[2]/div/div[1]/a')
  enlacePerfil <- sapply(1:length(webElem),function(x) webElem[[x]]$getElementAttribute("href"))
  
  tablaHoteles <- cbind(nombreHoteles,valoracionHoteles,keywords,distanciaCentro,enlacePerfil)
  tablaDefinitiva <<- rbind(tablaDefinitiva,tablaHoteles)
  
  Sys.sleep(3)
  
})

tablaDefinitiva <- as.data.frame(tablaDefinitiva)

tablaDefinitiva$keywords <- gsub(" Mostrar en el mapa","",tablaDefinitiva$keywords,fixed=T)

tablaDefinitiva$distanciaCentro <- gsub(" km del centro","",gsub("a ","",tablaDefinitiva$distanciaCentro,fixed=T),fixed=T)



# tablaDefinitiva$valoracionHoteles <- as.numeric(tablaDefinitiva$valoracionHoteles)
tablaDefinitiva$distanciaCentro <- as.numeric(gsub(",",".",tablaDefinitiva$distanciaCentro))


tablaDefinitiva$valoracionHoteles <- as.numeric(gsub(",",".",tablaDefinitiva$valoracionHoteles))

tablaDefinitiva$nombreHoteles <- unlist(tablaDefinitiva$nombreHoteles)




############### Probando para obtener 'pagename' limpio
aaa <- gsub("https://www.booking.com/hotel/es/","",tablaDefinitiva$enlacePerfil)

aaa <- substr(aaa,0,regexpr(".es",aaa,fixed = T)-1)
View(aaa)


###################
# Proximo paso : a partir del indice de pagenames generado
# montar las urls de los comentarios y extraer comentarios

https://www.booking.com/reviewlist.es.html?aid=304142;
label=gen173nr-1FCAMoRjiEA0gKWARoRogBAZgBCrgBF8gBDNgBAegBAfgBAogCAagCA7gCzKbwigbAAgHSAiQ0MjU1YTA3NC02YmQ4LTQ2YjktYWUyOC05MTMzMjcxMWUzZWPYAgXgAgE;
sid=d7d6addec3a756266bd51ce48e2a674b;cc1=es;
dist=1;
pagename=casual-sevilla-don-juan-tenorio;
srpvid=4dec4b0a9d260148;
type=total&;offset=10;rows=10

































####################################################
# Pertenece a un script anterior, no está TESTADO


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



remDr$close()
# stop the selenium server
rD[["server"]]$stop()
# if user forgets to stop server it will be garbage collected.
rD <- rsDriver()
rm(rD)
gc(rD)


