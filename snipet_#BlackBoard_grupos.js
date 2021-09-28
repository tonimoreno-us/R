/* Este snipet se utiliza para cargar de forma automática los miembros de un grupo en BlackBoard */
ada = prompt("Pegue valores grupo:");
ada = ada.split(" ");
// Separa los valores introducidos por espacios y los vuelve a guardar en la variable 'ada'
ix = 0;

function checkName(name){
  return(name == ada[ix]);
};

function myF(value, index, array) {
  return value.innerText.trim();
};

// Selecciona todos los elementos de la clase 'userNametag' y los carga en una lista en 'aaa'
aaa = document.querySelectorAll("#userNametag");
// Recorre todos los elementos de 'aaa' aplicando la función 'myF' que extrae el valor del UVUS de cada alumno y los carga en la variable aba
aba = Array.from(aaa).map(myF);

// Bucle que recorre todos los valores introducidos por el usuario
for (ix = 0; ix < ada.length; ix++) {
  // Busca el número de orden del usuario que coincide con el de la lista del profe y lo guarda en 'aca'
  aca = aba.findIndex(checkName);
  //	console.log(aca);
// Busca el elemento fila correspondiente que ha sido identificado en el paso anterior y genera un evento 'click' que lo selecciona
document.querySelectorAll("#userGroupList_databody tr")[aca].click();
}
