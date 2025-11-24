/////////////////////////////////////////////////
//////////////////////////////////////////////////
function addRigaTessuto2()
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
		Ab.aggiustaInputText(f.descrizioneRiga2);
		Ab.aggiustaInputText(f.notaRigaDocumento2);
		if (document.getElementById('notaBarcode2'))
			Ab.aggiustaInputText(f.notaBarcode2);

		//alert(f.flgTipologia.value);
		//alert(f.flgClienteFornitore.value);
		//aggiorniamo la quantiaa
		//Tessuto SOLO MT!!!!!!!


		//$("#quantita").val($("#kgT").val());
		$("#quantita2").val($("#mtT2").val());



		//CONTROLLO CAMPI OBBLIGATORI

		if (f.flgClienteFornitore.value == "F")
			cf = checkTessutoF2();
		else if (f.flgClienteFornitore.value == "C")
			cf = checkTessutoC2();
		else if (f.flgClienteFornitore.value == "A")
			cf = checkTessutoA2();
		else {
			cf = false;
			alert("ERRORE! Tipo documento no valido");
		}


		if (cf) {
			f.cmd.value = "addRigaTessuto2";
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
function checkTessutoF2() {
	//alert('f');
	var f = document.main;
	if (f.flgUsaSeriale2.value == 1 && document.main.flgTipologia.value != 3 && !Ab.validateForm('seriale2', 'Lotto', 'R'))
		return false;
	//imponibile in rosso
	if (f.imponibile2.value == "0,00" || f.imponibile2.value == "") {
		var theIdStyle = document.getElementById('imponibile2').style;
		theIdStyle.backgroundColor = "#ff0000";
	}

	var checkMag = true;
	if ($("#magPartenzaDaScegliere2").val() == "true") {
		checkMag = Ab.validateForm('id_magFisicoPartenza2', 'Magazzino Partenza', 'RisNumKey');
	}

	if (checkMag) {
		if ($("#magArrivoDaScegliere2").val() == "true") {
			checkMag = Ab.validateForm('id_magFisicoArrivo2', 'Magazzino Arrivo', 'RisNumKey');
		}
	}
	if (checkMag) {

		return Ab.validateForm('id_clifor', 'Fornitore', 'RisNumKey', 'descrizioneRiga2', 'Articolo', 'R', 'quantita2', 'quantita', 'RisNum>0', 'id_iva2', 'codice iva', 'RisNumKey');
	}

}


/*******************************************/
/* campi obbligatori per documenti a clienti*/
function checkTessutoC2() {
	//alert('C');
	var f = document.main;
	if (f.flgUsaSeriale2.value == 1 && document.main.flgTipologia.value != 3 && !Ab.validateForm('seriale2', 'Seriale articolo', 'R'))
		return false;
	//prezzoPubblicoConIva in rosso
	if (f.prezzoPubblicoConIva2.value == "0,00" || f.prezzoPubblicoConIva2.value == "") {
		var theIdStyle = document.getElementById('prezzoPubblicoConIva2').style;
		theIdStyle.backgroundColor = "#ff0000";
	}
	//corrispettivi.... se emetti fattura id_clifor2  obbligatorio flgEmettiFatturaScontrino
	//s09-02-2010 viene chamato da add riga... non controllo id_clilfor2
	//	if(f.id_tipoDocumento.value!=1 || (f.id_tipoDocumento.value==1 &&  f.flgEmettiFatturaScontrino.value==0) ||(f.id_tipoDocumento.value==1 &&  //Ab.validateForm('id_clifor2','Cliente/Fornitore','RisNumKey')))
	return Ab.validateForm('id_clifor', 'Cliente/Fornitore', 'R', 'descrizioneRiga2', 'Articolo', 'R', 'quantita2', 'quantita', 'RisNum>0', 'id_iva2', 'codice iva', 'RisNumKey');
	//		else
	//			return false;
}



/*******************************************/
/* campi obbligatori per documenti a altro???*/
function checkTessutoA2() {
	//alert('A');
	return Ab.validateForm('id_clifor', 'Cliente/Fornitore', 'RisNumKey', 'id_articolo2', 'Articolo', 'RisNumKey', 'quantita2', 'quantita', 'RisNum>0', 'id_iva', 'codice iva', 'RisNumKey');

}


////////////////////////////////////
// onFocusDescRiga
// determina che succede quando arriva il focus su descriga
// deve andare sulla qta giusta. Si attiva dopo il CR
////////////////////////////////////
function onFocusDescRigaTessuto2() {
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
		if (document.main.flgUsaSeriale2.value == 1 && document.main.flgTipologia.value != 3) {
			$("#descrizioneRiga2").select();
			//Ab.prendiElementoDaId('descrizioneRiga').select();
			//beep(); 
		} else {
			//Ab.prendiElementoDaId('quantita').focus() ;
		}
	}
}


/////////////////////////////////////////////////
//////////////////////////////////////////////////
function addRigaTessutoLav2()
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
		Ab.aggiustaInputText(f.descrizioneRiga2);
		Ab.aggiustaInputText(f.notaRigaDocumento2);
		if (document.getElementById('notaBarcode'))
			Ab.aggiustaInputText(f.notaBarcode2);

		//alert(f.flgTipologia.value);
		//alert(f.flgClienteFornitore.value);
		//aggiorniamo la quantiaa
		//Tessuto SOLO MT!!!!!!!


		//$("#quantita").val($("#kgT").val());
		$("#quantita2").val($("#mtT").val());



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
function checkTessutoFLAV2() {
	//alert('f');
	var f = document.main;
	if (document.getElementById('flgUsaSeriale2')) {
		if (f.flgUsaSeriale2.value == 1 && document.main.flgTipologia.value != 3 && !Ab.validateForm('seriale', 'Lotto', 'R'))
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
function checkTessutoCLAV2() {
	//alert('C');
	var f = document.main;
	if (document.getElementById('flgUsaSeriale2')) {
	if (f.flgUsaSeriale2.value == 1 && document.main.flgTipologia.value != 3 && !Ab.validateForm('seriale', 'Seriale articolo', 'R'))
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
function checkTessutoALAV2() {
	//alert('A');
	return Ab.validateForm('id_clifor', 'Cliente/Fornitore', 'RisNumKey', 'id_articolo', 'Articolo', 'RisNumKey', 'quantita', 'quantita', 'RisNum>0', 'id_iva', 'codice iva', 'RisNumKey');

}
