/////////////////////////////////////////////////
//////////////////////////////////////////////////
function addRigaTessuto()
/////////////////////////////////////////////
{
	//prima cosa salvo le quantità sui campi hidden
	//alert('pio');
	//1 FT fatt vendita
	//2 FB fattura accompagnatoria
	//3 fa fattura acquisto
	//4 bo bolla di accompagnamento
	//5 prenotazione
	//Ab.prendiElementoDaId("ADDRIGA").disable;

	{
		var f = document.main;

		//checkBoxes();
		f.action = f.actionPage.value;
		var cf;
		//gestione euro
		Ab.aggiustaInputText(f.descrizioneRiga);
		Ab.aggiustaInputText(f.notaRigaDocumento);
		if (document.getElementById('notaBarcode'))
			Ab.aggiustaInputText(f.notaBarcode);

		//alert(f.flgTipologia.value);
		//alert(f.flgClienteFornitore.value);
		//aggiorniamo la quantiaa
		//Tessuto SOLO MT!!!!!!!


		//$("#quantita").val($("#kgT").val());
		$("#quantita").val($("#mtT").val());



		//CONTROLLO CAMPI OBBLIGATORI

		if (f.flgClienteFornitore.value == "F")
			cf = checkTessutoF();
		else if (f.flgClienteFornitore.value == "C")
			cf = checkTessutoC();
		else if (f.flgClienteFornitore.value == "A")
			cf = checkTessutoA();
		else {
			cf = false;
			alert("ERRORE! Tipo documento no valido");
		}


		if (cf) {
			f.cmd.value = "addRigaTessuto";
			//f.act.value="addRigaTessuto";
			$("#currentFocus").val("searchArticolo");
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
function checkTessutoF() {
	//alert('f');
	var f = document.main;
	if (f.flgUsaSeriale.value == 1 && document.main.flgTipologia.value != 3 && !Ab.validateForm('seriale', 'Lotto', 'R'))
		return false;
	//imponibile in rosso
	if (f.imponibile.value == "0,00" || f.imponibile.value == "") {
		var theIdStyle = document.getElementById('imponibile').style;
		theIdStyle.backgroundColor = "#ff0000";
	}

	var checkMag = true;
	if ($("#isMagPartenza").val() == "true") {
		checkMag = Ab.validateForm('id_magFisicoPartenza', 'Magazzino Partenza', 'RisNumKey');
	}

	if (checkMag) {
		if ($("#isMagArrivo").val() == "true") {
			checkMag = Ab.validateForm('id_magFisicoArrivo', 'Magazzino Arrivo', 'RisNumKey');
		}
	}
	if (checkMag) {

		return Ab.validateForm('id_clifor', 'Fornitore', 'RisNumKey', 'descrizioneRiga', 'Articolo', 'R', 'quantita', 'quantita', 'RisNum>0', 'id_iva', 'codice iva', 'RisNumKey');
	}

}


/*******************************************/
/* campi obbligatori per documenti a clienti*/
function checkTessutoC() {
	//alert('C');
	var f = document.main;
	if (f.flgUsaSeriale.value == 1 && document.main.flgTipologia.value != 3 && !Ab.validateForm('seriale', 'Seriale articolo', 'R'))
		return false;
	//prezzoPubblicoConIva in rosso
	if (f.prezzoPubblicoConIva.value == "0,00" || f.prezzoPubblicoConIva.value == "") {
		var theIdStyle = document.getElementById('prezzoPubblicoConIva').style;
		theIdStyle.backgroundColor = "#ff0000";
	}
//
	var checkMag = true;
	if ($("#isMagPartenza").val() == "true") {
		checkMag = Ab.validateForm('id_magFisicoPartenza', 'Magazzino Partenza', 'RisNumKey');
	}

	if (checkMag) {
		if ($("#isMagArrivo").val() == "true") {
			checkMag = Ab.validateForm('id_magFisicoArrivo', 'Magazzino Arrivo', 'RisNumKey');
		}
	}
	if (checkMag) {

			return Ab.validateForm('id_clifor', 'Cliente/Fornitore', 'R', 'descrizioneRiga', 'Articolo', 'R', 'quantita', 'quantita', 'RisNum>0', 'id_iva', 'codice iva', 'RisNumKey');
	}

	//		else
	//			return false;
}



/*******************************************/
/* campi obbligatori per documenti a altro???*/
function checkTessutoA() {
	//alert('A');
	var checkMag = true;
	if ($("#isMagPartenza").val() == "true") {
		checkMag = Ab.validateForm('id_magFisicoPartenza', 'Magazzino Partenza', 'RisNumKey');
	}

	if (checkMag) {
		if ($("#isMagArrivo").val() == "true") {
			checkMag = Ab.validateForm('id_magFisicoArrivo', 'Magazzino Arrivo', 'RisNumKey');
		}
	}
	if (checkMag) {

				return Ab.validateForm('id_clifor', 'Cliente/Fornitore', 'RisNumKey', 'id_articolo', 'Articolo', 'RisNumKey', 'quantita', 'quantita', 'RisNum>0', 'id_iva', 'codice iva', 'RisNumKey');
	}

	
	


}


////////////////////////////////////
// onFocusDescRiga
// determina che succede quando arriva il focus su descriga
// deve andare sulla qta giusta. Si attiva dopo il CR
////////////////////////////////////
function onFocusDescRigaTessuto() {
	//checkBoxes();
	/*	if(Ab.prendiElementoDaId("id_articoloTessutoColore").value>0 && Ab.prendiElementoDaId("descrizioneRiga").value!="" && Ab.prendiElementoDaId('flgAutoAdd').value==1)
		{
			addRigaArticolo();
		}
		else
		*/
	{
		//se non  bolla fattura o nc allora il seriale non lo chiedo (es. ordine)flgTipologia!=3
		//dovrei verificare getTipoCaricoScarico=0-- anagrafiche chiedo seriale tipoCaricoScarico==0 
		if (document.main.flgUsaSeriale.value == 1 && document.main.flgTipologia.value != 3) {
			$("#descrizioneRiga").select();
			//Ab.prendiElementoDaId('descrizioneRiga').select();
			//beep();
		} else {
			//Ab.prendiElementoDaId('quantita').focus() ;
		}
	}
}


/////////////////////////////////////////////////
//////////////////////////////////////////////////
function addRigaTessutoLav()
/////////////////////////////////////////////
{
	//prima cosa salvo le quantità sui campi hidden
	//alert('pio');
	//1 FT fatt vendita
	//2 FB fattura accompagnatoria
	//3 fa fattura acquisto
	//4 bo bolla di accompagnamento
	//5 prenotazione
	//Ab.prendiElementoDaId("ADDRIGA").disable;

	{
		var f = document.main;

		//checkBoxes();
		f.action = f.actionPage.value;
		var cf;
		//gestione euro
		Ab.aggiustaInputText(f.descrizioneRiga);
		Ab.aggiustaInputText(f.notaRigaDocumento);
		if (document.getElementById('notaBarcode'))
			Ab.aggiustaInputText(f.notaBarcode);

		//alert(f.flgTipologia.value);
		//alert(f.flgClienteFornitore.value);
		//aggiorniamo la quantiaa
		//Tessuto SOLO MT!!!!!!!


		//$("#quantita").val($("#kgT").val());
		$("#quantita").val($("#mtT").val());



		//CONTROLLO CAMPI OBBLIGATORI

		if (f.flgClienteFornitore.value == "F")
			cf = checkTessutoFLAV();
		else if (f.flgClienteFornitore.value == "C")
			cf = checkTessutoCLAV();
		else if (f.flgClienteFornitore.value == "A")
			cf = checkTessutoALAV();
		else {
			cf = false;
			alert("ERRORE! Tipo documento no valido");
		}


		if (cf) {
			f.cmd.value = "addRigaTessuto";
			//f.act.value="addRigaTessuto";
			//da gestire se descrizioneCodiceRiga o descrizione riga
			$("#currentFocus").val("descrizioneCodiceRiga"); //f.flgCaricaArticoli.value=1;
			//Ab.popUp("ELAB");
			//	Ab.submitAj('main');
			//
			Ab.submitAj('main');
		}
	}


}

/*******************************************/
/* campi obbligatori per documenti a fornitori
caso lavorazioni*/
function checkTessutoFLAV() {
	//alert('f');
	var f = document.main;
	if (document.getElementById('flgUsaSeriale')) {
		if (f.flgUsaSeriale.value == 1 && document.main.flgTipologia.value != 3 && !Ab.validateForm('seriale', 'Lotto', 'R'))
			return false;
	}
	//imponibile in rosso

	var checkMag = true;
	if ($("#magPartenzaDaScegliere").val() == "true") {
		checkMag = Ab.validateForm('id_magFisicoPartenza', 'Magazzino Partenza', 'RisNumKey');
	}

	if (checkMag) {
		if ($("#magArrivoDaScegliere").val() == "true") {
			checkMag = Ab.validateForm('id_magFisicoArrivo', 'Magazzino Arrivo', 'RisNumKey');
		}
	}
	if (checkMag) {

		return Ab.validateForm('id_clifor', 'Fornitore', 'RisNumKey', 'descrizioneRiga', 'Articolo', 'R', 'quantita', 'quantita', 'RisNum>0', 'id_iva', 'codice iva', 'RisNumKey');
	}

}
/*******************************************/
/* campi obbligatori per documenti a clienti
per lavorazioni*/
function checkTessutoCLAV() {
	//alert('C');
	var f = document.main;
	if (document.getElementById('flgUsaSeriale')) {
	if (f.flgUsaSeriale.value == 1 && document.main.flgTipologia.value != 3 && !Ab.validateForm('seriale', 'Seriale articolo', 'R'))
		return false;
	}
	//prezzoPubblicoConIva in rosso

	//corrispettivi.... se emetti fattura id_clifor2  obbligatorio flgEmettiFatturaScontrino
	//s09-02-2010 viene chamato da add riga... non controllo id_clilfor2
	//	if(f.id_tipoDocumento.value!=1 || (f.id_tipoDocumento.value==1 &&  f.flgEmettiFatturaScontrino.value==0) ||(f.id_tipoDocumento.value==1 &&  //Ab.validateForm('id_clifor2','Cliente/Fornitore','RisNumKey')))
	return Ab.validateForm('id_clifor', 'Cliente/Fornitore', 'R', 'descrizioneRiga', 'Articolo', 'R', 'quantita', 'quantita', 'RisNum>0', 'id_iva', 'codice iva', 'RisNumKey');
	//		else
	//			return false;
}

/*******************************************/
/* campi obbligatori per documenti a altro???
caso lavorazione*/
function checkTessutoALAV() {
	//alert('A');
	return Ab.validateForm('id_clifor', 'Cliente/Fornitore', 'RisNumKey', 'id_articolo', 'Articolo', 'RisNumKey', 'quantita', 'quantita', 'RisNum>0', 'id_iva', 'codice iva', 'RisNumKey');

}


/*******************************************/
/*******************************************/
/* calcola tessuti totali */
/*******************************************/
/*******************************************/
function calcolaMtTotali()
{
	
	var stacchi=parseFloat($("#stacchi").val().replace(/[,]/, '.'));
	var metriStacchi=parseFloat($("#metriStacchi").val());
	console.log(stacchi+" "+metriStacchi+" "+stacchi*metriStacchi);
	numeral.locale('it');
	var mtString = numeral(stacchi*metriStacchi).format('0,0.00');
	$("#mtT").val(mtString); 
	
}

function codBarreDispoTessitura()
{
		var f = document.main;
	
	{
		var debug=false;
		var wwD="700";
		var whD="500";
	
		//+"&xxx="+f.xxx.value
		theAction=f.actionPage.value+"?cmd=codBarreDispoTessitura"+"&id_documento="+f.id_documento.value;
	
		//
		//var numLabels=prompt("Numero di etichette da stampare","1");
		var blankLabels=prompt("Numero di etichette da saltare","0");
		theAction=theAction+"&blankLabels="+blankLabels;//+"&numLabels="+numLabels;
		if(debug==false)
		{
			window.open(theAction, "Stampa_Codici_Barre_Dispo_Tessitura","width="+wwD+",height="+whD+",status=no,resizable=yes,top=100,left=100,scrollbars=yes");
		}
		else
		{
			window.open(theAction); 
		}
		
	}
				
}
