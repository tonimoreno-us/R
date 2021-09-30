### Desde TECLADO
scan()
nombres <- scan(,what=character(),3) 


### Desde PORTAPAPELES - Corta-Pega
read.delim("clipboard")
writeClipboard(as.character(factor.name))      # Sirve para copiar datos desde R al portapapeles y con CTRL+V a Excel
write.table(data,"clipboard",sep="\t",col.names=NA)  # Igual copiar datos desde R a EXCEL mediante corta-pega (portapapeles)


### Desde Archivo CSV
read.csv("file.csv",dec=",")
datos <- read.table("c:\\cursoada\\edadaltura.txt")

write.table(x, file = "", append = FALSE, quote = TRUE, dec=".", sep = " ", row.names = TRUE, col.names = TRUE)
write.csv2(misDatos,file="miArchivoDeDatos.csv")  ## formato csv latino

library(data.table)
datos <- fread(input = "C:/Users/Mauricio/Desktop/datos_ejemplos.csv",
               header = TRUE, 
               col.names = c("fecha", "cliente", "producto", "precio"),
               data.table = FALSE,
               sep = ",",
               dec = ".",
               showProgress = TRUE)

### Desde EXCEL
library("xlsx")
read.xlsx(file = "file.xlsx", sheetIndex = 1)

### Desde SPSS, SAS, ...
library(foreign)
misDatos2=read.spss("http://www.dma.ulpgc.es/profesores/personal/stat/cursoR4ULPGC/datos/datosPractica1.sav", to.data.frame=TRUE)






# Francisco Liñán
# https://scholar.google.es/citations?user=oNUXi0UAAAAJ&hl=es



#Eliminamos algunos caracteres regulares 
texto_col$V1 = gsub("([[:space:]])","",texto_col$V1) 
texto_col$V1 = gsub("([[:digit:]])","",texto_col$V1) 
texto_col$V1 = gsub("([[:punct:]])","",texto_col$V1) 
#Creamos una variable longitud de la palabra 
texto_col$largo = nchar(texto_col$V1) 

word.freq <- sort(rowSums(m), decreasing = T)
