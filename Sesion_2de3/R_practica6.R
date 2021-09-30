########
# URL : https://www.sepe.es/contenidos/que_es_el_sepe/estadisticas/datos_estadisticos/empleo/datos/estadisticas_nuevas.html
# https://www.sepe.es/contenidos/que_es_el_sepe/estadisticas/datos_estadisticos/empleo/datos/2018/enero.html
# https://www.sepe.es/contenidos/que_es_el_sepe/estadisticas/datos_estadisticos/empleo/datos/2018/enero_2018/ESTADISTICA_DE_EMPLEO.xls
# 

# install.packages("readxl")
library("readxl")

xlsx_file <- "ESTADISTICA_DE_EMPLEO.xls"
excel_sheets(xlsx_file)

EEMP <- read_excel(xlsx_file, sheet = "1.1", range = "B11:K21")  #   "B25:K35"
#[*]  n_max = 3  range = "C1:E4"   cell_rows(1:4)   cell_cols("B:D")   "mtcars!B1:D5" (este incluye sheet)


tablas <- c("B11:K21","B25:K35")
x1 <- lapply(tablas, function(x) read_excel(xlsx_file, sheet = "1.1", range = x,col_names = FALSE))
View(x1[[1]])
View(x1[[2]])





write_excel_csv(ttcC,"file.csv")
# install.packages("writexl")
writexl::write_xlsx(ttcC, path="file.xlsx")    ## Graba un DF por Sheet


ttc <- left_join(ttt,comunidades,by = "Comunidad")
ttco <- order(ttc$YEAR,-ttc$ord,decreasing=TRUE)  

comunidades <- read.table(pipe("pbpaste"), sep="\t", header=F)
read.delim("clipboard") 


library("xlsx")
EEMP <- read.xlsx(file = "ESTADISTICA_DE_EMPLEO.xls", sheetIndex = 2)
