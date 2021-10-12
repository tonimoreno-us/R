# Funciones para el manejo de STRINGS
strsplit(x,sep)  -> Separa una cadena tomando como elementos los que se encuentran entre delimitadores 'sep'  
stringr::str_split(x,sep)  -> idem  
  
  
#### DEVUELVEN una lista, para obtener elementos añadir [[1]]
  
substr(x,start,end)  -> Para extraer una parte  
gsub("\n","",data_all,fixed = T)  -> Para cambiar/sustituir una parte. Puede utilizar regexp quitando 'fixed = T'
