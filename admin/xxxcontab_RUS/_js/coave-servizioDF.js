// pkg_servizioStd

///////////////////////////////////////////
////////T O O L B A R /////////////////////
///////////////////////////////////////////
$(function() {
	$( "#tipoFattura" ).dialog({
	  autoOpen: false,
	  width: 400,
	  show: {
		effect: "blind",
		duration: 100,
	  },
	  /*hide: {
		effect: "explode",
		duration: 1000
	  }*/
	});
	$( "#tipoFattura" ).dialog("option", "title", "SELEZIONE TIPO DI DOCUMENTO");
	//
	$( "#listaFatture" ).dialog({
	  autoOpen: false,
	  width: 400,
	  show: {
		effect: "blind",
		duration: 100,
	  },
	  /*hide: {
		effect: "explode",
		duration: 1000
	  }*/
	});
	$( "#listaFatture" ).dialog("option", "title", "DOCUMENTI CREATI");
});

function formSearching()
{
		//FACCIO IL SUBMIT
		var f = document.main;
		f.flgReport.value="";
		f.action=f.actionPage.value;
		f.cmd.value="search";
		f.pageNumber.value=1;
		//f.submit();
}
function searching()
{
		//FACCIO IL SUBMIT
		var f = document.main;
		formSearching();
		Ab.submitAj("main");
}

function report()
{
		//FACCIO IL SUBMIT
		var f = document.main;
		f.flgReport.value="S";
		//f.action=webApp+"/tr/Pratica.abl";
		f.cmd.value="search";
		Ab.submitAj("main");
}

function modifyCommand(id)
{
		//FACCIO IL SUBMIT
		var f = document.main;
		f.action=webApp+"/admin/serv/ServizioStd.abl";
		f.cmd.value="md";
		//f.act.value="view";
		f.id_servizioStd.value=id;
		
		//Ab.submitAj("main");
		f.submit();
}

function deleteCommandCR(id,l_tmst)
{
	if (Ab.confirmDelete())
	{
		//FACCIO IL SUBMIT
		var f = document.main;
		f.action=f.actionPage.value;
		f.act.value="delCR";
		f.cmd.value="asq";
		f.lastUpdTmst.value=l_tmst;
		f.id_servizioStd.value=id;
		Ab.submitAj("main");
	}
}

function deleteCommandCR(id)
{
	if (Ab.confirmDelete())
	{
		//FACCIO IL SUBMIT
		var f = document.main;
		f.action=f.actionPage.value;
		f.act.value="del";
		f.cmd.value="asq";
		f.id_servizioStd.value=id;
		Ab.submitAj("main");
	}

}
function deleteCommand()
{
	if (Ab.confirmDelete())
	{
		var f = document.main;
		f.action=f.actionPage.value;
		f.act.value="del";
		f.cmd.value="asq";
		Ab.submitAj("main");
	}

}
function refresh()
{
		//FACCIO IL SUBMIT
		var f = document.main;
		f.action=f.actionPage.value;
		f.cmd.value="md";
		f.act.value="refresh";
		//f.currentTab.value="";
		Ab.submitAj("main");
}

/////////////////////////////////////////////7
function checkFields()
/////////////////////////////////////////////7
{
	//R per required
	//isNum per numerico
	//isNumKey è una chiave.. uguale a isNum>0 ma cambio il messaggio
	//isNum>x per numerico maggiore di x
	//isNum<x per numerico minore di x
	//isEmail per indirizzo email
	//inRange1:10 per ..
	//3 stringhe
	//1: nome del field
	//2: se '' visualizza il nome del field, altrimenti questo campo
	//3: R/N+''/isNum/isEmail/inRangea:b

return Ab.validateForm('numeroRichiesta','Numero Richiesta','R','id_cliente','Cliente','RisNumKey');
	
}

/////////////////////////////////////////////7
function checkSearchFields()
/////////////////////////////////////////////7
{
	if(document.main.crNS==1)
		return false;
	else
	{
		//return Ab.validateForm('descrizione','Descrizione','R','numero','Numero','RisNum>0','eMail','','NisEmail');
		return true;
	}

	
}


function checkBoxes()
/////////////////////////////////////////////
{
	Ab.setChekBoxValue("main","flgCartello","1","0");
	Ab.setChekBoxValue("main","flgPadre","1","0");
	Ab.setChekBoxValue("main","flgStampaCornice","1","0");
}

function checkRadio()
{
	//Ab. Ab.setRadioButtonValue("main","flgPlaAntPos");
}

function checkBoxesCR()
/////////////////////////////////////////////
{
	//Ab.setChekBoxValue("main","flgSommaCRL","1","0");
}

function checkRadioCR()
{
	//Ab. Ab.setRadioButtonValue("main","flgPlaAntPos");

}
/////////////////////////////////////////////////

function generaFattura()
{
	
	var f = document.main;
	
	if(confirm("Verra' generata la fattura relativa. Sei Sicuro?"))
	if (checkFields())
	{
		checkBoxes();
			   {
					f.action=f.actionPage.value;
					f.cmd.value="GENFATT";
					Ab.submitAj("main");
			   }
	}
}

function cancellaFattura()
{
	if(confirm("Verra' cancellata la fattura relativa.  Sei Sicuro?"))
			   {
					var f = document.main;
					f.action=f.actionPage.value;
					f.cmd.value="DELFATT";
					Ab.submitAj("main");
			   }

}
function stampaFattura()
{
	var debug=false;
	var wwD="700";
	var whD="500";
	var f = document.main;
	if(f.id_documentoxStampa.value==0)
	{
		alert('Fattura non ancora creata');
		
	}
	else
	{
		theAction=f.actionPage.value+".pdf?cmd=print&act=ft&id_servizioStd="+f.id_servizioStd.value;
		if(debug==false)
		{
			window.open(theAction, "Stampa_Fattura","width="+wwD+",height="+whD+",status=no,resizable=yes,top=100,left=100,scrollbars=yes");
		}
		else
		{
			window.open(theAction); 
		}
	}
}

function cancellaFattura()
{
	if(confirm("Verra' cancellata la fattura relativa.  Sei Sicuro?"))
			   {
					var f = document.main;
					f.action=f.actionPage.value;
					f.cmd.value="DELFATT";
					Ab.submitAj("main");
			   }

}

function printCommand()
{
	$('#stampa').dialog( "open" );
}

function printCommandCli()
{
	var f = document.main;
	 stampaDocumento(f.id_servizioStd.value, 'docCli');
	 closeStampa();
}

function printCommandFor()
{
	var f = document.main;
	 stampaDocumento(f.id_servizioStd.value, 'docFor');
	 closeStampa();
}

function printCommandAut()
{
	var f = document.main;
	 stampaDocumento(f.id_servizioStd.value, 'docAut');
	 closeStampa();
}

////////////////////////////////////
function mailCommand()
{
	//var f = document.main;
	// stampaDocumento(f.id_servizioStd.value, 'docFor');
	//Ab.modalWin=dhtmlwindow.open('Ab.modalW', 'div', 'mail', "Stampa Voucher ", 'width=420px,height=100px,left=400px,top=250px,resize=0,scrolling=0');
	
	$('#mail').dialog( "open" );
}
function mailCommandCli()
{
	var f = document.main;
	
	if(f.id_cliente.value==0 && $('#emailAlt').val()=='') {
		alert('Impossibile inviare la mail! Compilare il campo cliente!');
	} else {
		f.cmd.value="mail";
		f.act.value="docCli";
		
		$('#emailAlternativa').val($('#emailAlt').val());
		$('#flgCartello').val($('#ckFlgCartello').val()=="on"?1:0);
		//alert(f.emailAlternativa.value);
		f.action=f.actionPage.value;
		//Ab.popUp('ELAB')
		Ab.submitAj("main");
	}
}
function mailCommandFor()
{
	var f = document.main;
	
	if(f.id_fornitore.value==0 && $('#emailAlt').val()=='') {
		alert('Impossibile inviare la mail! Compilare il campo fornitore!');
	} else {
		f.cmd.value="mail";
		f.act.value="docFor";
		f.action=f.actionPage.value;
		$('#emailAlternativa').val($('#emailAlt').val());
		$('#flgCartello').val($('#ckFlgCartello').val()=="on"?1:0);
		//Ab.popUp('ELAB')
		Ab.submitAj("main");
	}
}
function mailCommandAut()
{
	var f = document.main;
	
	if(f.id_autista.value==0 && $('#emailAlt').val()=='') {
		alert('Impossibile inviare la mail! Compilare il campo Autista!');
	} else {
		f.cmd.value="mail";
		f.act.value="docAut";
		f.action=f.actionPage.value;
		$('#emailAlternativa').val($('#emailAlt').val());
		$('#flgCartello').val($('#ckFlgCartello').val()=="on"?1:0);
		//Ab.popUp('ELAB')
		Ab.submitAj("main");
	}
}

function stampaDocumento(id,tipo)
{

	if(id!=0)
	{
		var f = document.main;
		if(id>0)
		
		{
			var debug=false;
			var wwD="700";
			var whD="500";
			//+"&xxx="+f.xxx.value
			theAction=f.actionPage.value+".pdf?cmd=print&act="+tipo+"&id_servizioStd="+id;
			//
			//var numLabels=prompt("Numero di etichette da stampare","1");	
			if(debug==false)
			{
				window.open(theAction, "Stampa_Servizio","width="+wwD+",height="+whD+",status=no,resizable=yes,top=100,left=100,scrollbars=yes");
			}
			else
			{
				window.open(theAction); 
			}
		}
		
	}
	
}

function dup()
{
   	var f = document.main;
	f.action=f.actionPage.value;
	//var msg=Ab.prendiElementoDaId("msgDup").value
	var msg="Il servizio verrà duplicato. Vuoi continuare?";
	if(confirm(msg))
	{
		//if (checkFields())
		{
			checkBoxes();
			f.cmd.value="dup";
			f.act.value="";
			Ab.submitAj("main");
		}
	}
	
		
}
function caricaListinoCliente()
{
// se ho cliente, tipo mezzo e tipo servizio allora posso caricare il listino...
	
	  	var f = document.main;
		if(f.id_cliente.value!="" && f.id_cliente.value!="0" && f.id_tipoServizio.value!="" && f.id_tipoMezzo.value!="")
		{
			if (checkFields())
			{
				f.action=f.actionPage.value;
				f.cmd.value="CL";
				f.act.value="";
				Ab.submitAj("main");	
				//f.submit();
			}
		}
		else
		{
			alert("Dati insufficienti!");
		}
	
	
}

function caricaListinoFornitore()
{
// se ho fornitore, tipo mezzo e tipo servizio allora posso caricare il listino...
	
	  	var f = document.main;
		if(f.id_fornitore.value!="" && f.id_fornitore.value!="0" && f.id_tipoServizio.value!="" && f.id_tipoMezzo.value!="")
		{
			if (checkFields())
			{
				f.action=f.actionPage.value;
				f.cmd.value="CLF";
				f.act.value="";
				Ab.submitAj("main");
			}
		}
		else
		{
			alert("Dati insufficienti!");
		}
	
	
}

function vediListinoCliente()
{
//sse ho cliente, tipo mezzo e tipo servizio allora posso caricare il listino...
	
	  	var f = document.main;
		if( $('#id_tipoServizio').val()!="0" || $('#id_tipoMezzo').val()!="")
		{
			//Ab.modalW("Vedi Listino",webApp+"/admin/serv/ListinoServizioStd.abl?cmd=vediListinoCliente&id_tipoServizio="+f.id_tipoServizio.value+"&id_tipoMezzo="+f.id_tipoMezzo.value, 650, 300);
			$('#jQueryWIN').dialog( "option", "width", 700 );
			$('#jQueryWIN').dialog( "option", "height", 500 );
			$( "#jQueryWIN" ).dialog("option", "title", "Listini Disponibili");
			$('#jQueryWIN').load(webApp+"/admin/serv/ListinoServizioStd.abl?cmd=vediListinoCliente&id_tipoServizio="+$('#id_tipoServizio').val()+"&id_tipoMezzo="+$('#id_tipoMezzo').val()).dialog( "open" );		
		}
		else
		{
			alert("Dati insufficienti!");
		}
}

function vediListinoFornitore()
{
//sse ho cliente, tipo mezzo e tipo servizio allora posso caricare il listino...
	
	  	var f = document.main;
		if( f.id_tipoServizio.value!="0" || f.id_tipoMezzo.value!="")
		{
			//Ab.modalW("Vedi Listino",webApp+"/admin/serv/ListinoServizioStd.abl?cmd=vediListinoFornitore&id_tipoServizio="+f.id_tipoServizio.value+"&id_tipoMezzo="+f.id_tipoMezzo.value, 650, 300);
			$('#jQueryWIN').dialog( "option", "width", 700 );
			$('#jQueryWIN').dialog( "option", "height", 500 );
			$("#jQueryWIN").dialog("option", "title", "Listini Disponibili");
			$('#jQueryWIN').load(webApp+"/admin/serv/ListinoServizioStd.abl?cmd=vediListinoFornitore&id_tipoServizio="+$('#id_tipoServizio').val()+"&id_tipoMezzo="+$('#id_tipoMezzo').val()).dialog( "open" );		
		}
		else
		{
			alert("Dati insufficienti!");
		}
}

// 
function mailCommandCRCli()
{
	var f = document.main;
	f.cmd.value="mail";
	f.act.value="docCliCR"
	$('#emailAlternativa').val($('#emailAlt').val());
	f.action=f.actionPage.value;
	
	//Ab.popUp('ELAB')
	Ab.submitAj("main");
	
}
function mailCommandCRFor()
{
	var f = document.main;
	f.cmd.value="mail";
	f.act.value="docForCR"
	$('#emailAlternativa').val($('#emailAlt').val());
	f.action=f.actionPage.value;
	
	//Ab.popUp('ELAB')
	Ab.submitAj("main");
}
function mailCommandCRAut()
{
	var f = document.main;
	f.cmd.value="mail";
	f.act.value="docAutCR"
	$('#emailAlternativa').val($('#emailAlt').val());
	f.action=f.actionPage.value;
	
	//Ab.popUp('ELAB')
	Ab.submitAj("main");
}

function duplica() {
	var v = document.duplica;
	
	var f = document.main;
	
	if(confirm("Vuoi duplicare il servizio?"))
	{
		f.dataInizio.value = v.dataInizio.value;
		f.dataFine.value = v.dataFine.value;
		
		//alert("DI: "+f.dataInizio.value+" DF: "+f.dataFine.value);
		
		f.cmd.value="dupDate";
		f.act.value=""
		f.action=f.actionPage.value;
		
		//Ab.popUp('ELAB')
		Ab.submitAj("main");
	}
}

function dupDate() {
	$( "#duplica" ).dialog( "open" );
}

function applicaTariffaNotturna() {
	var f = document.main;
	checkBoxes();
	checkRadio();
	f.tariffa.value = f.tariffaNotturna.value;
	f.action = f.actionPage.value;
	f.cmd.value = "asq";
	f.act.value = "save";
	Ab.submitAj("main");	
}

function applicaTariffaDiurna() {
	var f = document.main;
	checkBoxes();
	checkRadio();
	f.tariffa.value = f.tariffaDiurna.value;
	f.action = f.actionPage.value;
	f.cmd.value = "asq";
	f.act.value = "save";
	Ab.submitAj("main");	
}

function checkDateRicerca() {
		
	var now = new Date();
	var ret = 1;
	
	//alert($("#dataInizio").val());
	
	if ($("#dataDa").val()!='') {
		var from = $("#dataDa").val().split("/");
		var dataInizio = new Date(from[2], from[1] - 1, from[0]);
		
		if(from[2]!='') {
		
			if (dataInizio.getFullYear()!=now.getFullYear()) {
				if (confirm("L'anno inserito nella data di inizio non corrisponde con quello attuale, vuoi continuare?")) {
					//alert("ok");
					ret = 1;	
				} else {
					//alert("annulla");
					ret = 0;	
				}
			} else {
				// controllo indietro di tre giorni
				now.SustractDays(3);
				
				if (dataInizio.getTime() < now.getTime()){
					if (confirm("Il giorno inserito nella data di inizio e' inferiore di tre giorni dalla data odierna, vuoi continuare?")) {
						//alert("ok");
						ret = 1;	
					} else {
						//alert("annulla");
						ret = 0;	
					}
			
				}
				// controllo avanti di ventotto giorni
				now = new Date();
				now.SustractDays(-28);
				
				if (dataInizio.getTime() > now.getTime()){
					if (confirm("Il giorno inserito nella data di inizio e' superiore di ventotto giorni dalla data odierna, vuoi continuare?")) {
						//alert("ok");
						ret = 1;	
					} else {
						//alert("annulla");
						ret = 0;	
					}
			
				}
				
			}
		}
	} 
	
	if (ret == true) {
		if ($("#dataFine").val()!='') {
			var from = $("#dataFine").val().split("/");
			var dataFine = new Date(from[2], from[1] - 1, from[0]);
	
	
			if(from[2]!='') {
				if (dataFine.getFullYear()!=now.getFullYear()) {
					if (confirm("L'anno inserito nella data di fine non corrisponde con quello attuale, vuoi continuare?")) {
						//alert("ok");
						ret = 1;	
					} else {
						//alert("annulla");
						ret = 0;	
					}	
				} else {
					now = new Date();
					now.SustractDays(3);
	
					if (dataFine.getTime() < now.getTime()){
						if (confirm("Il giorno inserito nella data di fine e' inferiore di tre giorni dalla data odierna, vuoi continuare?")) {
							//alert("ok");
							ret = 1;	
						} else {
							//alert("annulla");
							ret = 0;	
						}
					}
					
					// controllo avanti di ventotto giorni
					now = new Date();
					now.SustractDays(-28);
					
					if (dataFine.getTime() > now.getTime()){
						if (confirm("Il giorno inserito nella data di fine e' superiore di ventotto giorni dalla data odierna, vuoi continuare?")) {
							//alert("ok");
							ret = 1;	
						} else {
							//alert("annulla");
							ret = 0;	
						}
				
					}
				}
			}
		} 
	}
	
	//alert(ret);
	
	return ret==1?true:false;
	
	//return ret;
}

Date.prototype.SustractDays = function (days)
{
	this.setTime(this.getTime() - days * 86400000 );
}

//////////////////////////////////
//// se ho cliente, tipo mezzo e tipo servizio allora posso caricare il listino...
////////////////////////////////////
function caricaListini()
{

	
	  	var f = document.main;
		if(f.id_tipoServizio.value!="" && f.id_tipoMezzo.value!="")
		{
			if (checkFields())
			{
				f.action=f.actionPage.value;
				f.cmd.value="CLA";
				f.act.value="";
				f.currentFocus.value="descrizioneMezzo";
				Ab.submitAj("main");	
				//f.submit();
			}
		}
		else
		{
			alert("Dati insufficienti!");
		}
	
	
}

function closeStampa() {
	$('#stampa').dialog("close");
}

function closeMail() {
	$('#mail').dialog("close");
}

function printCartello()
{
	var f = document.main;


	if (f.id_allegatoClifor.value!=0) {

	var debug=false;
	var wwD="700";
	var whD="500";
	//+"&xxx="+f.xxx.value
	theAction=f.actionPage.value+".pdf?cmd=print&act=cartello"+"&id_servizioStd="+f.id_servizioStd.value;
	//
	//var numLabels=prompt("Numero di etichette da stampare","1");	
	if(debug==false)
	{
		window.open(theAction, "Stampa_Cartello","width="+wwD+",height="+whD+",status=no,resizable=yes,top=100,left=100,scrollbars=yes");
	}
	/*} else {
		alert('Selezionare il modello di stampa!');
	}*/
	} else {
		alert("Inserire il modello da stampare!");	
	}
}

function saveAj()
{
	checkBoxes();
	checkRadio();
	if (checkFields())
		{
			$("#main").attr("action",$("#actionPage").val());
			$("#main input[name=cmd]").val("asq");
			$("#main input[name=act]").val("save");
			Ab.submitAj("main");	
		}
}



/////////////////////////////////////////////////
//////////////////////////////////////////////////
function addAllegato()
/////////////////////////////////////////////
{
       
	var f = document.main;
	f.action=f.actionPage.value;
	if (Ab.validateForm('nomeFile','Nome File','R','flgTipoAllegato','Tipo Allegato','RisNumKey','descrizioneAllegato','Descrizione Allegato','R'))
	{
		checkBoxes();
		f.cmd.value="gr";
		f.act.value="addAllegato";
		f.submit();
		//Ab.submitAj('main');
	}
}

function delAllegato(l_id)
/////////////////////////////////////////////
{
 if (Ab.confirmDelete())
	{      
		var f = document.main;
		f.action=f.actionPage.value;
	//	FACCIO IL SUBMIT
		f.cmd.value="gr";
		f.act.value="delAllegato";
		f.id_allegatoServizio.value=l_id;
		Ab.submitAj('main');
	}

}

function addPadre() {
	$('#padre').dialog('open');
}

function addServizioPadre(l_id) {
	var f = document.main;
	//f.action=f.actionPage.value;
//	FACCIO IL SUBMIT
	//f.cmd.value="addServizioPadre";
	f.id_servizioPadre.value=l_id;
	
	saveCommand();
	//Ab.submitAj('main');
	//f.submit();
    //$('#padre').dialog('close');	
}

function pregeneraFatture() {
	// check dei servizi selezionati
	var id_servizi = 0;
	Ab.setChekBoxValue("main","flgIgnoraRiferimentiDiversi","1","0");
	$("input[name^='ckflgServizio_']").each(function() {
			// faccio la lista dei servizi selezionati da passare alla servlet
		if (this.checked) {
			id_servizi += 1;
		} 
	});
	// apro la dialog oppure mando un messaggio di errore	
	if (id_servizi>0) {
		$("#tipoFattura").dialog("open");	
	} else {
		alert("Selezionare almeno un servizio.");	
	}
}

function generaFatture()
{
	var f = document.main;
		
	if ($("#id_tipoDocumentoD").val()!=0 && $("#flgStatoD").val()) 
	{
		if(confirm("Verranno generate le fatture secondo i criteri di ricerca selezionati. Sei Sicuro?"))
		{
			f.cmd.value="GENFATTDF";
		
			$("#flgStato").val($("#flgStatoD").val());
			$("#id_tipoDocumento").val($("#id_tipoDocumentoD").val());
				
			var id_servizi = "";
			$("input[name^='ckflgServizio_']").each(function() {
				// faccio la lista dei servizi selezionati da passare alla servlet
				if (this.checked) {
					var id = this.name.replace("ckflgServizio_", "");
					
					id_servizi += id + ",";
				} 
			});
			
			f.id_servizi.value = id_servizi;
			
			f.action=f.actionPage.value;
			//data emissione
			$("#dataEmissioneDocumento").val($("#dataED").val())
			Ab.popUp('ELAB')
			Ab.submitAj("main", null, null, "listaFatture()");
		}
	}
	else
	{
		alert("Dati mancanti!");
	}
}

function selezionaTutto() {
	var valore = $("#ckflgSelezionaTutto").attr("checked")=="checked"?true:false; 
	
	$("input[id^='ckflgServizio_']").each(function(index, element) {
		element.checked = valore;
	});
}

////////////////////////////////////////
// callback dopo la generazione delle fatture
////////////////////////////////////////
function listaFatture()
{
	var listaDocumenti 	= $("#listaDocumenti").val(),
		listaDoc 		= listaDocumenti.split("|");
	if (listaDoc.length > 1)
	{
		var tableFatture 	= $("#tableFatture"), 
			righe 			= "";
		
		for (var i = 0; i < listaDoc.length; i++)
		{
			var documento 	= listaDoc[i].split(";"),
				riga 		= "<tr><td><a href='javascript:modifyFattura(" + documento[0] + ")'>" + documento[1] + "</a></td></tr>";
	
			righe += riga;
		}
		
		$(tableFatture).html(righe);
		
		$("#listaFatture").dialog("open");	
	} 
	else
	{ 
		var documento = listaDoc[0].split(";");
		//verifico se arriva qualcosa!!!!
		if(documento[0].length > 1)
			modifyFattura(documento[0]);
	}
}

function modifyFattura(id)
{
	//FACCIO IL SUBMIT
	var f = document.main;
	f.action="Documento.abl";
	f.cmd.value="md";
	f.id_documento.value=id;
	Ab.submitAj('main');
}
