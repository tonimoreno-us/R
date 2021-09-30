install.packages("tidyxl")
# also installing the dependency ‘piton’
library(tidyxl)


examples <- "/Users/tonimoreno/Dropbox/aq/tienda/Fras.E/Fras.2020.xlsx"
#  str(tidyxl::xlsx_cells(examples))
excel <- tidyxl::xlsx_cells(examples)   # , sheets = 7

unique(excel$sheet)   # Ver las pestañas

View(excel[excel$sheet=="76-AY10",])   # Ver contenido pestaña "76-AY10"

###### GRAN VENTAJA DE ESTE PAQUETE
# Ofrece toda la información de la hoja EXCEL muy desglosada : 21 variables por celda


names(excel)
# [1] "sheet"               "address"             "row"                 "col"                 "is_blank"           
# [6] "data_type"           "error"               "logical"             "numeric"             "date"               
# [11] "character"           "character_formatted" "formula"             "is_array"            "formula_ref"        
# [16] "formula_group"       "comment"             "height"              "width"               "style_format"       
# [21] "local_format_id"

rm(list=ls())
