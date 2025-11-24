/* ab-documento lte *
/* 4.1 */
/******************************/
/* COPPIA FORMFIELD MODALFIELD PER CARICAMENTO DATI */
/* DALLA MODAL ALLA MAIN E VICEVERSA per cnuovo o midifico clifor*/
var retItemsClifor = [{
	"formField": "id_clifor",
	"modalField": "id_clifor"
}, {
	"formField": "nominativoDocumento",
	"modalField": "descrizioneCompleta"
}, {
	"formField": "indirizzoClifor",
	"modalField": "indirizzoCompleto"
}, {
	"formField": "telDocumento",
	"modalField": "telefono"
}, {
	"formField": "cellDocumento",
	"modalField": "cellulare"
}, {
	"formField": "id_tipoPagamento",
	"modalField": "id_tipoPagamento"
}, {
	"formField": "banca",
	"modalField": "bancaDesc"
}, {
	"formField": "iban",
	"modalField": "iban"
}, {
	"formField": "eMailDocumento",
	"modalField": "eMail"
}];


//funzione per aprire div con id operatore
$(function () {
	$("#operatore").dialog({
		autoOpen: false,
		show: {
			effect: "blind",
			duration: 100
		},
		/*hide: {
		effect: "explode",
		duration: 1000
	  }*/
	});
	$("#operatore").dialog("option", "title", "Seleziona Operatore");
	/////////////////////////////////////////////
	$("#cassaAdmin").dialog({
		autoOpen: false,
		width: "400px",
		show: {
			effect: "blind",
			duration: 100
		},
		/*hide: {
		effect: "explode",
		duration: 1000
	  }*/
	});
	$("#cassaAdmin").dialog("option", "title", "Chiusura Cassa");
	////////////////
	$("#jQueryWIN").dialog({
		autoOpen: false,
		height: 700,
		width: 1000,
		show: {
			effect: "blind",
			duration: 100
		},
		/*hide: {
		effect: "explode",
		duration: 1000
	  }*/
	});

	//definizione del tasto di apertura della pagina
	/*
	$( "#btn_fis" ).click(function() {
	  $( "#operatore" ).dialog( "open" );
	  $( "#tipoScontrino" ).val(1);	  
	});
	$( "#btn_nf" ).click(function() {
	  $( "#operatore" ).dialog( "open" );
	  $( "#tipoScontrino" ).val(2);	  
	});
	$( "#btn_chiudi" ).click(function() {
	  $( "#operatore" ).dialog( "open" );
	  $( "#tipoScontrino" ).val(3);	  
	});
	$( "#btn_genera" ).click(function() {
	  $( "#operatore" ).dialog( "open" );
	  $( "#tipoScontrino" ).val(4);	  
	});
	*/
	//bottone annulla su siv selezione operatore
	$("#btn_closer").click(function () {
		$("#operatore").dialog("close");
	});

	//bottone contiuna su div selezione operatore
	$("#btn_elab").click(function () {
		if ($("#tipoScontrino").val() == 1 && $("#totDocumento").val() == "0,00")
			alert("ATTENZIONE! Scontrino a valore zero");
		else {
			stampa();
			$("#operatore").dialog("close");
		}
	});
	$("#btn_elabReport").click(function () {
		reportPdf();
		$("#selReport").dialog("close");
	});
	$("#btn_closerReport").click(function () {
		$("#selReport").dialog("close");
	});

	/*
	$( "#btn_rgiorno" ).click(function() {
		printReportG();
		$( "#cassaAdmin" ).dialog( "close" );
	});
	$( "#btn_rfina" ).click(function() {
		printReportF();
		$( "#cassaAdmin" ).dialog( "close" );
	});
	*/

	$("#selReport").dialog({
		autoOpen: false,
		show: {
			effect: "blind",
			duration: 100
		},
		/*hide: {
		effect: "explode",
		duration: 1000
	  }*/
	});
	$("#selReport").dialog("option", "title", "Seleziona Tipo Report");
	/////////////////////

	$("#mail").dialog({
		autoOpen: false,
		width: 537,
		show: {
			effect: "blind",
			duration: 100
		},
		/*hide: {
		effect: "explode",
		duration: 1000
	  }*/
	});

	$("#mail").dialog("option", "title", "Invio Fattura via Email");

	/////////////////////

	$("#sceltaBanca").dialog({
		autoOpen: false,
		show: {
			effect: "blind",
			duration: 100
		},
		/*hide: {
		effect: "explode",
		duration: 1000
	  }*/
	});
	$("#sceltaBanca").dialog("option", "title", "Seleziona la banca");


});
/*************************************************/
/*************************************************/
/* DOCUMENT READY CR*/
/*************************************************/
/*************************************************/

function documentReadyScriptCR() {
	Ab.startAggiornaThreadMsg();
	/*$( "#dataDocumentoDa" ).datepicker();
		
		$( "#dataDocumentoDa" ).datepicker( "option", "dateFormat", "dd/mm/yy") ;
		
		$( "#dataDocumentoA" ).datepicker();
		$( "#dataDocumentoA" ).datepicker( "option", "dateFormat", "dd/mm/yy");
		*/

}

/*************************************************/
/*************************************************/
/* REPORT*/
/*************************************************/
/*************************************************/


function report() {
	//FACCIO IL SUBMIT
	var f = document.main;
	f.action = f.actionPage.value;
	f.flgReport.value = "S";
	//f.action=webApp+"/tr/Pratica.abl";
	f.cmd.value = "search";
	Ab.submitAj('main');
}

/************************************************************/
/************************************************************/
/* LANCIA IL REPORT PDF DAL POPUP SELEZIONA REPORT*/
/************************************************************/
/************************************************************/
function reportPdf() {
	var debug = false;
	var wwD = "700";
	var whD = "500";
	var f = document.main;
	//checkBoxesCR();

	var rep = document.rep;

	//scrivo l'operatore selezionato dalla combo nel campo nascosto della form dettaglio
	f.flgTipoReport.value = $("#flgTipoReportC").val();

	//+"&xxx="+f.xxx.value
	f.cmd.value = "print";
	f.act.value = "report";
	theAction = f.actionPage.value + "?" + $("#main").serialize();
	//theAction=f.actionPage.value+"?cmd=print&act=report&flgTipoReport="+f.flgTipoReport.value+"&dataDocumentoDa="+f.dataDocumentoDa.value+"&dataDocumentoA="+f.dataDocumentoA.value+"&id_tipo="+f.id_tipo.value+"&id_tipoDocumento="+f.id_tipoDocumento.value;
	//alert(theAction.length);
	//alert(theAction);
	if (f.flgTipoReport.value == 88888) {
		var blankLabels = prompt("Numero di etichette da saltare", "0");
		theAction = theAction + "&blankLabels=" + blankLabels;

	}

	if (debug == false) {
		window.open(theAction, "Stampa_Report_", "width=" + wwD + ",height=" + whD + ",status=no,resizable=yes,top=100,left=100,scrollbars=yes");
	} else {
		window.open(theAction);
	}


}
 
/////////////////////////////////////////////7
function checkFields()
/////////////////////////////////////////////7
{ //var l_note=Ab.prendiElementoDaId("note");
	//l_note.value=l_note.value.replace(//ig,"€");
	var f = document.main;
	//tuttofoto... se confermato va in lavorazione
	if($("#flgProcediPagamento").val()==1)
		{	
			if($("#flgStatoOrdineWww").val()=="0"){
				$("#flgStatoOrdineWww").val(1);
			}
			
		}
	//var l_note=f.note;
	//alert(f.cmd.value);
	Ab.aggiustaInputText(f.note);
	if (f.id_tipoDocumento.value == 1 && f.totDocumento.value == "0,00" && f.cmd.value != "applicaListinoDoc") {
		alert("ATTENZIONE! Scontrino a valore zero..");
		return false;
	}

	//if(f.id_tipoDocumento.value==1 && f.flgEmettiFatturaScontrino.value==0 ||  Ab.validateForm('id_clifor2','Cliente/Fornitore2','RisNumKey'))
	if (f.id_tipoDocumento.value == 9)
		return Ab.validateForm('descrizioneClifor', 'Cliente/Fornitore', 'R', 'id_users', 'Operatore', 'RisNumKey', 'cellDocumento', 'Cellulare avviso', 'R');
	else if (f.id_tipoDocumento.value != 1)
		return Ab.validateForm('id_clifor', 'Cliente/Fornitore', 'RisNumKey','id_tipoPagamento','Modalita di Pagamento','RisNumKey');
	else
		return true;

}

/////////////////////////////////////////////7
function checkSearchFields()
/////////////////////////////////////////////7
{
	if (document.main.crNS == 1)
		return false;
	else {
		//return Ab.validateForm('descrizione','Descrizione','R','numero','Numero','RisNum>0','eMail','','NisEmail');
		return true;
	}


}


function checkBoxes()
/////////////////////////////////////////////
{
	var l_id_tipoDocumento = Ab.prendiElementoDaId('id_tipoDocumento').value;
	//

	//	if(l_id_tipoDocumento!=1)
	//		Ab.setChekBoxValue("dettaglio","flgMantieniArticoloRiga","1","0");

	//Ab.setChekBoxValue("dettaglio","flgAutoAdd","1","0");
	//Ab.setChekBoxValue("dettaglio","flgSingleLineArt","1","0");
	//if (document.getElementById('flgIgnoraPrenotazione') )
	//		Ab.setChekBoxValue("dettaglio","flgIgnoraPrenotazione","1","0");

	//Ab.setChekBoxValue("dettaglio","flgPagamentoDataFissa","1","0");
	//if(l_id_tipoDocumento==1)
	//	Ab.setChekBoxValue("dettaglio","flgEmettiFatturaScontrino","1","0");

}

function checkRadio() {
	//setRadioButtonValue("dettaglio","flgPlaAntPos");
}

function checkBoxesCR()
/////////////////////////////////////////////
{
	//Ab.setChekBoxValue("ricerca","flgSommaCRL","1","0");
}

function checkRadioCR() {
	//Ab.setRadioButtonValue("ricerca","flgPlaAntPos");

}
/***************************************************/
/***************************************************/
/* tasto aggiungi riga articolo sul dettaglio documento*/
/***************************************************/
/***************************************************/
function addRigaArticolo()

{
	//prima cosa salvo le quantità sui campi hidden

	//1 FT fatt vendita
	//2 FB fattura accompagnatoria
	//3 fa fattura acquisto
	//4 bo bolla di accompagnamento
	//5 prenotazione
	//Ab.prendiElementoDaId("ADDRIGA").disable;

	{
		var f = document.main;
		var cf;

		if ($("#id_magFisicoPartenza").val() == 0 && $("#isMagPartenza").val() == "true") {
			alert("Selezionare un Magazzino di partenza");
			return;
		}

		if ($("#id_magFisicoArrivo").val() == 0 && $("#isMagArrivo").val() == "true") {
			alert("Selezionare un Magazzino di arrivo");
			return;
		}
		//checkBoxes();
		f.action = f.actionPage.value;

		//gestione euro
		Ab.aggiustaInputText(f.descrizioneRiga);
		Ab.aggiustaInputText(f.notaRigaDocumento);
		if (document.getElementById('notaBarcode'))
			Ab.aggiustaInputText(f.notaBarcode);

		//alert(f.flgTipologia.value);
		//alert(f.flgClienteFornitore.value);
		//aggiorniamo la quantità
		if ($("#id_articolo").val() == 0) {
			$("#flgUdmTA").val(1);
		}
		var udm = $("#flgUdmTA").val();

		if (udm == 1)
			$("#quantita").val($("#nr").val());
		else if (udm == 2)
			$("#quantita").val($("#kg").val());
		else if (udm == 3)
			$("#quantita").val($("#mt").val());
		else $("#quantita").val(0);

		console.log("addrigaarticolo: " + udm + " " + $("#quantita").val());
		//DA VERIFICARE!!!!!!!
		if (f.flgTipologia.value == 4) {
			cf = checkCPrenotazione();
		} else if ($("#id_tipoDocumento").val() == 1) {
			cf = checkCassa();
		} else {
			if (f.flgClienteFornitore.value == "F")
				cf = checkF();
			else if (f.flgClienteFornitore.value == "C")
				cf = checkC();
			else if (f.flgClienteFornitore.value == "A")
				cf = checkA();
			else {
				cf = false;
				alert("ERRORE! Tipo documento no valido");
			}
		}

		if (cf) {
			f.cmd.value = "gr";
			f.act.value = "addRigaArticolo";
			//alert('pio');
			$("#currentFocus").val("descrizioneRiga");
			console.log("addrigaarticolo: " + $("#currentFocus").val());
			//f.flgCaricaArticoli.value=1;
			//Ab.popUp("ELAB");
			//	Ab.submitAj('main');
			//
			Ab.submitAj('main');
		}
	}


}

/*******************************************/
/* campi obbligatori per documenti a fornitori*/
function checkF() {
	//alert('f');
	var f = document.main;
	if (f.flgUsaSeriale.value == 1 && document.main.flgTipologia.value != 3 && !Ab.validateForm('seriale', 'Seriale articolo', 'R'))
		return false;
	//imponibile in rosso
	if (f.imponibile.value == "0,00" || f.imponibile.value == "") {
		var theIdStyle = document.getElementById('imponibile').style;
		theIdStyle.backgroundColor = "#ff0000";
	}
	return Ab.validateForm('id_clifor', 'Fornitore', 'RisNumKey', 'quantita', 'quantita', 'RisNum>0', 'id_iva', 'codice iva', 'RisNumKey');
}

/*******************************************/
/* campi obbligatori per documenti a clienti*/
function checkC() {
	//alert('C');
	var f = document.main;
	if (f.flgUsaSeriale.value == 1 && document.main.flgTipologia.value != 3 && !Ab.validateForm('seriale', 'Seriale articolo', 'R'))
		return false;
	//prezzoPubblicoConIva in rosso
	if (f.prezzoPubblicoConIva.value == "0,00" || f.prezzoPubblicoConIva.value == "") {
		var theIdStyle = document.getElementById('prezzoPubblicoConIva').style;
		theIdStyle.backgroundColor = "#ff0000";
	}
	//corrispettivi.... se emetti fattura id_clifor2  obbligatorio flgEmettiFatturaScontrino
	//s09-02-2010 viene chamato da add riga... non controllo id_clilfor2
	//	if(f.id_tipoDocumento.value!=1 || (f.id_tipoDocumento.value==1 &&  f.flgEmettiFatturaScontrino.value==0) ||(f.id_tipoDocumento.value==1 &&  //Ab.validateForm('id_clifor2','Cliente/Fornitore','RisNumKey')))
	//IMPONIBILE >O PER ATELIER....//
	//		return Ab.validateForm('id_clifor','Cliente/Fornitore','R','descrizioneRiga','Articolo','R','quantita','quantita','RisNum>0','imponibile','Prezzo imponibile','RisNum>0','id_iva','codice iva','RisNumKey'); 
	return Ab.validateForm('id_clifor', 'Cliente/Fornitore', 'R', 'descrizioneRiga', 'Articolo', 'R', 'quantita', 'quantita', 'RisNum>0', 'imponibile', 'id_iva', 'codice iva', 'RisNumKey');


	//		else
	//			return false;
}


function checkCassa() {
	//alert('Cassa');
	var f = document.main;
	if (f.flgUsaSeriale.value == 1 && document.main.flgTipologia.value != 3 && !Ab.validateForm('seriale', 'Seriale articolo', 'R'))
		return false;
	//prezzoPubblicoConIva in rosso
	if (f.prezzoPubblicoConIva.value == "0,00" || f.prezzoPubblicoConIva.value == "") {
		var theIdStyle = document.getElementById('prezzoPubblicoConIva').style;
		theIdStyle.backgroundColor = "#ff0000";
	}
	//corrispettivi.... se emetti fattura id_clifor2  obbligatorio flgEmettiFatturaScontrino
	//s09-02-2010 viene chamato da add riga... non controllo id_clilfor2
	//	if(f.id_tipoDocumento.value!=1 || (f.id_tipoDocumento.value==1 &&  f.flgEmettiFatturaScontrino.value==0) ||(f.id_tipoDocumento.value==1 &&  //Ab.validateForm('id_clifor2','Cliente/Fornitore','RisNumKey')))
	return Ab.validateForm('id_clifor', 'Cliente/Fornitore', 'RisNumKey', 'id_articolo', 'Articolo', 'RisNumKey', 'quantita', 'quantita', 'RisNum>0', 'id_iva', 'codice iva', 'RisNumKey');
	//		else
	//			return false;
}

function checkCPrenotazione() { //alert('C');

	var f = document.main;

	//prezzoPubblicoConIva in rosso
	if (f.prezzoPubblicoConIva.value == "0,00" || f.prezzoPubblicoConIva.value == "") {
		var theIdStyle = document.getElementById('prezzoPubblicoConIva').style;
		theIdStyle.backgroundColor = "#ff0000";
	}

	if ($("#cellDocumento").attr("type") != "hidden") {
		return Ab.validateForm('nominativoDocumento', 'Cliente', 'R', 'descrizioneRiga', 'Articolo', 'R', 'quantita', 'quantita', 'RisNum>0', 'id_users', 'Operatore', 'RisNumKey', 'cellDocumento', 'Cellulare avviso', 'R');
	} else {
		return Ab.validateForm('nominativoDocumento', 'Cliente', 'R', 'descrizioneRiga', 'Articolo', 'R', 'quantita', 'quantita', 'RisNum>0', 'id_users', 'Operatore', 'RisNumKey');
	}
}

/*******************************************/
/* campi obbligatori per documenti a altro???*/
function checkA() {
	//alert('A');
	return Ab.validateForm('id_clifor', 'Cliente/Fornitore', 'RisNumKey', 'id_articolo', 'Articolo', 'RisNumKey', 'quantita', 'quantita', 'RisNum>0', 'id_iva', 'codice iva', 'RisNumKey');

}

function delRigaArticolo(l_id)
/////////////////////////////////////////////
{
	if (Ab.confirmDelete()) {
		var f = document.main;
		//checkBoxes();
		f.action = f.actionPage.value;
		//	FACCIO IL SUBMIT
		f.cmd.value = "gr";
		f.act.value = "delRigaArticolo";
		f.id_rigaDocumento.value = l_id;
		//f.flgCaricaArticoli.value=1;
		//	Ab.submitAj('main');
		Ab.submitAj('main');
	}

}

function modRigaArticolo(l_id)
/////////////////////////////////////////////
{
	var f = document.main;
	//checkBoxes();
	f.action = f.actionPage.value;
	//f.action=$("#actionPage", "#main").val();
	//	FACCIO IL SUBMIT
	f.cmd.value = "gr";
	f.act.value = "modRigaArticolo";
	f.id_rigaDocumento.value = l_id;
	//f.flgCaricaArticoli.value=1;
	//	Ab.submitAj('main');
	//sweetAlert("aaaaa");
	Ab.submitAj('main');
	//sweetAlert("aaaaa");

}

function cambiaFocus() {
	console.log("cambiaFocus");
	var f = document.main;
	var l_id_tipoDocumento = Ab.prendiElementoDaId('id_tipoDocumento').value;
	var l_id_clifor = Ab.prendiElementoDaId('id_clifor').value;
	checkBoxes();
	if (l_id_tipoDocumento == 1 || l_id_clifor > 0) {
		if (f.flgMantieniArticoloRiga.value == 1 && f.flgUsaSeriale.value == 1)
			Ab.setFocus('seriale')
		else
			Ab.setFocus('descrizioneRiga')
	} else {
		if (f.currentTab.value == "RIGHE") {
			if (f.flgMantieniArticoloRiga.value == 1 && f.flgUsaSeriale.value == 1)
				Ab.setFocus('seriale')
			else
				Ab.setFocus('descrizioneRiga')

		} else {
			Ab.setFocus('nominativoDocumento')

		}
	}
}

function beep() {
	var theBeep;
	if (ns4 || mz7) {

		var theIdStyle = document.getElementById('seriale').style;
		theIdStyle.backgroundColor = "#ff0000";
	} else {

		var snd = new Audio("../../_sounds/left.wav");

		snd.play();

		//theBeep=Ab.prendiElementoDaId('beep');
		//theBeep.src='../../_sounds/left.wav';
	}

	//document.all.beep.src='../../_sounds/left.wav';

}


///////////////////////////////////////////////////
// SALVATAGGIO DEL BEAN
///////////////////////////////////////////////////
function xxsaveCommand(postProcess, async) {
	if (checkFields()) {
		if (checkBoxes) {
			checkBoxes();
		}
		formSaveCommand();
		if (postProcess == null) {
			if ($("#imgFile").length > 0 && $("#imgFile").val() != "" || $("#cmd2").val() == "delImg")
				$("#main").submit();
			else {
				Ab.submitAj('main');
				//$("#main").submit();
				//submitSaveAj(null,async)
			}
		} else {
			$("#main").submit();
			//submitSaveAj(postProcess,async)
		}
	}
}

function saveConferma() {

	var f = document.main;
	f.flgStato.value = 1;
	saveCommand();
}

function ricalcolaMag() {
	if (confirm("Verra' ricalcolato tutto il magazzino. Sei Sicuro?")) {
		var f = document.main;
		f.action = f.actionPage.value;
		f.cmd.value = "ricalcolaMag";
		Ab.submitAj('main');
	}

}


////////////////////
// stampa etichette
//////////////////////
function labelD() {
	var f = document.main;

	{
		var debug = false;
		var wwD = "700";
		var whD = "500";

		//+"&xxx="+f.xxx.value
		theAction = f.actionPage.value + "?cmd=print&act=lblArt" + "&id_documento=" + f.id_documento.value;

		//
		//var numLabels=prompt("Numero di etichette da stampare","1");
		var blankLabels = prompt("Numero di etichette da saltare", "0");
		theAction = theAction + "&blankLabels=" + blankLabels; //+"&numLabels="+numLabels;
		if (debug == false) {
			window.open(theAction, "Stampa_Etichette_Documento_Articolo", "width=" + wwD + ",height=" + whD + ",status=no,resizable=yes,top=100,left=100,scrollbars=yes");
		} else {
			window.open(theAction);
		}

	}

}

function labelCR() {

	var f = document.main;

	if (confirm("Verranno stampate le etichette di tutti i documenti relativi al criteri di ricerca selezionato. Sei sicuro?")) {
		var debug = false;
		var wwD = "700";
		var whD = "500";

		//+"&xxx="+f.xxx.value
		theAction = f.actionPage.value + "?cmd=print&act=lblArt" + "&progDocumento=" + f.progDocumento.value + "&id_esercizio=" + f.id_esercizio.value + "&id_tipoDocumento=" + f.id_tipoDocumento.value + "&id_clifor=" + f.id_clifor.value + "&dataDocumentoDa=" + f.dataDocumentoDa.value + "&dataDocumentoA=" + f.dataDocumentoA.value;

		//
		//var numLabels=prompt("Numero di etichette da stampare per articolo","1");
		var blankLabels = prompt("Numero di etichette da saltare", "0");
		theAction = theAction + "&blankLabels=" + blankLabels; //+"&numLabels="+numLabels;
		if (debug == false) {
			window.open(theAction, "Stampa_Etichette_Articolo", "width=" + wwD + ",height=" + whD + ",status=no,resizable=yes,top=100,left=100,scrollbars=yes");
		} else {
			window.open(theAction);
		}

	}

}

function emettiFatturaClick() {
	// alert('old');
	//checkBoxes();
	var rowCliente = Ab.prendiElementoDaId('CLIENTE');
	var l_flgEmettiFatturaScontrino = Ab.prendiElementoDaId('flgEmettiFatturaScontrino').value;
	if (l_flgEmettiFatturaScontrino == 1) {
		rowCliente.style.display = "table-row";
	} else {
		rowCliente.style.display = "none";
		//non cancello niente... lo devo fare se salvo 'gniosa

	}

}

function emettiDocumentoChange() {

	/*checkBoxes();
	var rowCliente=Ab.prendiElementoDaId('CLIENTE');
	var l_flgEmettiFatturaScontrino=Ab.prendiElementoDaId('flgEmettiFatturaScontrino').value;
	if(l_flgEmettiFatturaScontrino>0)
	{
		rowCliente.style.display="table-row";
	}
	else
	{
		rowCliente.style.display="none";
		//non cancello niente... lo devo fare se salvo 'gniosa

	}
	*/

}

function ristampaScontrino() { //checkBoxes();
	var f = document.main;
	if (f.totDocumento.value == "0,00")
		alert("ATTENZIONE! Scontrino a valore zero");
	else
	if (flgEmettiFatturaScontrino.value > 0)
		alert('ATTENZIONE! Stai emettendo una fattura. Non puoi stampare lo scontrino');
	else
	if (confirm("Verra' stampato lo scontrino. Sei sicuro?")) {
		Ab.popUp("ELAB_SC");
		f.cmd.value = "print";
		f.act.value = "ristampaScontrino";
		f.action = f.actionPage.value;
		Ab.submitAj('main');
	}
}


function saveScontrino() {
	//checkBoxes();
	var f = document.main;

	if (f.totDocumento.value == "0,00")
		alert("ATTENZIONE! Scontrino a valore zero");
	else
	if (flgEmettiFatturaScontrino.value > 0)
		alert('ATTENZIONE! Stai emettendo una fattura. Non puoi stampare lo scontrino');
	else if (confirm("Verra' stampato lo scontrino. Sei sicuro?")) {
		Ab.popUp("ELAB_SC");
		f.cmd.value = "print";
		f.act.value = "stampaScontrinoESalva";
		f.action = f.actionPage.value;
		Ab.submitAj('main');
	}
}

function chiudiScontrino() {
	//checkBoxes();
	var f = document.main;
	//if(f.totDocumento.value=="0,00")
	//	alert("ATTENZIONE! Scontrino a valore zero");
	//else
	if (flgEmettiFatturaScontrino.value > 0)
		alert('ATTENZIONE! Stai emettendo una fattura. Non puoi chiudere lo scontrino');
	else if (confirm("Lo scontrino verra' chiuso. Sei sicuro?")) {
		Ab.popUp("ELAB_SC");
		f.cmd.value = "print";
		f.act.value = "chiudiScontrinoESalva";
		f.action = f.actionPage.value;
		Ab.submitAj('main');
	}
}

///////////////////////////////////
//dallo scontrino genero il documento secondario
///////////////////////////////////
function generaDocumentoDaScontrino() {
	var f = document.main;
	if (f.flgEmettiFatturaScontrino.value == "")
		alert("Seleziona il tipo di documento da generare");
	else if (f.id_cliforListino.value == "" || f.id_cliforListino.value == "0")
		alert("Seleziona un cliente per poter generare un documento")
	else {
		if (confirm("Verra' generato il documento relativo. Sei sicuro?")) {
			if (checkFields()) {
				//checkBoxes();

				f.cmd.value = "generaDocumentoDaScontrino";
				f.action = f.actionPage.value;
				Ab.submitAj('main');
				//	Ab.submitAj('main');
			}
		}
	}
}

function generaDocumento() {
	var f = document.main;
	if (f.flgEmettiFatturaScontrino.value == "")
		alert("Seleziona il tipo di documento da generare");
	else if (f.id_clifor2.value == "" || f.id_clifor2.value == "0")
		alert("Seleziona un cliente per poter generare un documento")
	else {
		if (confirm("Verra' generato il documento relativo. Sei sicuro?")) {
			if (checkFields()) {
				//checkBoxes();

				f.cmd.value = "generaDocumentoDaScontrino";
				f.action = f.actionPage.value;
				Ab.submitAj('main');
			}
		}
	}
}

function printCommand() {
	var f = document.main;
	//stampaDocumento(f.id_documento.value);
	stampaDocumento($("#id_documento").val());
}

function stampaDocumento(id) {
	//swal(id);

	if (id != 0) {
		var f = document.main;
		if (f.flgTipoStampa.value == 10) {
			f.cmd.value = "print";
			f.act.value = "doc";
			f.action = f.actionPage.value + ".pdf";
			Ab.submitAj('main');
		} else {
			var debug = false;
			var wwD = "700";
			var whD = "500";
			//+"&xxx="+f.xxx.value
			theAction = f.actionPage.value + ".pdf?cmd=print&act=doc" + "&id_documento=" + id;
			//
			//var numLabels=prompt("Numero di etichette da stampare","1");	
			if (debug == false) {
				window.open(theAction, "Stampa_Fattura", "width=" + wwD + ",height=" + whD + ",status=no,resizable=yes,top=100,left=100,scrollbars=yes");
			} else {
				window.open(theAction);
			}
		}

	}

}

function prelevaArticolo(id) {

	var f = document.main;
	f.action = f.actionPage.value;
	f.cmd.value = "gr";
	f.act.value = "prelevaArticolo";
	f.id_rigaDocumentoDaPrelevare.value = id;
	var qdp = document.getElementById('qtaDaPrelevare_' + id);
	var qdpMax = document.getElementById('qtaDaPrelevareMax_' + id);
	var qdpVal = parseFloat(qdp.value);
	var qdpMaxVal = parseFloat(qdpMax.value);

	if (qdpVal > qdpMaxVal)
		alert("ERRORE! Non puoi prelevare piu' di quanto hai caricato");
	else if (qdpVal <= 0)
		alert("ERRORE! Quantita' non valida!")
	else {
		f.qtaDaPrelevare.value = qdp.value;
		Ab.submitAj('main');
		//	Ab.submitAj('main');
	}
}


function delArticoloPrelevato(id_rd, id_rdP) {
	if (confirm("Sei Sicuro?")) {
		var f = document.main;
		f.action = f.actionPage.value;
		f.cmd.value = "gr";
		f.act.value = "delPrelevaArticolo";
		f.id_rigaDocumento.value = id_rd;
		f.id_rigaDocumentoPrelevata.value = id_rdP;
		Ab.submitAj('main');
		//	Ab.submitAj('main');
	}

}

function impostaRigaChiusa(l_id) {
	if (confirm("La riga verra' chiusa. Sei Sicuro?")) {
		var f = document.main;
		//checkBoxes();
		f.action = f.actionPage.value;
		//	FACCIO IL SUBMIT
		f.cmd.value = "gr";
		f.act.value = "chiudiRigaArticolo";
		f.id_rigaDocumento.value = l_id;
		//f.flgCaricaArticoli.value=1;
		Ab.submitAj('main');
	}

}

function impostaRigaAperta(l_id) {
	if (confirm("La riga verra' aperta nuovamente. Sei Sicuro?")) {
		var f = document.main;
		//checkBoxes();
		f.action = f.actionPage.value;
		//	FACCIO IL SUBMIT
		f.cmd.value = "gr";
		f.act.value = "apriRigaArticolo";
		f.id_rigaDocumento.value = l_id;
		//f.flgCaricaArticoli.value=1;
		Ab.submitAj('main');
	}

}

function filtraRighe() {
	var f = document.main;
	f.action = f.actionPage.value;
	f.cmd.value = "md";
	f.pageNumber_righe.value = 1;
	Ab.submitAj('main');
}

function filtraRigheSeriali() {
	var f = document.main;
	f.action = f.actionPage.value;
	f.cmd.value = "md";
	f.pageNumber_righe.value = 1;
	f.searchRighe.value = $("#searchRigheSeriali").val();
	Ab.submitAj('main');
}

function mailCommandOld() {
	//FACCIO IL SUBMIT
	if (confirm("Vuoi mandare il documento via email?")) {
		var f = document.main;
		f.action = f.actionPage.value;
		f.eMailInvio.value = prompt("Inserisci l'indirizzo di posta elettronica", f.eMailInvio.value);
		//alert('pio_'+f.eMail.value);
		if (f.eMailInvio.value != 'null') {
			//Ab.popUp("ELAB");
			f.cmd.value = "mail";
			Ab.submitAj('main');
		}
	}
}


function mailCommandCR() {
	//FACCIO IL SUBMIT
	if (confirm("Vuoi mandare i documenti selezionati via email?")) {
		var f = document.main;
		f.action = f.actionPage.value;
		f.eMailInvio.value = prompt("Inserisci l'indirizzo di posta elettronica", f.eMailInvio.value);
		//alert('pio_'+f.eMail.value);
		if (f.eMailInvio.value != 'null') {
			//Ab.popUp("ELAB");
			f.cmd.value = "mail";
			Ab.submitAj('main');
		}
	}
}

/************************************************/
/************************************************/
/* DALLA MASCHERA DI RICERCA IMPOSTA IL DOCUMENTO A PAGATO */
/************************************************/
/************************************************/
function documentoPagato(id) {

	var f = document.main;
	//	if( Ab.validateForm2('main','dataFatturazione','Data Fatturazione','R'))
	{
		if (confirm("Vuoi rendere il documento pagato?"))

		{
			checkRadioCR();
			f.action = f.actionPage.value;
			f.cmd.value = "docPagato";
			//f.act.value="view";
			f.id_documento.value = id;
			Ab.submitAj('main');
		}
	}
}
/////////////////////////////////////////////////
//////////////////////////////////////////////////
function refreshIvaByreparto()
/////////////////////////////////////////////
{

	var f = document.main;
	var l_id_iva = Ab.prendiElementoDaId('id_reparto_' + f.id_reparto.value).value;
	f.id_iva.value = l_id_iva;

}


function labelAccD() {
	var f = document.main;

	{
		var debug = false;
		var wwD = "700";
		var whD = "500";

		//+"&xxx="+f.xxx.value
		theAction = f.actionPage.value + "?cmd=print&act=lblArtAcc" + "&id_documento=" + f.id_documento.value;

		//
		//var numLabels=prompt("Numero di etichette da stampare","1");
		var blankLabels = prompt("Numero di etichette da saltare", "0");
		theAction = theAction + "&blankLabels=" + blankLabels; //+"&numLabels="+numLabels;
		if (debug == false) {
			window.open(theAction, "Stampa_Etichette_Accessori_Articolo", "width=" + wwD + ",height=" + whD + ",status=no,resizable=yes,top=100,left=100,scrollbars=yes");
		} else {
			window.open(theAction);
		}

	}

}

function refreshDocumento() {

	var l_flgPagamentoDataFissa = Ab.prendiElementoDaId("flgPagamentoDataFissa");
	var l_tipoPagamento = Ab.prendiElementoDaId("id_tipoPagamento");
	var l_dataScadenzaPagamento = Ab.prendiElementoDaId("dataScadenzaPagamento");
	//var l_dataScadenzaPagamentoDP=Ab.prendiElementoDaId("dataScadenzaPagamentoDP");

	var f = document.main;
	if (l_flgPagamentoDataFissa.value > 0) {
		l_tipoPagamento.disabled = "disabled";
		l_tipoPagamento.value = "";
		l_dataScadenzaPagamento.disabled = "";
		//l_dataScadenzaPagamentoDP.style.display="inline";	
	} else {
		l_tipoPagamento.disabled = "";
		l_dataScadenzaPagamento.value = "";
		l_dataScadenzaPagamento.disabled = "disabled";
		//l_dataScadenzaPagamentoDP.style.display="none";
	}

}

function reso() {
	var f = document.main;
	f.flgInserisciReso.value = 1;
	refresh();

}

function cassa() {
	var f = document.main;
	f.flgInserisciReso.value = 0;
	refresh();


}

function refreshResto() {
	var f = document.main;
	var contantiF = f.contanti.value;
	var totDocN = stringToNumber(f.totDocumento.value);
	var accontoN = stringToNumber(f.acconto.value);

	var contantiN = stringToNumber(contantiF); {
		if (contantiN == 0 || contantiN == "" || isNaN(contantiN) || contantiN == "" || isNaN(totDocN)) {
			f.resto.value = "";

		} else {

			f.resto.value = formatNumb(-(totDocN - accontoN - contantiN), 2);
		}

	}

}

function hideCr() {
	//var theImgDown = document.getElementById("imgDown").style;
	//	theImgDown.display = "block"; 
	/*var theNoCrStyl = document.getElementById("NOCR").style;
		theNoCrStyl.display = "block"; 
	var theCrStyl = document.getElementById("CR").style;
		theCrStyl.display = "none"; */


}

function showCr() {
	/*	var theNoCrStyl = document.getElementById("NOCR").style;
		theNoCrStyl.display = "none"; 
		var theCrStyl = document.getElementById("CR").style;
		theCrStyl.display = "block"; 
*/

}

function creaCodaSms() {
	//FACCIO IL SUBMIT
	if (confirm("ATTENZIONE!! Verra' creato un messaggio sms per ogni articolo sugli scontrini secondo il criterio di ricerca impostato basandosi sul numero seriale come numero di telefono. Vuoi continuare?")) {
		var f = document.main;
		if (f.testoMessaggio.value == "")
			alert("ERRORE! Testo del messaggio vuoto");
		else {
			//alert(f.testoMessaggio.value);
			//f.flgReport.value="S";
			//f.action=webApp+"/tr/Pratica.abl";
			f.action = f.actionPage.value;
			f.cmd.value = "creaCodaSms";
			Ab.submitAj('main');
		}
	}
}
/////////////////////////////////////////////////
//////////////////////////////////////////////////
function addAllegato()
/////////////////////////////////////////////
{

	var f = document.main;
	f.action = f.actionPage.value;
	if (Ab.validateForm('nomeFile', 'Nome File', 'R')) {
		//checkBoxes();
		f.cmd.value = "gr";
		f.act.value = "addAllegato";
		Ab.submitAj('main');
	}
}

function delAllegato(l_id)
/////////////////////////////////////////////
{
	if (Ab.confirmDelete()) {
		var f = document.main;
		f.action = f.actionPage.value;
		//	FACCIO IL SUBMIT
		f.cmd.value = "gr";
		f.act.value = "delAllegato";
		f.id_allegatoDocumento.value = l_id;
		Ab.submitAj('main');
	}

}

function costoView() {
	var f = document.main;
	if (f.id_articolo.value == 0 || f.id_articolo.value == "")
		swal("Errore", "Seleziona un articolo!", "error");
	else {
		//alert("Ultimo Prezzo Acquisto con iva: "+f.costoUltimo.value);


		swal("Ultimo prezzo acquisto", "Ultimo Prezzo Acquisto con iva: " + f.costoUltimo.value);


		//modalWin=dhtmlwindow.open('modalW', 'div', 'ultimoCosto', "Ultimo prezzo di acquisto", 'width=220px,height=10px,left=400px,top=250px,resize=0,scrolling=0');
	}

}

function applicaListino() {
	var f = document.main;
	//if(f.id_cliforListino.value==0 || f.id_cliforListino.value=="")
	//	alert("Seleziona un Cliente per applicare un listino!")
	//else
	{


		{
			//if (checkFields())
			{

				//checkBoxes();
				checkRadio();
				f.action = f.actionPage.value;
				f.cmd.value = "applicaListino";
				f.prtCommand.value = 0;
				Ab.submitAj('main');
				//	Ab.submitAj('main');
			}
		}
	}

}

function applicaListinoDoc() {
	var f = document.main;


	//if(f.id_cliforListino.value==0 || f.id_cliforListino.value=="")
	//	alert("Seleziona un Cliente per applicare un listino!")
	//else
	{


		{
			if (checkFields()) {
				f.cmd.value = "applicaListinoDoc";
				//checkBoxes();
				checkRadio();
				f.action = f.actionPage.value;

				f.prtCommand.value = 0;
				Ab.submitAj('main');
			}
		}
	}

}

function aggiungiSeriale() {
	var f = document.main;
	f.action = f.actionPage.value;
	if (f.serialeS.value == "")
		alert('Inserire un seriale valido');
	else {
		//checkBoxes();
		checkRadio();
		f.cmd.value = "gr";
		f.act.value = "addSeriale";
		//f.flgCaricaArticoli.value=1;
		//Ab.popUp("ELAB");
		Ab.submitAj('main');
	}




}

function mailCommand() {
	// var f = document.main;
	// stampaDocumento(f.id_servizioStd.value, 'docFor');


	//modalWin=dhtmlwindow.open('modalW', 'div', 'mail', "Email Fattura ", 'width=410px,height=160px,left=400px,top=250px,resize=0,scrolling=0');

	$("#mail").dialog("open");

}

function mailCommandCliFor() {

	var f = document.main;
	f.cmd.value = "mail";
	f.act.value = "clifor"
	f.action = f.actionPage.value;

	//Ab.popUp('ELAB')
	Ab.submitAj('main');

}

function mailCommandExt() {
	var f = document.main;
	f.cmd.value = "mail";
	f.act.value = "ext"
		//email invi
	var m = document.divMail.eMailInvioDiv.value;
	var testoAgg = document.divMail.testoAggD.value;
	f.eMailInvio.value = m;
	f.testoAgg.value = testoAgg;
	f.action = f.actionPage.value;

	//Ab.popUp('ELAB')
	Ab.submitAj('main');
}

function mailCommandWeb() {
	//FACCIO IL SUBMIT
	if (confirm("Vuoi mandare l'ordine web via email?")) {
		var f = document.main;
		f.action = f.actionPage.value;
		//Ab.popUp("ELAB");
		f.cmd.value = "mail";
		f.act.value = "web"
		Ab.submitAj('main');
	}
}

function printScontrinoNF() {
	//checkBoxes();
	var f = document.main;
	f.action = f.actionPage.value;
	/*if(f.totDocumento.value=="0,00")
		alert("ATTENZIONE! Scontrino a valore zero");
	else
	{
		Ab.popUp("ELAB_SC");
		f.cmd.value="print";
		f.act.value="stampaScontrinoNonFiscale";
		f.action=f.actionPage.value;
			Ab.submitAj('main');
	}
	*/

	//alert(f.id_oper.value);

	theSvlt = "Documento.abl?cmd=print&act=stampaScontrinoNonFiscale&id_documento=" + f.id_documento.value + "&id_oper=" + f.id_oper.value;
	sendAjaxGet2(theSvlt, "messaggi");

	//f.operatore.style="display:none";

}

function printReportF() {
	//checkBoxes();
	var f = document.main;
	f.action = f.actionPage.value;
	if (confirm("Vuoi stampare il report finanziario?")) {
		/*		Ab.popUp("ELAB_SC");
				f.cmd.value="print";
				f.act.value="stampaReportFinanziario";
				f.action=f.actionPage.value;
					Ab.submitAj('main');  */

		theSvlt = "Documento.abl?cmd=print&act=stampaReportFinanziario&id_documento=" + f.id_documento.value;
		sendAjaxGet2(theSvlt, "messaggi");

	}
}

function printReportG() {
	//checkBoxes();
	var f = document.main;
	f.action = f.actionPage.value;
	if (confirm("Vuoi stampare il report giornaliero? N.B. non sara' piu' possibile stampare il report finanziario.")) {
		/*		Ab.popUp("ELAB_SC");
				f.cmd.value="print";
				f.act.value="stampaReportGiornaliero";
				f.action=f.actionPage.value;
					Ab.submitAj('main');
		*/

		theSvlt = "Documento.abl?cmd=print&act=stampaReportGiornaliero&id_documento=" + f.id_documento.value;
		sendAjaxGet2(theSvlt, "messaggi");
	}
}

function cassaAdmin() {
	//var f = document.main;
	// stampaDocumento(f.id_servizioStd.value, 'docFor');
	//	modalWin=dhtmlwindow.open('modalW', 'div', 'cassaAdmin', "Admin Cassa ", 'width=410px,height=160px,left=400px,top=250px,resize=0,scrolling=0');

	// $( "#cassaAdmin" ).dialog( "open" );

	$('#modalReport').modal('show');
}

function modifyClifor() {
	//FACCIO IL SUBMIT
	var f = document.main;
	f.action = "../anag/Cliente.abl";
	f.cmd.value = "md";
	f.id_clifor.value = f.id_cliforListino.value;
	Ab.submitAj('main');
}

function operatoreESalva(tipoScontrino) {
	//var f = document.operatore;
	if (tipoScontrino == 1 && $("#totDocumento").val() == "0,00")
		alert("ATTENZIONE! Scontrino a valore zero");
	else {
		//scrivo il tipo scontrino passato dalla funzione specifica nel campo nascosto della form operatore
		//f.tipoScontrino.value = tipoScontrino;

		/*modalWin=dhtmlwindow.open('modalW', 'div', 'operatore', "Selezione Operatore", 				'width=410px,height=160px,left=400px,top=250px,resize=0,scrolling=0');		*/

		$("#operatore").dialog("open");
		//passo il parametro alla div
		$("#tipoScontrino").val(tipoScontrino);
	}
}

/////////////////////////////////////////
//in realtà fa molti di più
// stampo scontrino oppure genero documento da scontrino)
//
function stampa() {
	var f = document.main;
	var op = document.opera;

	//scrivo l'operatore selezionato dalla combo nel campo nascosto della form dettaglio
	f.id_oper.value = op.id_operatore.value;

	//in base al tipo scontrino richiamo la funzione di stampa
	if (op.tipoScontrino.value == 1)
		saveScontrino();
	else if (op.tipoScontrino.value == 2)
		printScontrinoNF();
	else if (op.tipoScontrino.value == 3)
		chiudiScontrino();
	else if (op.tipoScontrino.value == 4)
		generaDocumentoDaScontrino();
}

function apriCassa() {
	theSvlt = "Documento.abl?cmd=print&act=apriCassa";
	sendAjaxGet2(theSvlt, "messaggi");
}

function ristampaScontrini() {
	var f = document.main;
	if (confirm("Vuoi ristampare gli scontrini in lista?")) {
		//Ab.popUp("ELAB_SC");
		f.cmd.value = "print";
		f.act.value = "ristampaListaScontrini";
		f.action = f.actionPage.value;
		Ab.submitAj('main');
	}
}

function inserisciBarcode() {
	if (event.keyCode == 13) {
		if ($("#tipoScontrino").val() == 1 && $("#totDocumento").val() == "0,00")
			alert("ATTENZIONE! Scontrino a valore zero");
		else {
			stampa();
			$("#operatore").dialog("close");
		}
	}
}

function prenotazioni() {
	var f = document.main;
	$("#jQueryWIN").dialog("option", "title", "Lista Prenotazioni");
	//	$( "#jQueryWIN" ).dialog("option", "width", 1000);
	//	$( "#jQueryWIN" ).dialog("option", "height", 400);
	$("#jQueryWIN").load(f.actionPage.value + "?cmd=listaPrenotazioni");
	$("#jQueryWIN").dialog("open");

}

function annullaAssegnazionePrenotazione(id) {
	if (confirm("La prenotazione risulterà nuovamente ancora in arrivo. Vuoi Continuare?")) {
		var f = document.main;
		f.action = f.actionPage.value;
		//alert(f.action);
		f.cmd.value = "annAssPren";
		f.act.value = "";
		f.id_rigaDocumento.value = id;
		Ab.submitAj('main');
	}


}

function annullaSlip(id) {
	if (confirm("La slip potrà essere stampata nuovamente. Vuoi continuare?")) {
		var f = document.main;
		f.action = f.actionPage.value;
		//alert(f.action);
		f.cmd.value = "annullaSlip";
		f.act.value = "";
		f.id_rigaDocumento.value = id;
		Ab.submitAj('main');
	}


}

function listaFigli(l_id_riga) {
	var f = document.main;
	$("#jQueryWIN").dialog("option", "title", "Lista Documenti Figli");
	//	$( "#jQueryWIN" ).dialog("option", "width", 500);
	//	$( "#jQueryWIN" ).dialog("option", "height", 200);
	$("#jQueryWIN").load(f.actionPage.value + "?cmd=listaFigli&id_rigaDocumento=" + l_id_riga);
	$("#jQueryWIN").dialog("open");
}

function listaFigliOrdine(l_id_riga) {
	var f = document.main;
	$("#jQueryWIN").dialog("option", "title", "Lista Documenti di Prelievo");
	//	$( "#jQueryWIN" ).dialog("option", "width", 500);
	//	$( "#jQueryWIN" ).dialog("option", "height", 200);
	$("#jQueryWIN").load(f.actionPage.value + "?cmd=listaFigliOrdine&id_rigaDocumento=" + l_id_riga);
	$("#jQueryWIN").dialog("open");
}

function listaPadriOrdine(l_id_riga) {
	var f = document.main;
	$("#jQueryWIN").dialog("option", "title", "Lista Documenti da cui hai Prelevato");
	//	$( "#jQueryWIN" ).dialog("option", "width", 500);
	//	$( "#jQueryWIN" ).dialog("option", "height", 200);
	$("#jQueryWIN").load(f.actionPage.value + "?cmd=listaPadriOrdine&id_rigaDocumento=" + l_id_riga);
	$("#jQueryWIN").dialog("open");
}

function cancAcconto() {
	var f = document.main;
	f.acconto.value = "0,00";
}

function inserisciContanti(id) {
	var cont = document.main.contanti.value;
	//cont = formatNumber(2, cont);	

	var num = stringToNumber(cont);

	if (num == NaN) {
		cont = id;
	} else {
		cont += id;
	}
	document.main.contanti.value = cont;

	//alert('Num: '+num+' Cont: '+cont);
}

function apriReport() {
	$("#selReport").dialog("open");
}

/*
document.onkeydown = keyDown
function keyDown(e){ 
msg="Hai premuto invio" 
if (document.getElementById&&!document.all){ 
if(e.which == 13){ 
alert (msg) 
} 
} 
if (document.all){ 
if(event.keyCode == 13){ 
alert (msg) 
} 
} 
} 
*/

//////////////////////////////////////////////////
function addAgente()
/////////////////////////////////////////////
{

	var f = document.main;
	f.action = f.actionPage.value;
	if (Ab.validateForm('id_agente', 'Agente', 'RisNumKey', 'percDocumentoAgente', 'Percentuale Agente', 'RisNUm>0')) {
		f.cmd.value = "addAgente";
		f.act.value = "";
		Ab.submitAj('main');
	}
}

function delAgente(l_id)
/////////////////////////////////////////////
{
	Ab.confirmDelete4(function () {
		var f = document.main;
		f.action = f.actionPage.value;
		//	FACCIO IL SUBMIT
		f.cmd.value = "delAgente";
		f.act.value = "";
		f.id_documentoAgente.value = l_id;

		Ab.submitAj('main');
	});



}

function delProgettista(l_id)
/////////////////////////////////////////////
{
	Ab.confirmDelete4(function () {
		var f = document.main;
		f.action = f.actionPage.value;
		//	FACCIO IL SUBMIT
		f.cmd.value = "delProgettista";
		f.act.value = "";
		f.id_rigaDocumentoProgettista.value = l_id;

		Ab.submitAj('main');
	});



}

function modRigaArticoloSeriale(l_id)
/////////////////////////////////////////////
{

	var f = document.main;
	//checkBoxes();
	f.action = f.actionPage.value + "#RIGHE";
	//	FACCIO IL SUBMIT
	f.cmd.value = "gr";
	f.act.value = "modRigaArticolo";
	f.id_rigaDocumento.value = l_id;
	//f.flgCaricaArticoli.value=1;
	Ab.submitAj('main');

}

function riordinoCR(l_id_articolo, l_id_rigaDocumento)
/////////////////////////////////////////////
{
	var f = document.main;

	if (l_id_articolo == 0) {
		alert("ERRORE! Articolo non valido!");
		return;
	}
	//apro la finestra che mi permette di scegliere il fornitore ed
	//eventualmente la variante
	//modalW=dhtmlwindow.open('modalW', 'ajax', 'Articolo.abl?cmd=riordinoS', 'Riordino articolo', 'width=650px,height=300px,left=300px,top=100px,resize=1,scrolling=1'); 
	modalW("Riordino articolo", webApp + "/admin/art/Articolo.abl?cmd=riordinoS&id_articolo=" + l_id_articolo + "&id_rigaDocumento=" + l_id_rigaDocumento, 650, 300);
}

function riordino()
/////////////////////////////////////////////
{
	//chiamata da finestra su articoloCR
	var f = document.main;

	var flgUsaVarianti = document.getElementById('flgUsaVarianti');
	var id_articolo = document.getElementById('id_articoloRA');
	var clifor = document.getElementById('id_cliforRA');
	var qta = document.getElementById('qtaDaRiordinare');
	var id_rigaDocumentoRA = document.getElementById('id_rigaDocumentoRA');
	if (flgUsaVarianti.value == 0) {
		//articolo			

		if (clifor.value == "0" || clifor.value == "" || id_articolo == 0 || qta.value <= 0) {
			alert("ERRORE! Fornitore, articolo o quantita' non validi!");
			return;
		}
		if (confirm("Verra' creato un ordine per l'articolo. Sei Sicuro")) {
			f.id_cliforR.value = clifor.value;
			f.id_rigaDocumentoR.value = id_rigaDocumentoRA.value;
			f.qtaR.value = qta.value;
			f.id_articoloR.value = id_articolo.value;
			f.cmd.value = "riordinaCR";
			f.act.value = "";
			//f.cmd.value="md";
			//f.act.value="refreshRivalutazione";
			f.action = f.actionPage.value;
			Ab.submitAj('main');
		}
	} else {
		//articolo		variante	
		//alert(qta);
		if (clifor.value == "0" || clifor.value == "" || id_articolo == 0 || qta <= 0) {
			alert("ERRORE! Fornitore, articolo o quantita' non validi!");
			return;
		}
		if (confirm("Verra' creato un ordine per gli articoli variante. Sei Sicuro")) {
			f.id_cliforR.value = clifor.value;
			f.id_rigaDocumentoR.value = id_rigaDocumentoRA.value;
			f.qtaArticoloVarianteRV.value = getQtaVariantiRiordino();
			f.id_articoloVarianteRV.value = getIdVariantiRiordino();
			f.cmd.value = "riordinaAVCR";
			f.act.value = "";
			//f.cmd.value="md";
			//f.act.value="refreshRivalutazione";
			f.action = f.actionPage.value;
			Ab.submitAj('main');
		}
	}
}

function getQtaTotVariantiRiordino() {
	var ogg_p = document.getElementsByTagName("input");
	var tot = 0;

	for (var i = 0; i < ogg_p.length; i++) {

		if (ogg_p[i].name.indexOf('qtaDaRiordinare_') == 0 && ogg_p[i].value != "") {
			//alert(ogg_p[i].value);
			tot += parseFloat(ogg_p[i].value.replace(',', '.'));
			//alert("tag qt: id="+ogg_p[i].id+" "+ ogg_p[i].value+" tot:"+tot);		
		}
	}
	return tot;
}

function getIdVariantiRiordino() {
	var ogg_p = document.getElementsByTagName("input");
	var varianti = "";
	var str = "";

	for (var i = 0; i < ogg_p.length; i++) {

		//if(ogg_p[i].name.indexOf('qt_') == 0 && ogg_p[i].value != "")
		if (ogg_p[i].name.indexOf('qtaDaRiordinare_') == 0 && ogg_p[i].value != "") {
			str = ogg_p[i].name

			if (varianti != "")
				varianti += ";"
			varianti += str.substring(16, str.length);

			//alert("tag qt: id="+ogg_p[i].id+" "+ ogg_p[i].value+" tot:"+tot);		
		}
	}

	return varianti;
}

function getQtaVariantiRiordino() {
	var ogg_p = document.getElementsByTagName("input");
	var qta = "";

	for (var i = 0; i < ogg_p.length; i++) {

		//if(ogg_p[i].name.indexOf('qt_') == 0 && ogg_p[i].value != "")
		if (ogg_p[i].name.indexOf('qtaDaRiordinare_') == 0 && ogg_p[i].value != "") {
			if (qta != "")
				qta += ";"
			qta += ogg_p[i].value;
		}
	}

	return qta;
}

function riordinoD() {
	var f = document.main;

	if (confirm('Vuoi creare gli ordini relativi a tutti gli articoli del documento?')) {
		f.cmd.value = "riordinaPrenotazione";
		f.act.value = "";
		f.action = f.actionPage.value;
		Ab.submitAj('main');
	}
}

/*
lista degli ordini generati dalla prenotazione
vado a leggere riga_documento_p_m
*/
function listaOrdiniPrenotazione(l_id_riga) {
	var f = document.main;
	$("#jQueryWIN").dialog("option", "title", "Lista Ordini Prenotazioni");
	//	$( "#jQueryWIN" ).dialog("option", "width", 500);
	//	$( "#jQueryWIN" ).dialog("option", "height", 200);
	$("#jQueryWIN").load(f.actionPage.value + "?cmd=listaOrdiniPrenotazione&id_rigaDocumento=" + l_id_riga);
	$("#jQueryWIN").dialog("open");
}


function caricaDisponibilitaToSeriale() {
	$("#seriale").focus();
}


//********************************************************
//********************************************************
// RICHIAMATO SUBITO DOPO LA RICERCA DELL'ARTICOLO
//GESTISCE UNITA' DI MISURA E AUTOADD
//********************************************************
//********************************************************
function afterSearchArt() {
	attdis();
	autoAdd();

}

//********************************************************
//********************************************************
// serve per visualizzare le unità di misura in base alla tipologia di articolo
// controlla anche l'autoadd.
//viene chiamato dopo la ricerca dell'articolo
//********************************************************
//********************************************************
function attdis() {

	var nHid = 0;
	if ($("#flgKg").val() == 0) {
		$("#lbl_kg").css("visibility", "hidden");
		$("#kg").css("visibility", "hidden");

		$(".kg").hide();

		nHid++;
	} else {
		$("#lbl_kg").css("visibility", "visible");
		$("#kg").css("visibility", "visible");

		$(".kg").show();
	}
	if ($("#flgMt").val() == 0) {
		$("#lbl_mt").css("visibility", "hidden");
		$("#mt").css("visibility", "hidden");

		$(".mt").hide();

		nHid++;
	} else {
		$("#lbl_mt").css("visibility", "visible");
		$("#mt").css("visibility", "visible");

		$(".mt").show();
	}
	if ($("#flgNr").val() == 0) {
		$("#lbl_nr").css("visibility", "hidden");
		$("#nr").css("visibility", "hidden");

		$(".nr").hide();

		nHid++;
	} else {
		$("#lbl_nr").css("visibility", "visible");
		$("#nr").css("visibility", "visible");

		$(".nr").show();
	}
	//se sono tutti nascosti rendo visibile nr
	if (nHid == 3) {
		$("#lbl_nr").css("visibility", "visible");
		$("#nr").css("visibility", "visible");

		$(".nr").show();
	}
	//
	//gestione focus
	//alert($("#flgTipoMagazzinoFisico").val());
	//alert($("#tipoCaricoScarico").val());
/*	if ($("#flgTipoMagazzinoFisico").val() == 0) {
		//magazzino normale

		// faccio il focus sul campo in base al tipo
		//DA CAPIRE!!!!!!!!1
		if ($("#tipoCaricoScarico").val() == 0) {
			$("#descrizioneRiga").focus();
		} else {
			//descrizioneRiga non c'è più
			//Ab.setFocus("nr");
			Ab.setFocus("descrizioneRiga");
			//$("#nr").focus();
		}
	} else {
		Ab.setFocus("nr");
		//$("#nr").focus();
	}*/



}

/************************************************************/
/************************************************************/
/* AUTO ADD*/
/************************************************************/
/************************************************************/
function autoAdd() {
	//AUTO ADD
	//Ab.debug ("attdis ");
	//checkBoxes();
	if ($("#id_articolo").val() > 0 && $("#descrizioneRiga").val() != "" && $("#flgAutoAdd").val() == 1) {

		addRigaArticolo();
	} else {
		//se non  bolla fattura o nc allora il seriale non lo chiedo (es. ordine)flgTipologia!=3
		//dovrei verificare getTipoCaricoScarico=0-- anagrafiche chiedo seriale tipoCaricoScarico==0 
		if ($("#flgUsaSeriale").val() == 1 && $("#flgTipologia").val() != 3) {
			$("#descrizioneRiga").select();
			//Ab.prendiElementoDaId('descrizioneRiga').select();
			beep();
		} else {
			//Ab.prendiElementoDaId('quantita').focus() ;
		}
	}

}



/************************************************************/
/************************************************************/
/* QUESTO DIPENDE DALLE TIPOLOGIE DI ARTICOLO, FILATO O TESSUT*/
/************************************************************/
/************************************************************/

function documentReadyScript() {
	attdis();
	//per default nr è visibile per permettere
	//l'inserimento di articoli NON in magazzino
	$("#lbl_nr").css("visibility", "visible");
	$("#nr").css("visibility", "visible");
	//focus al caricamento della pagina
	//alert($("#currentFocus").val() );
	if ($("#currentFocus").val() == "") {
		//Ab.setFocus("descrizioneRiga");
		//$("#descrizioneRiga").focus();
	} else {
		Ab.setFocus($("#currentFocus").val());
	}

}

////////////////////////////////////
// dammiNextFocusQta()
// Utilizzato per gestire il focus in 
// base a kg mt e nr
////////////////////////////////////
function dammiNextFocusQta() {
	//(bean.isCaricoConIva()?"prezzoPubblicoConIva":"imponibile"	
	if ($(this).attr("id") == "kg") {
		if ($("#flgMt").val() == 1) {
			return "mt";
		}
		if ($("#flgNr").val() == 1) {
			return "nr";
		}
		if ($("#isCaricoIva").bool()) {
			return "prezzoPubblicoConIva";
		} else {
			return "imponibile";
		}
	}
	if ($(this).attr("id") == "mt") {
		if ($("#flgNr").val() == 1) {
			return "nr";
		}
		if ($("#isCaricoIva").bool()) {
			return "prezzoPubblicoConIva";
		} else {
			return "imponibile";
		}
	}
}



////////////////////////////////////
// descRigaKeyUp(theEvent)()
// mi determina il focus dopo descrizione riga
// deve andare sulla qta giusta. Si attiva dopo il CR
////////////////////////////////////
function descRigaKeyUp(theEvent) {
	//se non  bolla fattura o nc allora il seriale non lo chiedo (es. ordine)flgTipologia!=3
	////dovrei verificare getTipoCaricoScarico=0-- anagrafiche chiedo seriale
	//se sto caricando (anagrafiche) devo fare
	//il controllo per immettere il seriale
	if (document.main.flgUsaSeriale.value == 1 && document.main.flgTipologia.value != 3) {
		Ab.focusNextOnCr(theEvent, 'seriale');
		beep();
	} else {
		if ($("#flgKg").val() == 1) {
			Ab.focusNextOnCr(theEvent, 'kg');
		} else if ($("#flgMt").val() == 1) {
			Ab.focusNextOnCr(theEvent, 'mt');
		} else if ($("#flgNr").val() == 1) {
			Ab.focusNextOnCr(theEvent, 'nr');
		}
	}
}

////////////////////////////////////
// determina che succede quando arriva il focus su seriale
//posso 1. selezionare il seriale
// 2. fare l'add articolo automatico su c'è autoadd
//3. vado sulla quantita giusta
// deve andare sulla qta giusta. Si attiva dopo il CR
////////////////////////////////////
function onFocusSeriale(theEvent) { //alert('ofs');
	//se non  bolla fattura o nc allora il seriale non lo chiedo (es. ordine)flgTipologia!=3
	////dovrei verificare getTipoCaricoScarico=0-- anagrafiche chiedo seriale
	if (document.main.flgUsaSeriale.value == 1 && document.main.flgTipologia.value != 3) {
		console.log("onFocusSeriale: usa seriale beep")
		Ab.prendiElementoDaId('seriale').select();
		beep();
	} else {
		//checkBoxes();
		if ($("#seriale").val() != "" && $("#flgAutoAdd").val() == 1) {
			console.log("onFocusSeriale: addriga");
			addRigaArticolo();
		} else {
			console.log("onFocusSeriale: focus " + $("#flgNr").val());
			if ($("#flgKg").val() == 1) {
				Ab.setFocus('kg');
			} else if ($("#flgMt").val() == 1) {
				Ab.setFocus('mt');
			} else if ($("#flgNr").val() == 1) {
				console.log("onFocusSeriale: focus nr");
				Ab.setFocus('nr');
			}
		}
	}

}

////////////////////////////////////
// mi determina il focus dopo seriale
// deve andare sulla qta giusta. Si attiva dopo il CR
////////////////////////////////////
function onKeyUpSeriale(theEvent) {
	console.log("onKeyUpSeriale" + $("#flgNr").val());

	var keyCode = theEvent.keyCode;
	if (keyCode == 13) {
		//checkBoxes();
		if ($("#flgAutoAdd").val() == 1) {
			addRigaArticolo();
		} else {
			if ($("#flgKg").val() == 1) {
				Ab.setFocus('kg');
			} else if ($("#flgMt").val() == 1) {
				Ab.setFocus('mt');
			} else if ($("#flgNr").val() == 1) {
				Ab.setFocus('nr');
			}
		}
	}
}


function defaultQtaField() {
	//per default nr è visibile per permettere
	//l'inserimento di articoli NON in magazzino
	$("#lbl_nr").css("visibility", "visible");
	$("#nr").css("visibility", "visible");
}

function preOperatoreESalva(id) {
	if ($("#id_cliforListino").val() == "" || $("#id_cliforListino").val() == "0")
		alert("Seleziona un cliente per poter generare un documento");
	else {
		$("#tipoScontrinoP").val(id);
		$("#cliente").html($("#descrizioneClifor").val());
		$("#creaDocumento").dialog("open");

		$('#modalCreaDoc').modal('show');
	}
}

function postOperatoreESalva() {
	$("#flgEmettiFatturaScontrino").val($("#flgEmettiFatturaScontrinoP").val());
	$("#note").val($("#noteP").val());

	operatoreESalva($("#tipoScontrinoP").val());
}

/*************************************/
/*************************************/
//navigazione verso pagina dei pagamenti da inc_pagamenti
/*************************************/
/*************************************/
function vediPagamenti() {

	Ab.callAbl('../contab/DocumentoPagamento', '', '', 'cmd=search&id_clifor=' + $('#id_clifor').val());
}
/*************************************/
/*************************************/
/* aggiungi pagamento da inc_pagamenti */
/*************************************/
/*************************************/
function addPagamento() {
	Ab.callAbl('../contab/DocumentoPagamento', '', '', 'cmd=ni&act=Ins&id_documento=' + $('#id_documento').val(), 'Ins');
}

/*************************************/
/*************************************/
//VISUALIZZA PAGAMENTO da documentoCR 
/*************************************/
/*************************************/
function showPayments(id) {
	var html = $("#row_" + id).val(),
		head = '<table class="table table-bordered table-hover table-striped dataTable table-condensed" class="table-modal-body">',
		footer = '</table>';

	$('#modalPagamenti').modal('show');
	$('#modalPagamenti .modal-body').html(head + html + footer);
}

//////////////////////////////////
//CHIUDI PAGAMENTO
//////////////////////////////////
function closePayments() {
	$(".popup").hide();
}

function nuovoCliente() {
	newCli("main", retItemsClifor);
}

function modificaCliente() {
	modCli("main", retItemsClifor);
}

function nuovoFornitore() {
	newFor("main", retItemsClifor);
}

function modificaFornitore() {
	modFor("main", retItemsClifor);
}

function nuovoClifor() {
	if ($("#flgClienteFornitore").val() == 'C')
		newCli("main", retItemsClifor);
	else
		newFor("main", retItemsClifor);
}

function modificaClifor() {
	if ($("#flgClienteFornitore").val() == 'C')
		modClifor("main", retItemsClifor);
	else
		modClifor("main", retItemsClifor);
}


/*************************************/
/*************************************/
/* stampa documenti dalla CR/*
/*************************************/
/*************************************/
function stampaDocumentiCR() {

	var progDocumentoA = $("#progDocumentoA").val(),
		progDocumento = $("#progDocumento").val(),
		id_esercizio = $("#id_esercizio").val();



	/*if (progDocumentoA == 0 || progDocumento==0 || id_esercizio==0) 
	{
		sweetAlert("Attenzione!", "Inserire dal numero documento al numero documento e l'anno", "warning"); 
		$("#progDocumento").focus();
		return;	
	}*/

	var f = document.main;

	var debug = false;
	var wwD = "700";
	var whD = "500";
	//+"&xxx="+f.xxx.value

	theAction = f.actionPage.value + "?cmd=stampaDocumentiCR&" + $("#main").serialize();
	//
	//var numLabels=prompt("Numero di etichette da stampare","1");	
	if (debug == false) {
		window.open(theAction, "Stampa_Fattura", "width=" + wwD + ",height=" + whD + ",status=no,resizable=yes,top=100,left=100,scrollbars=yes");
	} else {
		window.open(theAction);
	}

}



/*************************************/
/*************************************/
/* DALLA MODAL MAILMODAL INVIA MAIL AL CLIENTE O FORNITORE */
/*************************************/
/*************************************/
function mailCommandCliFor() {

	var f = document.main;
	f.cmd.value = "mail";
	f.act.value = "clifor";
	var testoAgg = $("#testoAggD").val();
	f.testoAgg.value = testoAgg;
	f.action = f.actionPage.value;
	Ab.removeFadeModal();
	//Ab.popUp('ELAB')
	Ab.submitAj('main');

}
/*************************************/
/*************************************/
/* DALLA MODAL MAILMODAL INVIA MAIL ALl'indirizzo immesso */
/*************************************/
/*************************************/
function mailCommandExt() {
	var f = document.main;
	f.cmd.value = "mail";
	f.act.value = "ext"
		//email invi
	var m = $("#eMailInvioDiv").val();
	var testoAgg = $("#testoAggD").val();
	f.eMailInvio.value = m;
	f.testoAgg.value = testoAgg;
	f.action = f.actionPage.value;
	Ab.removeFadeModal();
	//Ab.popUp('ELAB')
	Ab.submitAj('main');
}





/*************************************/
/*************************************/
/* DALLA MODAL MAILMODAL INVIA MAIL AL CLIENTE O FORNITORE */
/*************************************/
/*************************************/
function mailCommandCliForCR() {

	var f = document.main;
	f.cmd.value = "mailCommandCliForCR";
	var testoAgg = $("#testoAggD").val();
	var flg = $("#flgInvioMailDiv").val();
	f.testoAgg.value = testoAgg;
	f.flgInvioMailM.value = flg;
	f.action = f.actionPage.value;
	Ab.removeFadeModal();
	//Ab.popUp('ELAB')
	Ab.submitAj('main');

}
/*************************************/
/*************************************/
/* DALLA MODAL MAILMODAL INVIA MAIL ALl'indirizzo immesso */
/*************************************/
/*************************************/
function mailCommandExtCR() {
	var f = document.main;
	f.cmd.value = "mailCommandExtCR";
	//email invi
	var m = $("#eMailInvioDiv").val();
	var flg = $("#flgInvioMailDiv").val();
	var testoAgg = $("#testoAggD").val();
	f.eMailInvio.value = m;
	f.flgInvioMailM.value = flg;
	f.testoAgg.value = testoAgg;
	f.action = f.actionPage.value;
	Ab.removeFadeModal();
	//Ab.popUp('ELAB')
	Ab.submitAj('main');
}


///////////
//TEST///
function annullaDocumentiWeb() {

	var f = document.main;
	f.action = f.actionPage.value;
	f.act.value = "";
	f.cmd.value = "annullaDocumentiWeb";

	Ab.submitAj('main');
}


/*****************************************/
/*****************************************/
/* STAMPA PACKING LIST SU DYMO */
/*****************************************/
/*****************************************/
function stampaEtichettePackingList() {
	var f = document.main;

	{
		var debug = false;
		var wwD = "700";
		var whD = "500";

		//+"&xxx="+f.xxx.value
		theAction = f.actionPage.value + ".pdf?cmd=creaPdfEtichettePackingList&id_documento=" + f.id_documento.value;
		var blankLabels = prompt("Numero di etichette da saltare", "0");
		theAction = theAction + "&blankLabels=" + blankLabels; //+"&numLabels="+numLabels;
		//
		//var numLabels=prompt("Numero di etichette da stampare","1");
		if (debug == false) {
			window.open(theAction, "Stampa_Etichette_Packing_List", "width=" + wwD + ",height=" + whD + ",status=no,resizable=yes,top=100,left=100,scrollbars=yes");
		} else {
			window.open(theAction);
		}

	}

}


/*****************************************/
/*****************************************/
function sbloccaDocumento()
/*****************************************/
/*****************************************/
{
	var f = document.main;

	if (confirm('Vuoi sbloccare il documento?')) {
		f.cmd.value = "sbloccaDocumento";
		f.act.value = "";
		f.action = f.actionPage.value;
		Ab.submitAj('main');
	}
}


/*****************************************/
/*****************************************/
//navigazione verso cliente (pagamento)
/*****************************************/
/*****************************************/
function loadCliente() {
	Ab.callAbl('../anag/Cliente', '', '', 'cmd=md&id_clifor=' + $("#id_clifor").val() + '&currentTab=%23EST')
}



////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
//METODI DEPRECATI
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////



////////////////////////////////////
// onFocusDescRiga
// determina che succede quando arriva il focus su descriga
// deve andare sulla qta giusta. Si attiva dopo il CR
////////////////////////////////////
function onFocusDescRiga() {
	//DEPRECATO
	if (false) {


		Ab.debug("onFocusDescRiga ");
		//checkBoxes();
		if (Ab.prendiElementoDaId("id_articolo").value > 0 && Ab.prendiElementoDaId("descrizioneRiga").value != "" && Ab.prendiElementoDaId('flgAutoAdd').value == 1) {
			console.log("onFocusDescRiga addriga");
			addRigaArticolo();
		} else {
			//se non  bolla fattura o nc allora il seriale non lo chiedo (es. ordine)flgTipologia!=3
			//dovrei verificare getTipoCaricoScarico=0-- anagrafiche chiedo seriale tipoCaricoScarico==0 
			if (document.main.flgUsaSeriale.value == 1 && document.main.flgTipologia.value != 3) {
				$("#descrizioneRiga").select();
				//Ab.prendiElementoDaId('descrizioneRiga').select();
				beep();
			} else {
				//Ab.prendiElementoDaId('quantita').focus() ;
			}
		}
	}
}


////////////////////////////////////////////
// fa una chiamata asincrona per creare file xml della fattura elettronica
////////////////////////////////////////////////////
function creaXml() {

	swal({
			title: "Creazione Xml",
			text: "Verra' creato il file Xml per la fatturazione elettronica. Sei Sicuro?",
			type: "warning",
			showCancelButton: true,
			confirmButtonClass: "btn-danger",
			confirmButtonText: "si",
			cancelButtonText: "no",
			closeOnConfirm: true,
			closeOnCancel: true
		},
		function (isConfirm) {
			if (isConfirm) {
				Ab.fetch("../contab/Documento.abl", "cmd=creaXmlFE&id_documento=" + $("#id_documento").val(), "fileXml", null, 1);
				$("#statoXml").html("");

				/*	$("#main").attr("action",$("#actionPage").val());		
					$("#flgReport").val("S");
					$("#cmd", "#main").val("search");
					$("#act","#main").val("");
					$("#cmd2").val("");
					$("#act2").val("");
					$("#pageNumber").val("1");
					Ab.submitAj('main');*/
			} else {

			}
		});


	//fetch(servlet, command, divList, postProcess, async, type)


}


////////////////////////////////////////////
// fa una chiamata asincrona per creare file xml della fattura elettronica
////////////////////////////////////////////////////
function creaXmlCR() {

	swal({
			title: "Creazione Zip Xml",
			text: "Verra' creato il file Zip-Xml per la fatturazione elettronica per le sole fatture per cui non e' stato ancora creato. Sei Sicuro?",
			type: "warning",
			showCancelButton: true,
			confirmButtonClass: "btn-danger",
			confirmButtonText: "si",
			cancelButtonText: "no",
			closeOnConfirm: true,
			closeOnCancel: true
		},
		function (isConfirm) {
			//alert( $('#main').serialize());
			if (isConfirm) {
				//chiamo un comando che lancia un thread?
				$("#cmd").val("creaXmlCRFE");
				Ab.fetch("../contab/Documento.abl", $('#main').serialize(), "fileZipXml", null, 1);




			} else {

			}
		});


	//fetch(servlet, command, divList, postProcess, async, type)


}


////////////////////////////////////////////
// dalla CR fa l'xml della riga corrispondente
////////////////////////////////////////////////////
function creaXmlRow(l_id) {

	swal({
			title: "Creazione Xml",
			text: "Verra' creato il file Xml per la fatturazione elettronica della fattura corrispondente. Sei Sicuro?",
			type: "warning",
			showCancelButton: true,
			confirmButtonClass: "btn-danger",
			confirmButtonText: "si",
			cancelButtonText: "no",
			closeOnConfirm: true,
			closeOnCancel: true
		},
		function (isConfirm) {
			//alert( $('#main').serialize());
			if (isConfirm) {
				//chiamo un comando che lancia un thread?
				var f = document.main;
				f.action = f.actionPage.value;
				$("#id_documento").val(l_id);
				$("#cmd").val("creaXmlRowFE");
				Ab.submitAj('main');

			} else {

			}
		});


}

////////////////////////////////////////////
// dalla CR blocca la creazione xml
////////////////////////////////////////////////////
function impostaXmlInviatoRow(l_id) {

	swal({
			title: "Invio File Xml",
			text: "Verra' impostato ad inviato il file Xml della fatturazione elettronica della fattura corrispondente. Non sara' più possibile modificare la fattura. Sei Sicuro?",
			type: "warning",
			showCancelButton: true,
			confirmButtonClass: "btn-danger",
			confirmButtonText: "si",
			cancelButtonText: "no",
			closeOnConfirm: true,
			closeOnCancel: true
		},
		function (isConfirm) {
			//alert( $('#main').serialize());
			if (isConfirm) {
				//chiamo un comando che lancia un thread?
				var f = document.main;
				f.action = f.actionPage.value;
				$("#id_documento").val(l_id);
				$("#cmd").val("impostaXmlInviatoRowFE");
				Ab.submitAj('main');

			} else {

			}
		});


}
////////////////////////////////////////////
// dal dettaglio blocca la creazione xml
////////////////////////////////////////////////////
function impostaXmlInviato() {

	swal({
			title: "Invio File Xml",
			text: "Verra' impostato ad inviato il file Xml fatturazione elettronica. Non sara' più possibile modificare la fattura. Sei Sicuro?",
			type: "warning",
			showCancelButton: true,
			confirmButtonClass: "btn-danger",
			confirmButtonText: "si",
			cancelButtonText: "no",
			closeOnConfirm: true,
			closeOnCancel: true
		},
		function (isConfirm) {
			//alert( $('#main').serialize());
			if (isConfirm) {
				//chiamo un comando che lancia un thread?
				var f = document.main;
				f.action = f.actionPage.value;
				//$("#id_documento").val(l_id);
				$("#cmd").val("impostaXmlInviatoFE");
				Ab.submitAj('main');

			} else {

			}
		});


}
////////////////////////////////////////////
// permette di inviare nuovamente un xml già bloccato
////////////////////////////////////////////////////
function riapriInvioXml() {

	swal({
			title: "Abilita Nuovamente Invio File Xml",
			text: "Sara' possibile inviare nuovamente il file XML precedentemente bloccato. Sei Sicuro?",
			type: "warning",
			showCancelButton: true,
			confirmButtonClass: "btn-danger",
			confirmButtonText: "si",
			cancelButtonText: "no",
			closeOnConfirm: true,
			closeOnCancel: true
		},
		function (isConfirm) {
			//alert( $('#main').serialize());
			if (isConfirm) {
				//chiamo un comando che lancia un thread?
				var f = document.main;
				f.action = f.actionPage.value;
				//$("#id_documento").val(l_id);
				$("#cmd").val("riapriXmlBloccatoFE");
				Ab.submitAj('main');

			} else {

			}
		});


}

/************************************************/
/************************************************/
/* DALLA MASCHERA DI RICERCA imposta procedi pagamento per ordini www*/
/************************************************/
/************************************************/
function procediPagCR(id) {


	swal({
			title: "Procedi Con Il Pagamento",
			text: "Vuoi procedere con il pagamento?",
			type: "warning",
			showCancelButton: true,
			confirmButtonClass: "btn-danger",
			confirmButtonText: "si",
			cancelButtonText: "no",
			closeOnConfirm: true,
			closeOnCancel: true
		},
		function (isConfirm) {
			if (isConfirm) {
				$("#main").attr("action", $("#actionPage").val());
				//$("#flgReport").val("S");
				$("#cmd", "#main").val("procediPagamento");
				$("#act", "#main").val("");
				$("#cmd2").val("");
				$("#act2").val("");
				$("#id_documento").val(id);
				Ab.submitAj('main');
			} else {

			}
		});


}

/***************************************************/
/***************************************************/
/* FUNZIONI TUTTOFOTO (BARTOLINI E EXPORT)*/
/***************************************************/
/***************************************************/


function includiExportBartolini(id) {

	var f = document.main;
	//	if( validateForm2('main','dataFatturazione','Data Fatturazione','R'))
	{
		if (confirm("Vuoi includere la fattura nell'export Bartolini?"))

		{
			checkRadioCR();
			f.action = f.actionPage.value;
			f.cmd.value = "includiExportBartolini";
			//f.act.value="view";
			f.id_documento.value = id;
			Ab.submitAj('main');
		}
	}
}

function exportBartolini() {


	var f = document.main;

	if (f.flgSimulazione.value == "1" || (f.flgSimulazione.value == "0" && confirm("Export Bartolini (solo fatture emesse): simulazione non attivata. Vuoi Continuare?"))) {
		f.action = f.actionPage.value;
		//FACCIO IL SUBMIT
		f.cmd.value = "creaFileBartolini";
		//alert(f.cmd.value);
		//theAction = f.actionPage.value + "?" + $("#main").serialize();
		Ab.fetch(f.actionPage.value, $("#main").serialize(), "fileDownload", null, 1);


	}


}

/************************************************/
/************************************************/
/* stampa codici a barre */
/************************************************/
/************************************************/
function codBarreBartoliniCR() {
	var f = document.main;
	if (f.flgSimulazione.value == "1" || (f.flgSimulazione.value == "0" && confirm("Codici a Barre Bartolini: simulazione non attivata. Vuoi Continuare?"))) {

		var f = document.main;
		var debug = false;
		var wwD = "700";
		var whD = "500";
		// $("#form_id").serialize()

		f.cmd.value = "reportPdf";
		if ($("#id_tipologiaProdotto").val() == 0) {
			swal("Attenzione!", "Impostare una tipologia Prodotto", "warning")
		} else {
			f.cmd.value = "stampaCodBarreBartolini";
			var blankLabels = prompt("Numero di etichette da saltare", "0");
			f.blankLabels.value = blankLabels;
			theAction = f.actionPage.value + ".pdf?" + $("#main").serialize();
			//alert(theAction);
			if (debug == false) {
				window.open(theAction, "Stampa_Codici_Barre_Bartolini", "width=" + wwD + ",height=" + whD + ",status=no,resizable=yes,top=100,left=100,scrollbars=yes");
			} else {
				window.open(theAction);
			}
		}

	}

}
/************************************************/
/************************************************/
/* stampa etichette per i pacchi CR*/
/************************************************/
/************************************************/
function labelBartoliniCR() {
	var f = document.main;
	{

		var f = document.main;
		var debug = false;
		var wwD = "700";
		var whD = "500";
		// $("#form_id").serialize()
 
	
		if ($("#id_tipologiaProdotto").val() == 0) {
			swal("Attenzione!", "Impostare una tipologia Prodotto", "warning")
		} else {
			f.cmd.value = "stampaLabelBartolini";
		
			theAction = f.actionPage.value + ".pdf?" + $("#main").serialize();
			//alert(theAction);
			if (debug == false) {
				window.open(theAction, "Stampa_Etichette_Bartolini", "width=" + wwD + ",height=" + whD + ",status=no,resizable=yes,top=100,left=100,scrollbars=yes");
			} else {
				window.open(theAction);
			}
		}
   
	}

}
/************************************************/
/************************************************/
/* stampa etichette per i pacchi DETTAGLIO*/
/************************************************/
/************************************************/
function labelBartolini() {
	var f = document.main;
	{

		var f = document.main;
		var debug = false;
		var wwD = "700";
		var whD = "500";
		// $("#form_id").serialize()
 
	
		if ($("#id_tipologiaProdotto").val() == 0) {
			swal("Attenzione!", "Impostare una tipologia Prodotto", "warning")
		} else {
			f.cmd.value = "stampaLabelBartoliniPD";
		
			theAction = f.actionPage.value + ".pdf?" + $("#main").serialize();
			//alert(theAction);
			if (debug == false) {
				window.open(theAction, "Stampa_Etichette_Bartolini", "width=" + wwD + ",height=" + whD + ",status=no,resizable=yes,top=100,left=100,scrollbars=yes");
			} else {
				window.open(theAction);
			}
		}
   
	}

}


function mailSpedizione() {

	var f = document.main;
	if (validateForm('nColli', 'Numero colli', 'RisNum>0', 'id_vettore', 'Vettore', 'RisNumKey')) {
		if (f.flgStato.value == "E") {
			if (confirm("Verra' inviata la mail di spedizione ordine. Sei sicuro?")) {
				//alert(f.rbFlgPagata.value);
				checkBoxes();
				//alert(f.flgPagata.value);
				f.action = f.actionPage.value;
				f.cmd.value = "mailSpedizione";
				Ab.submitAj('main');
			}
		} else
			alert('Impossibile mandare mail spedizione per fatture in bozza');
	}



}

function mailSpedizioneCR(id) {
	if (confirm("Verra' inviata la mail di spedizione ordine. Sei sicuro?")) {
		var f = document.main;
		//alert(f.rbFlgPagata.value);
		//alert(f.flgPagata.value);
		f.action = f.actionPage.value;
		f.cmd.value = "inviaSpedizioneAvvenuta";
		f.id_documento.value = id;
		Ab.submitAj('main');
	}

}








function mailBartoliniCR() {
	var f = document.main;
	if (f.ckFlgSimulazione.checked) f.flgSimulazione.value = "1";
	else f.flgSimulazione.value = "0";
	if (f.flgSimulazione.value == "1" || (f.flgSimulazione.value == "0" && confirm("Mail Bartolini: simulazione non attivata. Vuoi Continuare?"))) {
		var f = document.main;
		//alert(f.rbFlgPagata.value);
		checkRadioCR();
		//alert(f.flgPagata.value);
		f.action = f.actionPage.value;
		f.cmd.value = "mailBartolini";
		f.pageNumber.value = 1;
		f.flgReport.value = "";
		Ab.submitAj('main');

	}

}


/***************************************************/
/***************************************************/
/* Eexport contabilita'*/
/***************************************************/
/***************************************************/
function exportFatture() {
var f = document.main;

	if (f.flgSimulazione.value == "1" || (f.flgSimulazione.value == "0" && confirm("Export fatture (solo fatture emesse): simulazione non attivata. Vuoi Continuare?"))) {
		f.action = f.actionPage.value;
		//FACCIO IL SUBMIT
		f.cmd.value = "creaFileContab";
		//alert(f.cmd.value);
		//theAction = f.actionPage.value + "?" + $("#main").serialize();
		Ab.fetch(f.actionPage.value, $("#main").serialize(), "fileDownload", null, 1);


	}
	
	


}



/***************************************************/
/***************************************************/
/* FUNZIONI TUTTOFOTO filtri cr*/
/***************************************************/
/***************************************************/

function filtraOrdiniWww()
{
	var f = document.main;
	f.id_tipoDocumento.value=21;
	f.flgTipologia.value=-1;
	searching();
	
	
}

function filtraFatture()
{
	var f = document.main;
	f.id_tipoDocumento.value=22;
	f.flgTipologia.value=-1;
	searching();
	
	
}
function filtraFattureUsato()
{
	var f = document.main;
	f.id_tipoDocumento.value=25;
	f.flgTipologia.value=-1;
	searching();
	
	
}
function filtraFattureTutte()
{
	var f = document.main;
	f.id_tipoDocumento.value=0;
	f.flgTipologia.value=1;
	searching();
	
	
}
