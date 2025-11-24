//
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
	theAction=f.actionPage.value+"?cmd=print&act=report&flgTipoReport="+f.flgTipoReport.value+"&dataDocumentoDa="+f.dataDocumentoDa.value+"&dataDocumentoA="+f.dataDocumentoA.value;
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
{
	var f = document.main;

	 {
		//if(f.nominativoDocumento.value!="")
		//f.id_clifor.value=1;
		return Ab.validateForm('nominativoDocumento','Cliente','R','id_users','Operatore','RisNumKey','cellDocumento','Cellulare avviso','R');

	}	
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
	var l_id_tipoDocumento=Ab.prendiElementoDaId('id_tipoDocumento').value;
	//
	if(l_id_tipoDocumento!=1)
	Ab.setChekBoxValue("dettaglio","flgMantieniArticoloRiga","1","0");
	Ab.setChekBoxValue("dettaglio","flgAutoAdd","1","0");
	Ab.setChekBoxValue("dettaglio","flgSingleLineArt","1","0");
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
		var l_descrizioneRiga=Ab.prendiElementoDaId("descrizioneRiga");
		l_descrizioneRiga.value=l_descrizioneRiga.value.replace(/€/ig,"&euro;");
		
		//alert(f.currentTab.value);
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
	//corrispettivi.... se emetti fattura id_clifor2 è obbligatorio flgEmettiFatturaScontrino
	if(f.id_tipoDocumento.value!=1 || (f.id_tipoDocumento.value==1 &&  f.flgEmettiFatturaScontrino.value==0) ||(f.id_tipoDocumento.value==1 &&  Ab.validateForm('id_clifor2','Cliente/Fornitore','RisNumKey')))
		return Ab.validateForm('id_clifor','Cliente/Fornitore','RisNumKey','descrizioneRiga','Articolo','R','quantita','quantita','RisNum>0','id_iva','codice iva','RisNumKey');
		else
			return false;
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

		return Ab.validateForm('nominativoDocumento','Cliente','R','quantita','quantita','RisNum>0','id_users','Operatore','RisNumKey','cellDocumento','Cellulare avviso','R');
		
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
			Ab.setFocus('nominativoDocumento') 
			
		}
	}
	//alert('pio');
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
	//se non è bolla fattura o nc allora il seriale non lo chiedo (es. ordine)flgTipologia!=3
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
	if(confirm("Verr&agrave; ricalcolato tutto il magazzino. Sei Sicuro?"))
	{
		var f= document.main;
		f.cmd.value="ricalcolaMag";
		Ab.submitAj('main');
	}
	
}

function onFocusSeriale()
{//alert('ofs');
	//se non è bolla fattura o nc allora il seriale non lo chiedo (es. ordine)flgTipologia!=3
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
		//se non è bolla fattura o nc allora il seriale non lo chiedo (es. ordine)flgTipologia!=3
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
		theAction=f.actionPage.value+"?cmd=print&act=lblArt&progDocumento="+f.progDocumento.value+"&id_esercizio="+f.id_esercizio.value+"&id_tipoDocumento="+f.id_tipoDocumento.value+"&id_clifor="+f.id_clifor.value+"&dataDocumentoDa="+f.dataDocumentoDa.value+"&dataDocumentoA="+f.dataDocumentoA.value;
	
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
	checkBoxes();
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
	if(confirm("Verr&agrave; stampato lo scontrino. Sei sicuro?"))
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
	else if(confirm("Verr&agrave; stampato lo scontrino. Sei sicuro?"))
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
	else if(confirm("Lo scontrino verr&agrave; chiuso. Sei sicuro?"))
	{
		Ab.popUp("ELAB_SC");
		f.cmd.value="print";
		f.act.value="chiudiScontrinoESalva";
		f.action=f.actionPage.value;
		Ab.submitAj('main');
	}
}

function generaDocumento()
{
	if(confirm("Verr&agrave; generato il documento relativo. Sei sicuro?"))
	{
		if (checkFields())
		{
			checkBoxes();
			var f = document.main;
			f.cmd.value="generaDocumento";
			f.action=f.actionPage.value;
			Ab.submitAj('main');
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
			f.action=f.actionPage.value;
			Ab.submitAj('main');
		}
		else
		{
			var debug=false;
			var wwD="700";
			var whD="500";
			//+"&xxx="+f.xxx.value
			theAction=f.actionPage.value+"?cmd=print&act=doc"+"&id_documento="+id;
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
	if(qdp.value>qdpMax.value)
		alert("ERRORE! Non puoi prelevare piu' di quanto hai caricato");
	else if (qdp.value<=0)
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
	if(confirm("La riga verr&agrave; chiusa. Sei Sicuro?"))
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
	if(confirm("La riga verr&agrave; aperta nuovamente. Sei Sicuro?"))
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

function mailCommand()
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
		var numLabels=prompt("Numero di etichette da stampare","1");
		var blankLabels=prompt("Numero di etichette da saltare","0");
		theAction=theAction+"&blankLabels="+blankLabels+"&numLabels="+numLabels;
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

function refreshStatoPrenotazione(id)
{
	if(confirm("Attenzione! Stai cambiando lo stato della prenotazione. Sei Sicuro?"))
	{
		var nuovoStato=Ab.prendiElementoDaId("flgStatoPrenotazione_"+id).value;
	
		var f = document.main;
		f.action=f.actionPage.value;
		f.flgStatoPrenotazioneS.value=nuovoStato;
		f.id_documento.value=id;
		f.cmd.value="aggionraSPCR";
		f.flgReport.value="";

		Ab.submitAj('main');
	}
}
function refreshStatoRiparazione(id)
{
	if(confirm("Attenzione! Stai cambiando lo stato della riparazione. Sei Sicuro?"))
	{
		var nuovoStato=Ab.prendiElementoDaId("flgStatoRiparazione_"+id).value;
	
		var f = document.main;
		f.action=f.actionPage.value;
		f.flgStatoRiparazioneS.value=nuovoStato;
		f.id_documento.value=id;
		f.cmd.value="aggionraSRCR";
		f.flgReport.value="";

		Ab.submitAj('main');
	}
}

/////////////////////////////////////////////////
//////////////////////////////////////////////////
function inviaAvviso(l_id)
/////////////////////////////////////////////
{
      
	var f = document.main;
	if(confirm("Verr&agrave; inviato un avviso e impostato lo stato ad INVIATO. Vuoi continuare?"))
	{
		
		f.id_documento.value=l_id;
		f.action=f.actionPage.value;
		f.cmd.value="inviaAvviso";
		Ab.submitAj('main');
	}
}

function stampaSlip()
{
	var f = document.main;
	Ab.setChekBoxValue("ricerca","flgSimulazione","1","0");

	if(f.flgSimulazione.value=="1" ||(f.flgSimulazione.value=="0" && confirm("Simulazione non attivata. Vuoi Continuare?")))
	{
		var debug=false;
		var wwD="700";
		var whD="500";
	
		//+"&xxx="+f.xxx.value
		theAction=f.actionPage.value+".pdf?cmd=print&act=slip&flgSimulazione="+f.flgSimulazione.value+"&progDocumento="+f.progDocumento.value+"&id_esercizio="+f.id_esercizio.value+"&id_tipoDocumento="+f.id_tipoDocumento.value+"&id_clifor="+f.id_clifor.value+"&dataDocumentoDa="+f.dataDocumentoDa.value+"&dataDocumentoA="+f.dataDocumentoA.value+"&id_articolo="+f.id_articolo.value+"&id_articoloVariante="+f.id_articoloVariante.value;

		//
		//var numLabels=prompt("Numero di etichette da stampare","1");
		if(debug==false)
		{
			window.open(theAction, "Stampa_Slip","width="+wwD+",height="+whD+",status=no,resizable=yes,top=100,left=100,scrollbars=yes");
		}
		else
		{
			window.open(theAction); 
		}
		
	}
				
}

function annullaAssegnazionePrenotazione(id)
{
	if(confirm("La prenotazione risulter&agrave; nuovamente ancora in arrivo. Vuoi Continuare?"))
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
	if(confirm("La slip potr&agrave; essere stampata nuovamente. Vuoi continuare?"))
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



