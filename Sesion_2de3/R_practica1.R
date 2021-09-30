# Carga las librerías R necesarias y si no están instaladas las instala
if (!require(rvest)) {
  install.packages("rvest")
  library(rvest)
}
if (!require(magrittr)) {
  install.packages("magrittr")
  library(magrittr)
}


### Ejemplo de scraping con la web donde aparecen los paquetes disponibles para R
# r_pack <- read_html("https://cran.rstudio.com/web/packages/available_packages_by_date.html")
# aa <- r_pack %>% html_nodes(xpath = "/html/body/table[1]") %>% html_table()



#### Creamos índice de Dptos ####

tablaGRANDE <- NULL

URL <- "https://www.us.es/centros/departamentos?page="

for(i in 0:13){
  
  tablaDptos <- NULL
  tblDpts <- read_html(paste0(URL,i)) %>% 
    html_nodes(xpath = '//*[@id="block-views-block-departamentos-block-1"]/div/div/div/div[2]/div //a') 
  tbl1 <- tblDpts %>% html_attr("href")
  tbl2 <- tblDpts %>% html_text()
  
  tablaDptos <- cbind(tbl1,tbl2)
  tablaGRANDE <- rbind(tablaGRANDE,tablaDptos)
}



URL2 <- "https://www.us.es"
tablaContactos <- NULL
tablaCGRANDE <- NULL

for(i in 1:nrow(tablaGRANDE)){
  pgDpto <- read_html(paste0(URL2,tablaGRANDE[i,1]))
  
  email <- pgDpto %>% html_nodes(xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "field--label-above", " " ))]//*[contains(concat( " ", @class, " " ), concat( " ", "field__item", " " ))]') %>% html_text()

  tlfno <- pgDpto %>% html_nodes(xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "field--label-inline", " " ))]//*[contains(concat( " ", @class, " " ), concat( " ", "field__items", " " ))]') %>% html_text()
  tlfno <- trimws(tlfno)
  
  tablaContactos <- cbind(trimws(email[1]),trimws(email[2]),tlfno)
  tablaCGRANDE <- rbind(tablaCGRANDE,tablaContactos)
  
  }
