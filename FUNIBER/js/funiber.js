
$(document).ready(function(){

//alert('xxx');
 cargarPaises();
  cargarAreas();
})


function cargarAreas(){
	   //Read nodes
   console.log("Entro");
  var varSelected = "";
  $("#cmbAreas").empty();
  $("#cmbAreas").append('<option  disabled selected >*Seleccione Areas</option> ');        

  $.get("xml/areas.xml?v=2", function (dataXml) {
    $(dataXml).find("area").each(function () {
       var id = $(this).find('codigo_area').text();
       var detalle = $(this).find('descripcion').text();
     
    $("#cmbAreas").append('<option '+varSelected+'  value='+id+'>'+detalle+'</option> ');        
    
 
});
console.log(dataXml);
  
});

}


function cargarProgramas(idArea){
	   //Read nodes
   console.log("Entro");
  var varSelected = "";
  var idAreaSeleccionada=idArea.value;
  $("#cmbProgramas").empty();
  $("#cmbProgramas").append('<option  disabled selected >*Seleccione Programas</option> ');        

  $.get("xml/programas.xml?v=2", function (dataXml) {
    $(dataXml).find("programa").each(function () {
       var id = $(this).find('codigo_programa').text();
       var idArea = $(this).find('codigo_area').text();
       var detalle = $(this).find('descripcion').text();
     if(idAreaSeleccionada==idArea){
    $("#cmbProgramas").append('<option '+varSelected+'  value='+id+'>'+detalle+'</option> ');        
    }
 
});
console.log(dataXml);
  
});

}





function cargarPaises(){
   //Read nodes
   console.log("Entro");
  var varSelected = "";
  $("#cmbPaises").empty();
  $("#cmbPaises").append('<option  disabled selected >*Seleccione Paises</option> ');   

       
 
var settings = {
  "url": "https://raw.githubusercontent.com/hiiamrohit/Countries-States-Cities-database/master/countries.json",
  "method": "GET",
  "timeout": 0,
};
var indice=0;
$.ajax(settings).done(function (respuesta) { 
 	$.each(JSON.parse(respuesta), function(i,item){
 		$.each(item, function(iterador,valor){
 			//console.log('item'+);
 			var id=valor.id;
 			var detalle=valor.name;
 			$("#cmbPaises").append('<option   value='+id+'>'+detalle+'</option> ');

 		});
			 
		})

  
});


}

 


 


function cargarEstado(valor){
	   //Read nodes 
  var varSelected = "";
  var idPais=valor.value;
  $("#cmbEstado").empty();
  $("#cmbEstado").append('<option  disabled selected >*Seleccione Estado</option> ');   

       
 
var settings = {
  "url": "https://raw.githubusercontent.com/hiiamrohit/Countries-States-Cities-database/master/states.json",
  "method": "GET",
  "timeout": 0,
};
var indice=0;
$.ajax(settings).done(function (respuesta) { 
 	$.each(JSON.parse(respuesta), function(i,item){
 		$.each(item, function(iterador,valor){
 			//console.log('item'+);
 			var id=valor.id;
 			var detalle=valor.name;
 			var itemPais=valor.country_id;
 			if(itemPais==idPais){
 			$("#cmbEstado").append('<option   value='+id+'>'+detalle+'</option> ');
 			}

 		});
			 
		})

  
});
}





function cargarCiudad(valor){
	   //Read nodes 
  var varSelected = "";
  var idState=valor.value;
  $("#cmbCiudad").empty();
  $("#cmbCiudad").append('<option  disabled selected >*Seleccione Ciudad</option> ');   

       
 
var settings = {
  "url": "https://raw.githubusercontent.com/hiiamrohit/Countries-States-Cities-database/master/cities.json",
  "method": "GET",
  "timeout": 0,
};
var indice=0;
$.ajax(settings).done(function (respuesta) { 
 	$.each(JSON.parse(respuesta), function(i,item){
 		$.each(item, function(iterador,valor){
 			//console.log('item'+);
 			var id=valor.id;
 			var detalle=valor.name;
 			var itemState=valor.state_id;
 			if(itemState==idState){
 			$("#cmbCiudad").append('<option   value='+id+'>'+detalle+'</option> ');
 			}

 		});
			 
		})

  
});
}
