/* SNIPET 2 - Obtener URL de cada Dpto. */

// Se crea la variable 'cont' que contendrá todas las URL de Dpto. separadas por '|'
var cont = "";

// Se obtienen del DOM todas aquellas etiquetas 'a' dentro de los div's indicados por la expresión XPath
cntnd = $x('//*[@id="block-views-block-departamentos-block-1"]/div/div/div/div[2]/div//a');

// Bucle que crea una cadena larga que contiene todas las URL de Dpto. separadas por '|'
for(var i=0; i < cntnd.length; i++){
  cont = cont + "|" + cntnd[i].href;
}
