###### Captura datos Tabla en web #########

#   install.packages("rvest")    ## Solo si no se ha instalado aún la libreria
library("rvest")

r_pack <- read_html("https://cran.rstudio.com/web/packages/available_packages_by_date.html")
tabla <- r_pack %>% html_nodes(xpath = "/html/body/table[1]") %>% html_table()

Rpck <- tabla[[1]]

head(table(Rpck$Date))
tail(table(Rpck$Date))
pckD <- table(Rpck$Date)

#### Fechas de mayor actualizacion y/o publicacion de paquetes
tail(sort(pckD))
