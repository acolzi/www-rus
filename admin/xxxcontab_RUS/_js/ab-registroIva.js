// javascript per gestione campi obbligatori///
// //


///////////////////////////////////////////
////////T O O L B A R /////////////////////
///////////////////////////////////////////

function refreshxxxx() {
	checkBoxes();
	var f = document.dettaglio;
	//		FACCIO IL SUBMIT
	f.cmd.value = "search";
	f.act.value = "refresh";

	f.submit();

}

/********************************************************/
/********************************************************/
/*   registro iva */
/********************************************************/
/********************************************************/
function registroIva() {

	{
	
		var f = document.main;
		f.action = f.actionPage.value;


		if (Ab.validateForm('dataDa', 'Data da', 'R','dataA', 'Data a', 'R')) {


			if (f.flgDefinitivo.value == "0" || f.flgDefinitivo.value == "" || (f.flgDefinitivo.value == "1" && confirm("Sei sicuro di fare la stampa definitiva?"))) {
			
				f.cmd.value = "stampaRegistroIva";
				f.act.value = "";

				Ab.submitAj('main');
			}
		}
	}

}
