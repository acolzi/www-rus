//caso maschere di ricerca
function prevPagePreno()
{
	
	var f = document.ricerca;
	f.action=f.actionPage.value;
	f.cmd.value="listaPrenotazioni";
	f.pageNumber.value=parseInt(f.pageNumber.value)-1;
	Ab.submitAj('ricerca', f.cmd.value, 'jQueryWIN');
}

function nextPagePreno()
{	
	var f = document.ricerca;
	f.action=f.actionPage.value;
	f.cmd.value="listaPrenotazioni";
	f.pageNumber.value=parseInt(f.pageNumber.value)+1;
	Ab.submitAj('ricerca', f.cmd.value, 'jQueryWIN');
}

function goPagePreno(l_pageNumber)
{
	var f = document.ricerca;
	f.action=f.actionPage.value;
	f.cmd.value="listaPrenotazioni";
	f.pageNumber.value=l_pageNumber;
	Ab.submitAj('ricerca', f.cmd.value, 'jQueryWIN');
}

function loadAsyncMag(id)
{
	var f = document.ricerca;
	Ab.fetch("Documento.abl", "cmd=loadPrenotazioniMagazzino&id_rigaDocumento="+id, "mag-"+id, null, true);
}

function formSearchingPrenotazione()
{
	//FACCIO IL SUBMIT
	var f = document.ricerca;
	f.action=f.actionPage.value;
	f.cmd.value="listaPrenotazioni";
	f.pageNumber.value=1;
}
function searchingPrenotazione()
{
	//FACCIO IL SUBMIT
	var f = document.ricerca;
	formSearchingPrenotazione();	
	Ab.submitAj('ricerca', 'listaPrenotazioni', 'jQueryWIN');
}