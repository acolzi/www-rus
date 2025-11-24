// JavaScript Document
//script ad hoc solo per coave documento


////////////////////////////////////////////
//stacca servizio e lo rende fatturabile nuovament
////////////////////////////////////////////
function staccaServizio(id_rigaDocumento)
{
	
	checkBoxes();
	var f = document.main;

	if(confirm("Verra' dissociato il servizio alla fattura. Il servizio sara' poi nuovamente fatturabile. Vuoi continuare?"))
	{
		//Ab.popUp("ELAB_SC");
		f.cmd.value="dissociaServizio";
		f.id_rigaDocumento.value=id_rigaDocumento;
		f.action=f.actionPage.value;
		Ab.submitAj('main');
	}
	
}
////////////////////////////////////////////
//salva il solo dato della banca in cui anticipo
//perché devo salvare anche quando la fattura è stampata
////////////////////////////////////////////
function salvaAnticipo()
{
	
	Ab.fetch("Documento.abl", "cmd=aggiornaBancaAnticipo&id_documento=" + $("#id_documento").val() + "&id_bancaAnticipo=" + $("#id_bancaAnticipo").val(), "messaggi");
	
	
}

//
//allinea da fattura a servizi
//
function allineaServiziDaProforma() {
	var f = document.main;	
	
	if (confirm('Vuoi aggiornare i servizi dal dettaglio della fattura?')) {
		f.cmd.value="allineaServiziDaProforma";
		f.act.value="";
		f.action=f.actionPage.value;
		Ab.submitAj('main');	
	}
}

//allinea da fattura a servizi
//
function allineaProformaConPrezziServizi() {
	var f = document.main;	
	
	if (confirm('Vuoi aggiornare i servizi dal dettaglio della fattura?')) {
		f.cmd.value="allineaProformaConPrezziServizi";
		f.act.value="";
		f.action=f.actionPage.value;
		Ab.submitAj('main');	
	}
}

//sul campio da bozza a proforma a fattura
//azzero numero
function onChangeFlgStato()
{
	$("#progDocumento").val("");
	$("#progDocumentoAgg").val("");
	$("#id_esercizio").val("");
	
}

//
//allinea da servizi a fattura
//

function refreshDocumento()
{

	var l_flgPagamentoDataFissa=prendiElementoDaId("flgPagamentoDataFissa");
	var l_tipoPagamento=prendiElementoDaId("id_tipoPagamento");
	var l_dataScadenzaPagamento=prendiElementoDaId("dataScadenzaPagamento");
	var l_dataScadenzaPagamentoDP=prendiElementoDaId("dataScadenzaPagamentoDP");
	
	var f = document.main;
	if(l_flgPagamentoDataFissa.value>0)
	{
		l_tipoPagamento.disabled="disabled";
		l_tipoPagamento.value="";
		l_dataScadenzaPagamento.disabled="";
		l_dataScadenzaPagamentoDP.style.display="inline";
		
	}
	else
	{
		l_tipoPagamento.disabled="";
		l_dataScadenzaPagamento.value="";
		l_dataScadenzaPagamento.disabled="disabled";
		l_dataScadenzaPagamentoDP.style.display="none";
		
	}

}

