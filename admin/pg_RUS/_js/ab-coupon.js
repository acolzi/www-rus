/************************************************/
/* standard javascript for lte */
/************************************************/


/************************************************/
/************************************************/
/* check fields per pagina dettaglio /*
/************************************************/
/************************************************/
function checkFields()

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

	return Ab.validateForm('descrizione', 'Descrizione', 'R');
}


/************************************************/
/************************************************/
/** REPORT MA FORSE NON SERVE */
/************************************************/
/************************************************/
function reportxxx() {
	//FACCIO IL SUBMIT
	var f = document.main;
	f.flgReport.value = "S";
	//f.action=webApp+"/tr/Pratica.abl";
	f.cmd.value = "search";
	Ab.submitAj('main');
}


/************************************************/
/************************************************/
/* TEMPLATE GESTIONE RIGHE */
/************************************************/
/************************************************/
function addRow() {

	var f = document.main;
	f.action = f.actionPage.value;
	if (Ab.validateForm('id_riga', 'Row', 'R')) {
		f.cmd.value = "addRow";
		f.act.value = "";
		Ab.submitAj('main');
	}
}

function delRow(l_id) {
	if (Ab.confirmDelete()) {
		var f = document.main;
		f.action = f.actionPage.value;
		//	FACCIO IL SUBMIT
		f.cmd.value = "delRow";
		f.act.value = "";
		f.id_riga.value = l_id;
		Ab.submitAj('main');
	}

}

function modRow(l_id) {

	{
		var f = document.main;
		f.action = f.actionPage.value;
		//	FACCIO IL SUBMIT
		f.cmd.value = "modRo";
		f.act.value = "";
		f.id_riga.value = l_id;
		Ab.submitAj('main');
	}

}

function checkBoxes()
/////////////////////////////////////////////
{


}


function checkBoxesCR() {

}


/************************************/
/************************************/
/* popup e comando genera coupon */
/************************************/
/************************************/
function generaCouponShow() {
	$("#generaCoupon").modal("show");

}

function generaCoupon() {

	var f = document.main;

	var nCoupon = $("#numCoupon").val(),
		serie = $("#serie1").val(),
		nFoto = $("#nFoto1").val();

	$("#generaCoupon").modal("hide");
	setTimeout(function () {
		if (confirm("Verranno generati " + nCoupon + " coupon con serie '" + serie + "' per " + nFoto + " foto. Sei Sicuro?")) {
			f.action = f.actionPage.value;
			f.cmd.value = "generaCoupon";
			Ab.submitAj("main");
		}

	}, 500);

}
/************************************/
/************************************/
/* popup e comando genera coupon */
/************************************/
/************************************/
function stampaCouponShow() {
	$("#stampaCoupon").modal("show");

}

function stampaCoupon() {

	var f = document.main;


	var numLabel = $("#numLabel").val(),
		serie = $("#serie2").val();

	$("#stampaCoupon").modal("hide");
	setTimeout(function () {
		if (confirm("Verranno stampati i coupon con serie " + serie + " saltando " + numLabel + " etichette. Sei Sicuro?")) {

			var debug = false;
			var wwD = "700";
			var whD = "500";

			

			//+"&xxx="+f.xxx.value
			theAction = f.actionPage.value + "?cmd=stampaCoupon&numLabel=" + numLabel+"&serie="+serie;

			if (debug == false) {
				window.open(theAction, "StampaCoupon", "width=" + wwD + ",height=" + whD + ",status=no,resizable=yes,top=100,left=100,scrollbars=yes");
			} else {
				window.open(theAction);
			}
		}

	}, 500);

}

/***********************************************/
/***********************************************/
/*  fa una chiamata asincrona per creare il report csv
/*  il CR lo prendo dalla sessione
/***********************************************/
/***********************************************/
function couponCsv() {
  //fetch(servlet, command, divList, postProcess, async, type)
  $("#cmd").val("couponCsv");

  Ab.fetch4("../pg_RUS/Coupon.abl",$("#main").serialize(), "fileCsv", null, false);


}
