//funzione per aprire div con id operatore
$(function() {

	/////////////////////
	$( "#creaDocumento" ).dialog({
	  autoOpen: false,
	  show: {
		effect: "blind",
		duration: 100
  	  },
	  width: 500
	
	  /*hide: {
		effect: "explode",
		duration: 1000
	  }*/
	});
	$( "#creaDocumento" ).dialog("option", "title", "Crea Documento");
	/////////////////////////////////////////////

});
