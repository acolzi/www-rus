/////////////////////////////////////////////
// APRE POPUP PER CREA DOCUMENTO FIGLI
// DA MASCHERA DI RICERCA IN ALTO SE SCELTO IL TIPO DI DOCUMENTOD
/////////////////////////////////////////////
function preCreaDocFigliCR() {
	var f = document.main;
	l_id_tipoDocumento=$("#id_tipoDocumento").val();
	//alert(f.actionPage.value + "?cmd=creaDocFigliS&id_tipoDocumento=" + l_id_tipoDocumento);
	$('#modalDocFiglio').modal('show');
	$("#modalDocFiglio").load(f.actionPage.value + "?cmd=creaDocFigliS&id_tipoDocumento=" + l_id_tipoDocumento);
	
	
	//$('#modalDocFiglio .modal-title').html("Crea documento figlio");
	//$('#modalDocFiglio').modal('show');
	//$('#modalDocFiglio .modal-body').load($("#actionPage").val() + "?cmd=creaDocFigliS&id_documento=" + l_id_documento);
	/*$(".dummyCreaDoc").load($("#actionPage").val() + "?cmd=creaDocFigliS&id_documento=" + l_id_documento, function () {
		$('#modalDocFiglio .modal-body').html($(".dummyCreaDoc").html());

		$(".dummyCreaDoc").html();
	});*/
}


/////////////////////////////////////////////
// APRE POPUP PER CREA DOCUMENTO FIGLI
// DA MASCHERA DI RICERCA SU SINGOLO DOCUMENTO
/////////////////////////////////////////////
function preCreaDocFiglioCR(l_id_documento) {
	var f = document.main;
	$('#modalDocFiglio').modal('show');
	$("#modalDocFiglio").load(f.actionPage.value + "?cmd=creaDocFigliS&id_documento=" + l_id_documento);
	
	
	//$('#modalDocFiglio .modal-title').html("Crea documento figlio");
	//$('#modalDocFiglio').modal('show');
	//$('#modalDocFiglio .modal-body').load($("#actionPage").val() + "?cmd=creaDocFigliS&id_documento=" + l_id_documento);
	/*$(".dummyCreaDoc").load($("#actionPage").val() + "?cmd=creaDocFigliS&id_documento=" + l_id_documento, function () {
		$('#modalDocFiglio .modal-body').html($(".dummyCreaDoc").html());

		$(".dummyCreaDoc").html();
	});*/
}

/////////////////////////////////////////////
//COMANDO VERO E PROPRIO DI CREAZIONE DOC FIGLI
// DALLA MASCHERA DI RICERCA
/////////////////////////////////////////////
function creaDocFiglioCR(l_id_documento) {
	var f = document.main;
	if (l_id_documento == 0) {
		alert("ERRORE! documento non valido!");
		return;
	}
	//apro la finestra che mi permette di scegliere il fornitore ed
	//eventualmente la variante
	var ap = f.actionPage.value;
	$('#modalDocFiglio').modal('show');
	$("#modalDocFiglio").load(f.actionPage.value + "?cmd=creaDocFigliS&id_documento=" + l_id_documento);
	//modalW=dhtmlwindow.open('modalW', 'ajax', 'Articolo.abl?cmd=riordinoS', 'Riordino articolo', 'width=650px,height=300px,left=300px,top=100px,resize=1,scrolling=1'); 
	modalW("Crea Doc. Figli", f.actionPage.value + "?cmd=creaDocFigliS&id_documento=" + l_id_documento, 650, 300);
	refreshDocFigli();
}

/////////////////////////////////////////////
// APRI IL POPUP PER LA CREAZIONE DEL DOCUMENTO 
// FIGLIO DAL DETTAGLIO DOCUMENTO
/////////////////////////////////////////////
function creaDocFiglioD() {
	var f = document.main;
	var l_id_documento = f.id_documento.value;
	if (l_id_documento == 0) {
		alert("ERRORE! documento non valido!");
		return;
	}
	//apro la finestra che mi permette di scegliere il fornitore ed
	//eventualmente la variante
	$('#modalDocFiglio').modal('show');
	$("#modalDocFiglio").load(f.actionPage.value + "?cmd=creaDocFigliS&id_documento=" + l_id_documento);

}


/////////////////////////////////////////////
// INVIO COMANDO DI CREAZIONE DOCUMENTO FIGLIO
/////////////////////////////////////////////
function creaDocFiglio(l_id_documento) {
	//alert('xx');
	var f = document.main;

	console.log(f.actionPage.value);
	var l_flgClienteFornitore = $("#docGenType_" + $("#id_tipoDocumentoScelta").val()).val();
	//alert(l_flgClienteFornitore);
	/*var l_flgClienteFornitore = document.getElementById('docGenType_' + $("#id_tipoDocumentoScelta").val()).value;*/

	var clifor = "";
	if (l_flgClienteFornitore == "F")
		clifor = document.getElementById('id_cliforSceltaF');
	else if (l_flgClienteFornitore == "C")
		clifor = document.getElementById('id_cliforSceltaC');
	var id_tipoDocumentoFiglio = document.getElementById('id_tipoDocumentoScelta');
	var l_flgTipoGenerazione = $("#flgTipoGenerazionePop").val();
	//var qta=document.getElementById('qtaDaRiordinare');
	/*
	if (clifor.value == "0" || clifor.value == "") {
		alert("ERRORE! Intestazione documento figlio non valida!");
		return;
	}*/

	if (id_tipoDocumentoFiglio.value == 0) {
		alert("Attenzione! Scegliere documento figlio!");
	} else
	if (confirm("Verrà creato un Documento figlio. Sei Sicuro")) {
		$('#modalDocFiglio').modal('hide');
		setTimeout(function () {
			{
				f.id_cliforR.value = clifor.value;
				f.qtaR.value = 1;
				f.id_documentoR.value = l_id_documento;
				f.id_tipoDocumentoF.value = id_tipoDocumentoFiglio.value;
				f.flgTipoGenerazione.value = l_flgTipoGenerazione;
				//alert(f.flgTipoGenerazione.value);
				f.cmd.value = "creaDocFigli";
				f.act.value = "";
				//alert('pio'+f.cmd.value+" xx");
				//f.cmd.value="md";
				//f.act.value="refreshRivalutazione";
				f.action = f.actionPage.value;
				Ab.submitAj('main');
				//f.submit();

			}

		}, 500);


	}

}

/////////////////////////////////////////////
/////////////////////////////////////////////
// chiamata dalla combo di creaDocFiglio da dettaglio
/////////////////////////////////////////////
/////////////////////////////////////////////
function refreshDocFigli() {
	var f = document.modalForm;
	var fornitoreDiv = document.getElementById('fornitore');
	var clienteDiv = document.getElementById('cliente');
	if ($("#id_tipoDocumentoScelta").val() == "") {
		clienteDiv.style.display = "none";
		fornitoreDiv.style.display = "none";
	} else {
		var l_flgClienteFornitore = $("#docGenType_" + $("#id_tipoDocumentoScelta").val()).val();
		//alert("refresh"+l_flgClienteFornitore);
		if (l_flgClienteFornitore == "F") {
			clienteDiv.style.display = "none";
			fornitoreDiv.style.display = "block";
		} else
		if (l_flgClienteFornitore == "C") {
			clienteDiv.style.display = "block";
			fornitoreDiv.style.display = "none";
		} else {
			clienteDiv.style.display = "none";
			fornitoreDiv.style.display = "none";
		}
	}
}

/////////////////////////////////////////////
// EFFETTUA IL SALVATAGGIO IN EMESSO E QUINDI
// LA STAMPA DEL DOCUMENTO ????
/////////////////////////////////////////////
function salvaEstampaEmesso() {
	var f = document.main;
	if (f.flgStato.value == "1" || (f.flgStato.value == "0" && confirm("Il documento verrà messo in stato EMESSO e stampato. Vuoi Continuare?"))) {
		if (checkFields()) {
			checkBoxes();
			var f = document.main;
			f.action = f.actionPage.value;
			f.act.value = "save";
			f.cmd.value = "asq";
			f.flgStato.value = "1";
			f.prtCommand.value = "1";
			f.submit();
			//Ab.submitAj('main');
		}
	}
}

/////////////////////////////////////////////
// COMANDO LANCIATO DOPO IL SALVA E STAMPA EMESSO
// AL RITORNO SULLA PAGINA...
/////////////////////////////////////////////
function printCommandAS() {
	//stampa solo se lanciato dopo il salvataggio (after save)
	//tramite il campo prtCommand
	var f = document.main;
	//alert( f.prtCommand.value);
	if (f.prtCommand.value != 0) {
		f.prtCommand.value = 0;
		printCommand();
	}
}
