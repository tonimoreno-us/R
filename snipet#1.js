/* SNIPET 1 - Obtenemos nombres de Dpto. desde : http://https://www.us.es/centros/departamentos */

// Creamos variable donde se introducen los 'div' con los nombres de Dpto.
cntnd = $x('//*[@id="block-views-block-departamentos-block-1"]/div/div/div/div[2]/div');

// Bucle que va desde 0 hasta el número de Dpto. que aparecen en la página
for(var i=0; i < cntnd.length; i++){
    console.log(cntnd[i].textContent);
}
