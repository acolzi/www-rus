/*** ab-documentoPagmaneto lte *
/* 4.0 */

$(function () {
	$("#dettaglioWin").dialog({
		autoOpen: false,
		width: 800,
		height: 300,
		show: {
			effect: "blind",
			duration: 100
		},
		/*hide: {
		effect: "explode",
		duration: 1000
	  }*/
	});
	$("#dettaglioWin").dialog("option", "title", "Dettaglio Articolo Varianti");
});

/*********************************************/
/*********************************************/
/*********************************************/
function reportx() {
	//FACCIO IL SUBMIT
	var f = document.main;
	f.flgReport.value = "S";
	//f.action=webApp+"/tr/Pratica.abl";
	f.cmd.value = "search";
	Ab.submitAj('main');
}

/////////////////////////////////////////////7
function checkFieldsIns()
/////////////////////////////////////////////7
{
	return Ab.validateForm('importo', 'Importo', 'RisNum>0', 'data', 'Data', 'R', 'id_tipoPagamento', 'Tipo Pagamento', 'RisNum>0');
}


/////////////////////////////////////////////7
function checkFields()
/////////////////////////////////////////////7
{
	var saldo = parseFloat($("#saldo").val()),
		importo = parseFloat($("#importo").val());

	if (saldo < importo) {
		alert("Importo superiore al totale fattura!");

		$("#importo").focus();

		return false;
	}

	return checkFieldsIns();
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
	//Ab.setChekBoxValue("dettaglio","flgSommaCRL","1","0");

}

function checkRadio() {
	//Ab.setRadioButtonValue("dettaglio","flgPlaAntPos");
}

function checkBoxesCR()
/////////////////////////////////////////////
{
	//Ab.setChekBoxValue("ricerca","flgSommaCRL","1","0");
}

function checkRadioCR() {
	//Ab.setRadioButtonValue("ricerca","flgPlaAntPos");

}
/////////////////////////////////////////////////
//////////////////////////////////////////////////
function addRow()
/////////////////////////////////////////////
{

	var f = document.main;
	f.action = f.actionPage.value;
	if (Ab.validateForm('id_rowBean', 'RowBean', 'R')) {
		f.cmd.value = "gr";
		f.act.value = "addRow";
		Ab.submitAj('main');
	}
}

function delRow(l_id)
/////////////////////////////////////////////
{
	if (Ab.confirmDelete()) {
		var f = document.main;
		f.action = f.actionPage.value;
		//	FACCIO IL SUBMIT
		f.cmd.value = "gr";
		f.act.value = "delRow";
		f.id_rowBean.value = l_id;
		Ab.submitAj('main');
	}

}

function modRow(l_id)
/////////////////////////////////////////////
{

	var f = document.main;
	f.action = f.actionPage.value;
	//	FACCIO IL SUBMIT
	f.cmd.value = "gr";
	f.act.value = "modRow";
	f.id_rowBean.value = l_id;
	Ab.submitAj('main');

}



function creaCMByFile() {
	var f = document.main;
	if (f.id_templateMsg.value != "" && f.nomeFile.value != "") {
		if (confirm("Verrà creata una nuova coda di messaggi in base al template e al file di indirizzi email selezionato. Sei Sicuro?")) {
			//Ab.popUp("ELAB");
			f.action = f.actionPage.value;
			//	FACCIO IL SUBMIT
			f.cmd.value = "creaCodaMsg";
			Ab.submitAj('main');
		}
	} else
		alert('Template non valido o file non selezionato!');


}

/////////////////////////////////////////////////
//////////////////////////////////////////////////
function addAllegato()
/////////////////////////////////////////////
{

	var f = document.main;
	f.action = f.actionPage.value;
	if (Ab.validateForm('nomeFile', 'Nome File', 'R')) {
		checkBoxes();
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
		f.id_allegatoTemplateMsg.value = l_id;
		Ab.submitAj('main');
	}

}

/////////////////////////////////
// funzione richiamata sul document ready
// in modo da averne uno solo
///////////////////////////////
function documentReadyScript() {
	loadListInit();
}


function loadListInit() {
	var id_clifor = $("#id_clifor").val();

	if (id_clifor != 0) {
		var url = $("#actionPage").val(),
			cmd = "cmd=loadLista&id_clifor=" + id_clifor;

		fetch(url, cmd, "lista");

	}

}

function loadList() {
	loadListInit();
	$("#data").focus();
}


/*****************************************/
/*****************************************/
/* su documentoPagmentoList */
/*****************************************/
/*****************************************/
function selezionaTutto() {
	//var valore = $("#ckflgSelezionaTutto").attr("checked")=="checked"?true:false; 
	var valore = $("#flgSelezionaTutto").val();
	//alert(valore);
	//alert($("#ckflgServizio_6111").val());
	$("input[id^='ckflgServizio_']").each(function (index, element) {
		var id = $(element).attr("name").replace("ckflgServizio_", "");
		element.checked = valore == 0 ? false : true;
		$("#flgServizio_" + id).val(valore);
		selezionaCheck($(element));
	});
}

/*****************************************/
/*****************************************/
//documentoPagamentoList
//cosa accade se premo ul check alla sx del servizio
/*****************************************/
/*****************************************/
function selezionaCheck(that) {
	var id = $(that).attr("name").replace("ckflgServizio_", "");
	//alert("id:"+id+" "+$("#flgServizio_"+id).val());
	//il flg è inverso su click perché viene settato dopo...., diretto su onchange 
	//da verificare su tutti i browser
	if ($(that).attr("checked") || $("#flgServizio_" + id).val() == 1) {
		var saldo = parseFloat($("#saldo_" + id).val().replace(".", "").replace(",", ".")),
			residuo = parseFloat($("#importoResiduo").val().replace(".", "").replace(",", ".")),
			importo = 0;


		if (saldo > residuo)
			importo = residuo;
		else
			importo = saldo;


		$("#importo_" + id).val(importo.toString().replace(".", ","));
		$("#importo_" + id).show();
		$("#ckflgTipoIncasso_" + id).show();
		$("#importo_" + id).focus();
	} else {

		$("#importo_" + id).hide();
		$("#ckflgTipoIncasso_" + id).hide();
		$("#importo_" + id).val("0");
	}
	calcolaResidui($("#importo_" + id));
}

function impostaResiduo() {
	temp = $("#importo").val();
	$("#importoResiduo").val(temp.replace(/[.]/, ''));
}

function calcolaResidui(that) {
	var importoTot = parseFloat($("#importo").val().replace(",", ".")),
		importoResiduo = parseFloat($("#importoResiduo").val().replace(",", ".")),
		importoLista = 0,
		importoRigo = parseFloat($(that).val().replace(".", "").replace(",", "."));
	saldoRigo = parseFloat($(that).siblings("input[name^='saldo_']").val().replace(".", "").replace(",", "."));

	if (importoRigo > (importoResiduo + importoRigo)) {
		alert("Importo maggiore dell'importo residuo! Importo immesso: " + importoRigo + " Importo residuo: " + importoResiduo);
		$(that).val(0);
		//$(that).focus();
	} else if (importoRigo > saldoRigo) {
		alert("Importo maggiore dell'importo del documento! Importo immesso: " + importoRigo + " Importo documento: " + saldoRigo);
		$(that).val(0);
		//$(that).focus();		
	} else {
		$("input[id^='importo_']").each(function (index, element) {
			var importoEach = $(element).val().replace(".", "").replace(",", ".");
			if (importoEach.trim() == "")
				importoEach = 0;

			importoLista += parseFloat(importoEach);
		});


		var importoResiduoCalcolato = parseFloat(importoTot - importoLista).toFixed(2);

		$("#importoResiduo").val(importoResiduoCalcolato.toString().replace(".", ","));
	}
}

////////////////////////////////////////////////
// sottometto la lista delle fatture con l'importo e lo stato saldo o acconto
////////////////////////////////////////////////
function savePagamenti() {
	if (checkFieldsIns()) {
		var importoResiduo = $("#importoResiduo").val()

		if (parseFloat(importoResiduo) > 0) {
			alert("Distribuire tutti gli importi nei documenti!");
			return false;
		}

		if (confirm("Vuoi salvare i pagamenti?")) {
			var listaDocumenti = "";
			$("input[id^='ckflgServizio_']:checked").each(function (index, element) {
				var id = $(element).attr("name").replace("ckflgServizio_", ""),
					importo = $("#importo_" + id).val().replace(",", "."),
					stato = $("#ckflgTipoIncasso_" + id).prop("checked") == true ? 1 : 0;

				listaDocumenti += id + "," + importo + "," + stato + "|";
			});
			$("#listaDocumenti").val(listaDocumenti);
			//alert(listaDocumenti);
			var f = document.main;
			f.action = f.actionPage.value;
			//	FACCIO IL SUBMIT
			f.cmd.value = "savePagamenti";
			f.act.value = "";
			Ab.submitAj('main');
		}
	}

}
/************************************************/
/************************************************/
/* NUOVO PAGAMENTO DA PAGAMENTOCR*/
/************************************************/
/************************************************/
function nuovoPagamento() {

	var f = document.main;
	f.action = f.actionPage.value;
	//	FACCIO IL SUBMIT
	f.cmd.value = "ni";
	f.act.value = "Ins";
	Ab.submitAj('main');
}


/************************************************/
/************************************************/
// navigazione verso documento (estratto conto)
/************************************************/
/************************************************/

function loadDocument(id) {

	//Ab.callAbl('/admin/contab/DocumentoPagamento','body','search&id_clifor='+$('#id_clifor').val());
	Ab.callAbl('../contab/Documento', '', '', 'cmd=md&id_documento=' + id + '&currentTab=%23PAG')
}

/*****************************************/
/*****************************************/
//navigazione verso cliente (pagamento)
/*****************************************/
/*****************************************/
function loadCliente() {
	Ab.callAbl('../anag/Cliente', '', '', 'cmd=md&id_clifor=' + $("#id_clifor").val() + '&currentTab=%23EST')
}

//////////////////////////////////
//navicazione verso cliente
//////////////////////////////////
function loadCliente2(id) {

	var f = document.main;
	f.action = "../anag/Cliente.abl";
	//	FACCIO IL SUBMIT
	f.cmd.value = "md";
	f.act.value = "";
	f.id_clifor.value = id;
	f.currentTab.value = "#EST";
	Ab.submitAj('main');

	//Ab.callAbl('/admin/anag/Cliente','md&id_clifor='+id+"&currentTab=%23FATTURE")
}

function printReport() {
	var f = document.main;
	var debug = false;
	var wwD = "700";
	var whD = "500";

	theAction = f.actionPage.value + "?cmd=printReport";

	//&id_clifor="+f.id_clifor.value+"&dataDa="+f.dataDa.value+"&dataA="+f.dataA.value+"&flgTipoSaldo="+f.flgTipoSaldo.value+"&id_tipoPagamento="+f.id_tipoPagamento.value+"&riferimento="+f.riferimento.value+"&id_tipoDocumento="+f.id_tipoDocumento.value+"&numeroFattura="+f.numeroFattura.value+"&annoFattura="+f.annoFattura.value+"&dataFatturaDa="+f.dataFatturaDa.value+"&dataFatturaA="+f.dataFatturaA.value+"&flgClienteFornitore="+f.flgClienteFornitore.value;

	//
	if (debug == false) {
		window.open(theAction, "Stampa_Report", "width=" + wwD + ",height=" + whD + ",status=no,resizable=yes,top=100,left=100,scrollbars=yes");
	} else {
		window.open(theAction);
	}
}



/******************************************/
/******************************************/
/* il modifica su clifor va in dettaglio *
/******************************************/
/******************************************/
function modificaClifor() {

	if ($("#id_clifor").val() != "" && $("#id_clifor").val() != "0") {
		var f = document.main;
		f.action = "../anag/Clifor.abl";
		//	FACCIO IL SUBMIT
		f.cmd.value = "md";
		f.act.value = "";
		Ab.submitAj('main');


	}


}
