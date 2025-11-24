function scaricaFoto(url){
	
	
	redirect_blank(url);
	$("#ModalLog").modal("hide");
}


function redirect_blank(url) {
  var a = document.createElement('a');
  a.target="_blank";
  a.href=url;
  a.click();
}