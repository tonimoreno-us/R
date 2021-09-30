# Este script tiene como autor a :
# Pedro Luis Luque Calvo
# Profesor(TU) del Departamento de Estadística e Investigación Operativa
# https://github.com/calote

# Es necesario instalar el software Xpdf tools [http://www.xpdfreader.com/download.html]
# Para una explicación detallada :
# http://destio.us.es/calvo/post/extraer-imagenes-y-texto-de-un-fichero-pdf-con-r/


# Carga las librerías R necesarias y si no están instaladas las instala
if (!require(stringr)) {
  install.packages("stringr")
  library(stringr)  
}
if (!require(magick)) {
  install.packages("magick")
  library(magick)
}
if (!require(pdftools)) {
  install.packages("pdftools")
  library(pdftools)
}

ficheropdf = "Fichero_de_fichas_de_alumnos_en_PDF.pdf"
fpath = "~/ruta_de_acceso/"

text <- pdf_text(paste0(fpath,ficheropdf))  # extrae el texto de todas las páginas del pdf

dat01 = c() # contiene apellidos y nombre
dat02 = c() # contiene apellidos y nombre separados por guiones
dat03 = c() # contiene fecha nacimiento
for (j in 1:length(text)) {  # trabaja con el texto de cada página
  pagina = str_split(text[j],"\n")  
  lineas = unlist(pagina)
  for (i in 1:length(lineas)) {
    res = str_detect(lineas[i],"Apellidos, nombre")  # busca dónde aparece Ape
    if (res) {
      ss = unlist(str_split(lineas[i],"Apellidos, nombre"))
      ss1 = str_trim(ss[2])
      dat01 = c(dat01,ss1)
      dat02 = c(dat02,str_remove_all(str_replace_all(ss1," ","_"),","))
    }
    fcnac = str_detect(lineas[i],"Fecha nacimiento")
    if (fcnac) {
      sff = unlist(str_split(lineas[i],"Fecha nacimiento"))
      sff1 = str_trim(sff[2])
      dat03 = c(dat03,sff1)
    }
  }
}

datos <- data.frame(dat01,dat03)
datos$dat03 <- as.Date.character(datos$dat03,"%d/%m/%Y")
