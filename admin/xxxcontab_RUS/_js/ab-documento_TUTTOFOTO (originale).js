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

function labelBartoliniCR() {
	var f = document.main;
	if (f.flgSimulazione.value == "1" || (f.flgSimulazione.value == "0" && confirm("Label Bartolini: simulazione non attivata. Vuoi Continuare?"))) {

		var f = document.main;
		var debug = false;
		var wwD = "700";
		var whD = "500";
		// $("#form_id").serialize()

		f.cmd.value = "reportPdf";
		if ($("#id_tipologiaProdotto").val() == 0) {
			swal("Attenzione!", "Impostare una tipologia Prodotto", "warning")
		} else {
			f.cmd.value = "stampaLabelBartolini";
			var blankLabels = prompt("Numero di etichette da saltare", "0");
			f.blankLabels.value = blankLabels;
			theAction = f.actionPage.value + "?" + $("#main").serialize();
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
		f.cmd.value = "mailSpedizioneCR";
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
