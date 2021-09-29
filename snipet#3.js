/* Esta instrucción realiza la misma funcionalidad que un bucle 'for'
    En este caso recorre los objetos seleccionados mediante XPath, que son etiquetas 'a'
    Y extrae el atributo 'href' de cada objeto.  */

[].map.call($x('//*[@id="content-wrapper"]/div/h4//a'), function(x){ return x.href;});

/* Puede aplicarse en esta URL : https://tuwebcreativa.com/fuentes-de-texto-mr-wonderful-gratis/ */
