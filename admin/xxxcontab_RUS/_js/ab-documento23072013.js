//funzione per aprire div con id operatore
$(function() {
	$( "#operatore" ).dialog({
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
	$( "#operatore" ).dialog("option", "title", "Seleziona Operatore");
	/////////////////////////////////////////////
	$( "#cassaAdmin" ).dialog({
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
	$( "#cassaAdmin" ).dialog("option", "title", "Chiusura Cassa");
	////////////////
	$( "#jQueryWIN" ).dialog({
	  autoOpen: false,
	  height: 400,
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
	$( "#btn_closer" ).click(function() {
	  $( "#operatore" ).dialog( "close" );
	});
	$( "#btn_elab" ).click(function() {
		if($( "#tipoScontrino" ).val()==1 && $( "#totDocumento" ).val()=="0,00")
			alert("ATTENZIONE! Scontrino a valore zero");
		else
		{
			stampa();
			$( "#operatore" ).dialog( "close" );
		}
	});
	$( "#btn_rgiorno" ).click(function() {
		printReportG();
		$( "#cassaAdmin" ).dialog( "close" );
	});
	$( "#btn_rfina" ).click(function() {
		printReportF();
		$( "#cassaAdmin" ).dialog( "close" );
	});
});
  
function formSearching()
{
		//FACCIO IL SUBMIT
		var f = document.main;
		f.flgReport.value="";
		f.action=f.actionPage.value;
		f.cmd.value="search";
		f.pageNumber.value=1;
		//Ab.submitAj('main');
}
function searching()
{
		//FACCIO IL SUBMIT
		var f = document.main;
		formSearching();
		Ab.submitAj('main');
}

function report()
{
		//FACCIO IL SUBMIT
		var f = document.main;
		f.flgReport.value="S";
		//f.action=webApp+"/tr/Pratica.abl";
		f.cmd.value="search";
		Ab.submitAj('main');
}

function reportPdf()
{
	var debug=false;
	var wwD="700";
	var whD="500";
	var f = document.main;
	checkBoxesCR();
	
	//+"&xxx="+f.xxx.value
	theAction=f.actionPage.value+"?cmd=print&act=report&flgTipoReport="+f.flgTipoReport.value+"&dataDocumentoDa="+f.dataDocumentoDa.value+"&dataDocumentoA="+f.dataDocumentoA.value+"&id_tipo="+f.id_tipo.value;
	//alert(theAction.length);
	//alert(theAction);
	if(f.flgTipoReport.value==8){
		var blankLabels=prompt("Numero di etichette da saltare","0");
		theAction=theAction+"&blankLabels="+blankLabels;
		
	}

	if(debug==false)
	{
		window.open(theAction, "Stampa_Report_","width="+wwD+",height="+whD+",status=no,resizable=yes,top=100,left=100,scrollbars=yes");
	}
	else
	{
		window.open(theAction); 
	}
	
	
}

/////////////////////////////////////////////7
function checkFields()
/////////////////////////////////////////////7
{	//var l_note=Ab.prendiElementoDaId("note");
	//l_note.value=l_note.value.replace(//ig,"€");
	var f = document.main;
	//var l_note=f.note;
	//alert(f.cmd.value);
	Ab.aggiustaInputText(f.note);
	if(f.id_tipoDocumento.value==1 && f.totDocumento.value=="0,00" && f.cmd.value!="applicaListinoDoc"){
		alert("ATTENZIONE! Scontrino a valore zero..");
		return false;xxxxxx
	}

	//if(f.id_tipoDocumento.value==1 && f.flgEmettiFatturaScontrino.value==0 ||  Ab.validateForm('id_clifor2','Cliente/Fornitore2','RisNumKey'))
	if(f.id_tipoDocumento.value!=1 )
		return Ab.validateForm('id_clifor','Cliente/Fornitore','RisNumKey');
	else
		return true;
			
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
	/*var l_id_tipoDocumento=Ab.prendiElementoDaId('id_tipoDocumento').value;
	//
	
	if(l_id_tipoDocumento!=1)
		Ab.setChekBoxValue("dettaglio","flgMantieniArticoloRiga","1","0");
	
	Ab.setChekBoxValue("dettaglio","flgAutoAdd","1","0");
	Ab.setChekBoxValue("dettaglio","flgSingleLineArt","1","0");
	if (document.getElementById('flgIgnoraPrenotazione') )
		Ab.setChekBoxValue("dettaglio","flgIgnoraPrenotazione","1","0");
	*/
	//Ab.setChekBoxValue("dettaglio","flgPagamentoDataFissa","1","0");
	//if(l_id_tipoDocumento==1)
	//	Ab.setChekBoxValue("dettaglio","flgEmettiFatturaScontrino","1","0");

}

function checkRadio()
{
	//Ab.setRadioButtonValue("dettaglio","flgPlaAntPos");
}

function checkBoxesCR()
/////////////////////////////////////////////
{
	//Ab.setChekBoxValue("ricerca","flgSommaCRL","1","0");
}

function checkRadioCR()
{
	//Ab.setRadioButtonValue("ricerca","flgPlaAntPos");

}
/////////////////////////////////////////////////
//////////////////////////////////////////////////
function addRigaArticolo()
/////////////////////////////////////////////
{
	// 1 FT fatt vendita
	//2  FB fattura accompagnatoria
	//3 fa fattura acquisto
	//4 bo bolla di accompagnamento
	//5 prenotazione
	//Ab.prendiElementoDaId("ADDRIGA").disable;
	
	{
		var f = document.main;
		
		checkBoxes();
		f.action=f.actionPage.value;
		var cf;
		//gestione euro
		Ab.aggiustaInputText(f.descrizioneRiga);
		Ab.aggiustaInputText(f.notaRigaDocumento);
		if (document.getElementById('notaBarcode') )
			Ab.aggiustaInputText(f.notaBarcode);
		
		//alert(f.flgTipologia.value);
		//alert(f.flgClienteFornitore.value);
		
		if(f.flgTipologia.value==4)
		{
			
		  cf= checkCPrenotazione();
		}
		else{
			if(f.flgClienteFornitore.value=="F")
				cf= checkF();
			else if(f.flgClienteFornitore.value=="C")
				cf=checkC();
			else if(f.flgClienteFornitore.value=="A")
				cf=checkA();
			else {
				cf=false;
				alert("ERRORE! Tipo documento no valido");
			}
		}
			
		if (cf)
		{
			f.cmd.value="gr";
			f.act.value="addRigaArticolo";
			//f.flgCaricaArticoli.value=1;
			Ab.popUp("ELAB");
			Ab.submitAj('main');
		}
	}
	
	
}

function checkF()
{//alert('f');

	var f = document.main;
	if(f.flgUsaSeriale.value==1 && document.main.flgTipologia.value!=3 &&  !Ab.validateForm('seriale','Seriale articolo','R'))
			return false;
	//imponibile in rosso
	if(f.imponibile.value=="0,00" || f.imponibile.value=="")
	{
	  	var theIdStyle = document.getElementById('imponibile').style;
  		theIdStyle.backgroundColor="#ff0000";	
	}
	return Ab.validateForm('id_clifor','Fornitore','RisNumKey','quantita','quantita','RisNum>0','id_iva','codice iva','RisNumKey');
}

function checkC()
{//alert('C');
	var f = document.main;
	if(f.flgUsaSeriale.value==1 && document.main.flgTipologia.value!=3 &&  !Ab.validateForm('seriale','Seriale articolo','R'))
			return false;
	//prezzoPubblicoConIva in rosso
	if(f.prezzoPubblicoConIva.value=="0,00" || f.prezzoPubblicoConIva.value=="")
	{
	  	var theIdStyle = document.getElementById('prezzoPubblicoConIva').style;
  		theIdStyle.backgroundColor="#ff0000";	
	}
	//corrispettivi.... se emetti fattura id_clifor2  obbligatorio flgEmettiFatturaScontrino
	//s09-02-2010 viene chamato da add riga... non controllo id_clilfor2
//	if(f.id_tipoDocumento.value!=1 || (f.id_tipoDocumento.value==1 &&  f.flgEmettiFatturaScontrino.value==0) ||(f.id_tipoDocumento.value==1 &&  //Ab.validateForm('id_clifor2','Cliente/Fornitore','RisNumKey')))
		return Ab.validateForm('id_clifor','Cliente/Fornitore','RisNumKey','descrizioneRiga','Articolo','R','quantita','quantita','RisNum>0','id_iva','codice iva','RisNumKey');
//		else
//			return false;
}

function checkCPrenotazione()
{//alert('C');

	var f = document.main;

	//prezzoPubblicoConIva in rosso
	if(f.prezzoPubblicoConIva.value=="0,00" || f.prezzoPubblicoConIva.value=="")
	{
	  	var theIdStyle = document.getElementById('prezzoPubblicoConIva').style;
  		theIdStyle.backgroundColor="#ff0000";	
	}

		return Ab.validateForm('nominativoDocumento','Cliente','R','descrizioneRiga','Articolo','R','quantita','quantita','RisNum>0','id_users','Operatore','RisNumKey','cellDocumento','Cellulare avviso','R');
		
}


function checkA()
{
	//alert('A');
		return Ab.validateForm('id_clifor','Cliente/Fornitore','RisNumKey','id_articolo','Articolo','RisNumKey','quantita','quantita','RisNum>0','id_iva','codice iva','RisNumKey');
	
}

function delRigaArticolo(l_id)
/////////////////////////////////////////////
{
 if (Ab.confirmDelete())
	{      
		var f = document.main;
		checkBoxes();
		f.action=f.actionPage.value;
	//	FACCIO IL SUBMIT
		f.cmd.value="gr";
		f.act.value="delRigaArticolo";
		f.id_rigaDocumento.value=l_id;
		//f.flgCaricaArticoli.value=1;
		Ab.submitAj('main');
	}

}

function modRigaArticolo(l_id)
/////////////////////////////////////////////
{

		var f = document.main;
		checkBoxes();
		f.action=f.actionPage.value;
	//	FACCIO IL SUBMIT
		f.cmd.value="gr";
		f.act.value="modRigaArticolo";
		f.id_rigaDocumento.value=l_id;
		//f.flgCaricaArticoli.value=1;
		Ab.submitAj('main');

}
		
function cambiaFocus()
{
	var f = document.main;
	var l_id_tipoDocumento=Ab.prendiElementoDaId('id_tipoDocumento').value;
	var l_id_clifor=Ab.prendiElementoDaId('id_clifor').value;
	checkBoxes();
	if(l_id_tipoDocumento==1 ||l_id_clifor>0 )
	{
		if(f.flgMantieniArticoloRiga.value==1 && f.flgUsaSeriale.value==1)
			Ab.setFocus('seriale') 
		else
			Ab.setFocus('searchArticolo') 
	}
	else
	{
		if(f.currentTab.value=="RIGHE")
		{
		if(f.flgMantieniArticoloRiga.value==1 && f.flgUsaSeriale.value==1)
			Ab.setFocus('seriale') 
		else
			Ab.setFocus('searchArticolo') 
	
		}
		else
		{
			Ab.setFocus('descrizioneClifor') 
			
		}
	}
}
function beep()
{
	var theBeep;
	if (ns4 || mz7){

  var theIdStyle = document.getElementById('seriale').style;
  theIdStyle.backgroundColor="#ff0000";
  }
	else
	{
		theBeep=Ab.prendiElementoDaId('beep');
		theBeep.src='../../_sounds/left.wav';
	}
	
	//document.all.beep.src='../../_sounds/left.wav';
            
}

function descRigaKeyUp(theEvent)
{
	//se non  bolla fattura o nc allora il seriale non lo chiedo (es. ordine)flgTipologia!=3
	////dovrei verificare getTipoCaricoScarico=0-- anagrafiche chiedo seriale
	if(document.main.flgUsaSeriale.value==1 && document.main.flgTipologia.value!=3)
	{
		focusNextOnCr(theEvent,'seriale');
		beep();
	}
	else 
		focusNextOnCr(theEvent,'quantita') ;
}

function saveConferma()
{
	
var f= document.main;
f.flgStato.value=1;
saveCommand();
}

function ricalcolaMag()
{
	if(confirm("Verra' ricalcolato tutto il magazzino. Sei Sicuro?"))
	{
		var f= document.main;
		f.cmd.value="ricalcolaMag";
		Ab.submitAj('main');
	}
	
}

function onFocusSeriale()
{//alert('ofs');
	//se non  bolla fattura o nc allora il seriale non lo chiedo (es. ordine)flgTipologia!=3
	////dovrei verificare getTipoCaricoScarico=0-- anagrafiche chiedo seriale
	if(document.main.flgUsaSeriale.value==1 && document.main.flgTipologia.value!=3)
	{
		Ab.prendiElementoDaId('seriale').select();
		beep();
	}
	else 
	{
		checkBoxes();
		if(Ab.prendiElementoDaId('seriale').value!="" && Ab.prendiElementoDaId('flgAutoAdd').value==1)
		{
			addRigaArticolo();
		}
		else
			Ab.prendiElementoDaId('quantita').focus() ;
	}
	
}


function onFocusDescRiga()
{//alert('ofds');
	checkBoxes();
	if(Ab.prendiElementoDaId("id_articolo").value>0 && Ab.prendiElementoDaId("descrizioneRiga").value!="" && Ab.prendiElementoDaId('flgAutoAdd').value==1)
	{
		addRigaArticolo();
	}
	else
	{
		//se non  bolla fattura o nc allora il seriale non lo chiedo (es. ordine)flgTipologia!=3
		//dovrei verificare getTipoCaricoScarico=0-- anagrafiche chiedo seriale tipoCaricoScarico==0 
		if(document.main.flgUsaSeriale.value==1 && document.main.flgTipologia.value!=3)
		{
			Ab.prendiElementoDaId('descrizioneRiga').select();
			beep();
		}
		else 
		{
			//Ab.prendiElementoDaId('quantita').focus() ;
		}
	}
}

function onKeyUpSeriale(theEvent)
{
	var keyCode = theEvent.keyCode; 
	if(keyCode==13) 
	{
		checkBoxes();
		if(Ab.prendiElementoDaId('flgAutoAdd').value==1)
		{
			addRigaArticolo();
		}
		else
			Ab.prendiElementoDaId('quantita').focus() ;
	}
	
	
}



function labelD()
{
		var f = document.main;
	
	{
		var debug=false;
		var wwD="700";
		var whD="500";
	
		//+"&xxx="+f.xxx.value
		theAction=f.actionPage.value+"?cmd=print&act=lblArt"+"&id_documento="+f.id_documento.value;
	
		//
		//var numLabels=prompt("Numero di etichette da stampare","1");
		var blankLabels=prompt("Numero di etichette da saltare","0");
		theAction=theAction+"&blankLabels="+blankLabels;//+"&numLabels="+numLabels;
		if(debug==false)
		{
			window.open(theAction, "Stampa_Etichette_Documento_Articolo","width="+wwD+",height="+whD+",status=no,resizable=yes,top=100,left=100,scrollbars=yes");
		}
		else
		{
			window.open(theAction); 
		}
		
	}
				
}
function labelCR()
{
		
	var f = document.main;
	
	if(confirm("Verranno stampate le etichette di tutti i documenti relativi al criteri di ricerca selezionato. Sei sicuro?"))
	{
		var debug=false;
		var wwD="700";
		var whD="500";
	
		//+"&xxx="+f.xxx.value
		theAction=f.actionPage.value+"?cmd=print&act=lblArt"+"&progDocumento="+f.progDocumento.value+"&id_esercizio="+f.id_esercizio.value+"&id_tipoDocumento="+f.id_tipoDocumento.value+"&id_clifor="+f.id_clifor.value+"&dataDocumentoDa="+f.dataDocumentoDa.value+"&dataDocumentoA="+f.dataDocumentoA.value;
	
		//
		//var numLabels=prompt("Numero di etichette da stampare per articolo","1");
		var blankLabels=prompt("Numero di etichette da saltare","0");
		theAction=theAction+"&blankLabels="+blankLabels;//+"&numLabels="+numLabels;
		if(debug==false)
		{
			window.open(theAction, "Stampa_Etichette_Articolo","width="+wwD+",height="+whD+",status=no,resizable=yes,top=100,left=100,scrollbars=yes");
		}
		else
		{
			window.open(theAction); 
		}
		
	}
				
}

function emettiFatturaClick()
{alert('old');
	checkBoxes();
	var rowCliente=Ab.prendiElementoDaId('CLIENTE');
	var l_flgEmettiFatturaScontrino=Ab.prendiElementoDaId('flgEmettiFatturaScontrino').value;
	if(l_flgEmettiFatturaScontrino==1)
	{
		rowCliente.style.display="table-row";
	}
	else
	{
		rowCliente.style.display="none";
		//non cancello niente... lo devo fare se salvo 'gniosa

	}
	
}
function emettiDocumentoChange()
{
	
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

function ristampaScontrino()
{	checkBoxes();
	var f = document.main;
	if(f.totDocumento.value=="0,00")
		alert("ATTENZIONE! Scontrino a valore zero");
	else	
	if(flgEmettiFatturaScontrino.value>0)
		alert('ATTENZIONE! Stai emettendo una fattura. Non puoi stampare lo scontrino');
	else
	if(confirm("Verra' stampato lo scontrino. Sei sicuro?"))
	{
		Ab.popUp("ELAB_SC");
		f.cmd.value="print";
		f.act.value="ristampaScontrino";
		f.action=f.actionPage.value;
		Ab.submitAj('main');
	}
}


function saveScontrino()
{
	checkBoxes();
	var f = document.main;

	if(f.totDocumento.value=="0,00")
		alert("ATTENZIONE! Scontrino a valore zero");
	else
	if(flgEmettiFatturaScontrino.value>0)
		alert('ATTENZIONE! Stai emettendo una fattura. Non puoi stampare lo scontrino');
	else if(confirm("Verra' stampato lo scontrino. Sei sicuro?"))
	{
		Ab.popUp("ELAB_SC");
		f.cmd.value="print";
		f.act.value="stampaScontrinoESalva";
		f.action=f.actionPage.value;
		Ab.submitAj('main');
	}
}

function chiudiScontrino()
{
	checkBoxes();
	var f = document.main;
	//if(f.totDocumento.value=="0,00")
	//	alert("ATTENZIONE! Scontrino a valore zero");
	//else
	if(flgEmettiFatturaScontrino.value>0)
		alert('ATTENZIONE! Stai emettendo una fattura. Non puoi chiudere lo scontrino');
	else if(confirm("Lo scontrino verra' chiuso. Sei sicuro?"))
	{
		Ab.popUp("ELAB_SC");
		f.cmd.value="print";
		f.act.value="chiudiScontrinoESalva";
		f.action=f.actionPage.value;
		Ab.submitAj('main');
	}
}

function generaDocumentoDaScontrino()
{
	var f = document.main;
	if(f.flgEmettiFatturaScontrino.value=="")
		alert("Seleziona il tipo di documento da generare");
	else if(f.id_cliforListino.value=="" || f.id_cliforListino.value=="0")
		alert("Seleziona un cliente per poter generare un documento")
	else 
	{
		if(confirm("Verra' generato il documento relativo. Sei sicuro?"))
		{
			if (checkFields())
			{
				checkBoxes();
				
				f.cmd.value="generaDocumentoDaScontrino";
				f.action=f.actionPage.value;
				Ab.submitAj('main');
			}
		}
	}
}
function generaDocumento()
{
	var f = document.main;
	if(f.flgEmettiFatturaScontrino.value=="")
		alert("Seleziona il tipo di documento da generare");
	else if(f.id_clifor2.value=="" || f.id_clifor2.value=="0")
		alert("Seleziona un cliente per poter generare un documento")
	else 
	{
		if(confirm("Verra' generato il documento relativo. Sei sicuro?"))
		{
			if (checkFields())
			{
				checkBoxes();
				
				f.cmd.value="generaDocumentoDaScontrino";
				f.action=f.actionPage.value;
				Ab.submitAj('main');
			}
		}
	}
}

function printCommand()
{
	var f = document.main;
	 stampaDocumento(f.id_documento.value);
}

function stampaDocumento(id)
{

	if(id!=0)
	{
		var f = document.main;
		if(f.flgTipoStampa.value==10)
		{
			f.cmd.value="print";
			f.act.value="doc";
			f.action=f.actionPage.value+".pdf";
			Ab.submitAj('main');
		}
		else
		{
			var debug=false;
			var wwD="700";
			var whD="500";
			//+"&xxx="+f.xxx.value
			theAction=f.actionPage.value+".pdf?cmd=print&act=doc"+"&id_documento="+id;
			//
			//var numLabels=prompt("Numero di etichette da stampare","1");	
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
	
}

function prelevaArticolo(id)
{
	
	var f = document.main;
	f.cmd.value="gr";
	f.act.value="prelevaArticolo";
	f.id_rigaDocumentoDaPrelevare.value=id;
	var qdp=document.getElementById('qtaDaPrelevare_'+id);
	var qdpMax=document.getElementById('qtaDaPrelevareMax_'+id);
	var qdpVal=parseFloat(qdp.value);
	var qdpMaxVal=parseFloat(qdpMax.value);
	
	if(qdpVal>qdpMaxVal)
		alert("ERRORE! Non puoi prelevare piu' di quanto hai caricato");
	else if (qdpVal<=0)
		alert("ERRORE! Quantita' non valida!")
	else
	{
		f.qtaDaPrelevare.value=qdp.value;
		Ab.submitAj('main');
	}
}


function delArticoloPrelevato(id_rd, id_rdP)
{
	if(confirm("Sei Sicuro?"))
	{
		var f = document.main;
		f.cmd.value="gr";
		f.act.value="delPrelevaArticolo";
		f.id_rigaDocumento.value=id_rd;
		f.id_rigaDocumentoPrelevata.value=id_rdP;
		Ab.submitAj('main');
	}
	
}

function impostaRigaChiusa(l_id)
{
	if(confirm("La riga verra' chiusa. Sei Sicuro?"))
	{
		var f = document.main;
		checkBoxes();
		f.action=f.actionPage.value;
	//	FACCIO IL SUBMIT
		f.cmd.value="gr";
		f.act.value="chiudiRigaArticolo";
		f.id_rigaDocumento.value=l_id;
		//f.flgCaricaArticoli.value=1;
		Ab.submitAj('main');
	}
	
}
function impostaRigaAperta(l_id)
{
	if(confirm("La riga verra' aperta nuovamente. Sei Sicuro?"))
	{
		var f = document.main;
		checkBoxes();
		f.action=f.actionPage.value;
	//	FACCIO IL SUBMIT
		f.cmd.value="gr";
		f.act.value="apriRigaArticolo";
		f.id_rigaDocumento.value=l_id;
		//f.flgCaricaArticoli.value=1;
		Ab.submitAj('main');
	}
	
}

function filtraRighe()
{
	var f = document.main;
	f.action=f.actionPage.value;
	f.cmd.value="md";
	f.pageNumber_righe.value=1;
	Ab.submitAj('main');

}

function mailCommandOld()
{
		//FACCIO IL SUBMIT
		if(confirm("Vuoi mandare il documento via email?"))
		{
			var f = document.main;
			f.action=f.actionPage.value;
			f.eMailInvio.value=prompt("Inserisci l'indirizzo di posta elettronica",f.eMailInvio.value);
			//alert('pio_'+f.eMail.value);
			if(f.eMailInvio.value!='null')
			{
				Ab.popUp("ELAB");
				f.cmd.value="mail";
				Ab.submitAj('main');
			}
		}
}


function mailCommandCR()
{
		//FACCIO IL SUBMIT
		if(confirm("Vuoi mandare i documenti selezionati via email?"))
		{
			var f = document.main;
			f.action=f.actionPage.value;
			f.eMailInvio.value=prompt("Inserisci l'indirizzo di posta elettronica",f.eMailInvio.value);
			//alert('pio_'+f.eMail.value);
			if(f.eMailInvio.value!='null')
			{
				Ab.popUp("ELAB");
				f.cmd.value="mail";
				Ab.submitAj('main');
			}
		}
}

/////////////////////////////////////////////////
//////////////////////////////////////////////////
function documentoPagato(id)
/////////////////////////////////////////////
{
      
	var f = document.main;
//	if( Ab.validateForm2('main','dataFatturazione','Data Fatturazione','R'))
	{
		if(confirm("Vuoi rendere il documento pagato?"))
		
		{	checkRadioCR();
			f.action=f.actionPage.value;
			f.cmd.value="docPagato";
			//f.act.value="view";
			f.id_documento.value=id;
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
	var l_id_iva=Ab.prendiElementoDaId('id_reparto_'+f.id_reparto.value).value;
	f.id_iva.value=l_id_iva;

}


function labelAccD()
{
		var f = document.main;
	
	{
		var debug=false;
		var wwD="700";
		var whD="500";
	
		//+"&xxx="+f.xxx.value
		theAction=f.actionPage.value+"?cmd=print&act=lblArtAcc"+"&id_documento="+f.id_documento.value;
	
		//
		//var numLabels=prompt("Numero di etichette da stampare","1");
		var blankLabels=prompt("Numero di etichette da saltare","0");
		theAction=theAction+"&blankLabels="+blankLabels;//+"&numLabels="+numLabels;
		if(debug==false)
		{
			window.open(theAction, "Stampa_Etichette_Accessori_Articolo","width="+wwD+",height="+whD+",status=no,resizable=yes,top=100,left=100,scrollbars=yes");
		}
		else
		{
			window.open(theAction); 
		}
		
	}
				
}
function refreshDocumento()
{

	var l_flgPagamentoDataFissa=Ab.prendiElementoDaId("flgPagamentoDataFissa");
	var l_tipoPagamento=Ab.prendiElementoDaId("id_tipoPagamento");
	var l_dataScadenzaPagamento=Ab.prendiElementoDaId("dataScadenzaPagamento");
	var l_dataScadenzaPagamentoDP=Ab.prendiElementoDaId("dataScadenzaPagamentoDP");
	
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

function reso()
{
	var f = document.main;
	f.flgInserisciReso.value=1;
	refresh();
	
}

function cassa()
{
	var f = document.main;
	f.flgInserisciReso.value=0;
	refresh();

	
}

function refreshResto()
{
		var f = document.main;
		var contantiF=f.contanti.value;
		var totDocN=stringToNumber(f.totDocumento.value);
				
		var contantiN=stringToNumber(contantiF);
		{
			if(contantiN==0||contantiN=="" || isNaN(contantiN) ||contantiN==""|| isNaN(totDocN) ){
				f.resto.value="";
				
			}
			else{			
				
				f.resto.value=formatNumb(-(totDocN-contantiN),2);
			}
			
		}
		
}
function hideCr()
{
	//var theImgDown = document.getElementById("imgDown").style;
	//	theImgDown.display = "block"; 
	var theNoCrStyl = document.getElementById("NOCR").style;
		theNoCrStyl.display = "block"; 
	var theCrStyl = document.getElementById("CR").style;
		theCrStyl.display = "none"; 

		
}

function showCr()
{
		var theNoCrStyl = document.getElementById("NOCR").style;
		theNoCrStyl.display = "none"; 
		var theCrStyl = document.getElementById("CR").style;
		theCrStyl.display = "block"; 
//	var theImgDown = document.getElementById("imgDown").style;
//		theImgDown.display = "none"; 
		
}

function creaCodaSms()
{
		//FACCIO IL SUBMIT
	if(confirm("ATTENZIONE!! Verra' creato un messaggio sms per ogni articolo sugli scontrini secondo il criterio di ricerca impostato basandosi sul numero seriale come numero di telefono. Vuoi continuare?"))
	{
		var f = document.main;
		if(f.testoMessaggio.value=="")
			alert("ERRORE! Testo del messaggio vuoto");
		else
		{
			//alert(f.testoMessaggio.value);
			//f.flgReport.value="S";
			//f.action=webApp+"/tr/Pratica.abl";
			f.action=f.actionPage.value;
			f.cmd.value="creaCodaSms";
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
	f.action=f.actionPage.value;
	if (Ab.validateForm('nomeFile','Nome File','R'))
	{
		checkBoxes();
		f.cmd.value="gr";
		f.act.value="addAllegato";
		Ab.submitAj('main');
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
		f.id_allegatoDocumento.value=l_id;
		Ab.submitAj('main');
	}

}

function costoView()
{
	var f=document.main;
	if(f.id_articolo.value==0 || f.id_articolo.value=="")
		alert("Seleziona un articolo!")
	else
	{
		alert("Ultimo Prezzo Acquisto: "+f.costoUltimo.value);
		
	 	//modalWin=dhtmlwindow.open('modalW', 'div', 'ultimoCosto', "Ultimo prezzo di acquisto", 'width=220px,height=10px,left=400px,top=250px,resize=0,scrolling=0');
	}
		 
}

function applicaListino()
{
	var f = document.main;
	//if(f.id_cliforListino.value==0 || f.id_cliforListino.value=="")
	//	alert("Seleziona un Cliente per applicare un listino!")
	//else
	{
		
		
		{
			//if (checkFields())
			{
			
			checkBoxes();
			checkRadio();
			f.action=f.actionPage.value;
			f.cmd.value="applicaListino";
			f.prtCommand.value=0;
			Ab.submitAj('main');
			}
		}
	}
		 
}

function applicaListinoDoc()
{
	var f = document.main;
	
	
	//if(f.id_cliforListino.value==0 || f.id_cliforListino.value=="")
	//	alert("Seleziona un Cliente per applicare un listino!")
	//else
	{
		
		
		{
			if (checkFields())
			{
			f.cmd.value="applicaListinoDoc";
			checkBoxes();
			checkRadio();
			f.action=f.actionPage.value;
			
			f.prtCommand.value=0;
			Ab.submitAj('main');
			}
		}
	}
		 
}

function aggiungiSeriale()
{
		var f = document.main;
		if(f.serialeS.value=="")
			alert('Inserire un seriale valido');
		else
		{
			checkBoxes();
			checkRadio();
			f.cmd.value="gr";
			f.act.value="addSeriale";
			//f.flgCaricaArticoli.value=1;
			Ab.popUp("ELAB");
			Ab.submitAj('main');
			
			
			
		}

	
	
	
}
function mailCommand()
{
	var f = document.main;
	// stampaDocumento(f.id_servizioStd.value, 'docFor');
	modalWin=dhtmlwindow.open('modalW', 'div', 'mail', "Email Fattura ", 'width=410px,height=160px,left=400px,top=250px,resize=0,scrolling=0');
	
}
function mailCommandCliFor()
{

	var f = document.main;
	f.cmd.value="mail";
	f.act.value="clifor"
	f.action=f.actionPage.value;
	
	//Ab.popUp('ELAB')
	Ab.submitAj('main');
	
}
function mailCommandExt()
{
	var f = document.main;
	f.cmd.value="mail";
	f.act.value="ext"
	//email invi
	var m= document.divMail.eMailInvioDiv.value;;
	f.eMailInvio.value=m;
	f.action=f.actionPage.value;
	
	//Ab.popUp('ELAB')
	Ab.submitAj('main');
}

function mailCommandWeb()
{
		//FACCIO IL SUBMIT
		if(confirm("Vuoi mandare l'ordine web via email?"))
		{
			var f = document.main;
			f.action=f.actionPage.value;
			Ab.popUp("ELAB");
			f.cmd.value="mail";
			f.act.value="web"
			Ab.submitAj('main');
		}
}

function printScontrinoNF()
{
	//checkBoxes();
	var f = document.main;
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

	theSvlt="Documento.abl?cmd=print&act=stampaScontrinoNonFiscale&id_documento="+f.id_documento.value+"&id_oper="+f.id_oper.value;
	sendAjaxGet2(theSvlt,"messaggi");
	
	//f.operatore.style="display:none";
	
}

function printReportF()
{
	checkBoxes();
	var f = document.main;
	if(confirm("Vuoi stampare il report finanziario?")) {
/*		Ab.popUp("ELAB_SC");
		f.cmd.value="print";
		f.act.value="stampaReportFinanziario";
		f.action=f.actionPage.value;
		Ab.submitAj('main');  */
		
		theSvlt="Documento.abl?cmd=print&act=stampaReportFinanziario&id_documento="+f.id_documento.value;
		sendAjaxGet2(theSvlt,"messaggi");
		
	}
}

function printReportG()
{
	checkBoxes();
	var f = document.main;
	if(confirm("Vuoi stampare il report giornaliero? N.B. non sar pi possibile stampare il report finanziario.")) {
/*		Ab.popUp("ELAB_SC");
		f.cmd.value="print";
		f.act.value="stampaReportGiornaliero";
		f.action=f.actionPage.value;
		Ab.submitAj('main');
*/

		theSvlt="Documento.abl?cmd=print&act=stampaReportGiornaliero&id_documento="+f.id_documento.value;
		sendAjaxGet2(theSvlt,"messaggi");
	}
}

function cassaAdmin()
{
	//var f = document.main;
	// stampaDocumento(f.id_servizioStd.value, 'docFor');
//	modalWin=dhtmlwindow.open('modalW', 'div', 'cassaAdmin', "Admin Cassa ", 'width=410px,height=160px,left=400px,top=250px,resize=0,scrolling=0');

    $( "#cassaAdmin" ).dialog( "open" );

}

function modifyClifor()
{
		//FACCIO IL SUBMIT
		var f = document.main;
		f.action="../anag/Cliente.abl";
		f.cmd.value="md";
		f.id_clifor.value=f.id_cliforListino.value;
		Ab.submitAj('main');
}

function operatoreESalva(tipoScontrino) {
	//var f = document.operatore;
	if(tipoScontrino==1 && $( "#totDocumento" ).val()=="0,00")
		alert("ATTENZIONE! Scontrino a valore zero");
	else
	{
		//scrivo il tipo scontrino passato dalla funzione specifica nel campo nascosto della form operatore
		//f.tipoScontrino.value = tipoScontrino;
		
		/*modalWin=dhtmlwindow.open('modalW', 'div', 'operatore', "Selezione Operatore", 				'width=410px,height=160px,left=400px,top=250px,resize=0,scrolling=0');		*/
			
		$( "#operatore" ).dialog( "open" );
		//passo il parametro alla div
		$( "#tipoScontrino" ).val(tipoScontrino);	  
	}
}

function stampa() {
	var f = document.main;
	var op = document.opera;	

	//scrivo l'operatore selezionato dalla combo nel campo nascosto della form dettaglio
	f.id_oper.value = op.id_operatore.value;

	//in base al tipo scontrino richiamo la funzione di stampa
	if (op.tipoScontrino.value==1)
		saveScontrino();
	else if (op.tipoScontrino.value==2) 
		printScontrinoNF();	
	else if (op.tipoScontrino.value==3)	
		chiudiScontrino();
	else if (op.tipoScontrino.value==4)		
  	    generaDocumentoDaScontrino();
}

function apriCassa()
{
	theSvlt="Documento.abl?cmd=print&act=apriCassa";
	sendAjaxGet2(theSvlt,"messaggi");
}

function ristampaScontrini() {
	var f = document.main;
	if(confirm("Vuoi ristampare gli scontrini in lista?")) {
		//Ab.popUp("ELAB_SC");
		f.cmd.value="print";
		f.act.value="ristampaListaScontrini";
		f.action=f.actionPage.value;
		Ab.submitAj('main');
	}
}

function inserisciBarcode() {
	if(event.keyCode == 13){ 
		if($( "#tipoScontrino" ).val()==1 && $( "#totDocumento" ).val()=="0,00")
			alert("ATTENZIONE! Scontrino a valore zero");
		else
		{
			stampa();
			$( "#operatore" ).dialog( "close" );
		}	
	}
}

function prenotazioni()
{
	var f = document.main;
	$( "#jQueryWIN" ).dialog("option", "title", "Lista Prenotazioni");
//	$( "#jQueryWIN" ).dialog("option", "width", 1000);
//	$( "#jQueryWIN" ).dialog("option", "height", 400);
    $( "#jQueryWIN" ).load(f.actionPage.value+"?cmd=listaPrenotazioni");
	$( "#jQueryWIN" ).dialog( "open" );

}

function annullaAssegnazionePrenotazione(id)
{
	if(confirm("La prenotazione risulterà nuovamente ancora in arrivo. Vuoi Continuare?"))
	{
		var f = document.main;
		f.action=f.actionPage.value;
		//alert(f.action);
		f.cmd.value="annAssPren";
		f.act.value="";
		f.id_rigaDocumento.value=id;
		Ab.submitAj('main');
	}

	
}

function annullaSlip(id)
{
	if(confirm("La slip potrà essere stampata nuovamente. Vuoi continuare?"))
	{
		var f = document.main;
		f.action=f.actionPage.value;
		//alert(f.action);
		f.cmd.value="annullaSlip";
		f.act.value="";
		f.id_rigaDocumento.value=id;
		Ab.submitAj('main');
	}

	
}

function listaFigli(l_id_riga)
{
	var f = document.main;
	$( "#jQueryWIN" ).dialog("option", "title", "Lista Documenti Figli");
//	$( "#jQueryWIN" ).dialog("option", "width", 500);
//	$( "#jQueryWIN" ).dialog("option", "height", 200);
    $( "#jQueryWIN" ).load(f.actionPage.value+"?cmd=listaFigli&id_rigaDocumento="+l_id_riga);
	$( "#jQueryWIN" ).dialog( "open" );
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