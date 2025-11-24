/************************************************/
/* standard javascript for lte */
/************************************************/

/*************************************************/
/*************************************************/
/* DOCUMENT READY CR*/
/*************************************************/
/*************************************************/

function documentReadyScript()
{
	Ab.startAggiornaThreadMsg();
}

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


function checkBoxes()
/////////////////////////////////////////////
{


}


function checkBoxesCR() {

}

/************************************************/
/************************************************/
/* PUNTI FOTO */
/************************************************/
/************************************************/
function addPuntoFoto() {
	var f = document.main;
	if (Ab.validateForm('descrizionePuntoFoto', 'Descrizione', 'R', 'pathRelativoFoto', 'Path relativo foto', 'R')) {
		f.action = f.actionPage.value + "#righe";
		f.cmd.value = "addPuntoFoto";
		f.act.value = "";
		Ab.submitAj('main');
	}
}

function delPuntoFoto(l_id) {

	Ab.confirmDelete4(function () {
		var f = document.main;
		f.action = f.actionPage.value + "#righe";
		f.cmd.value = "delPuntoFoto";
		f.act.value = "";
		f.id_puntoFoto.value = l_id;
		Ab.submitAj('main');
	});




}

function modPuntoFoto(l_id) {
	var f = document.main;
	f.action = f.actionPage.value + "#righe";
	f.cmd.value = "modPuntoFoto";
	f.act.value = "";
	f.id_puntoFoto.value = l_id;
	Ab.submitAj('main');
}
/************************************************/
/************************************************/
/* INDICIZZAZIONE */
/************************************************/
/************************************************/
function indexFoto(l_id)
{
	  Swal.fire({
   title: "Indicizzazione Foto",
		  text: "Verranno indicizzate le foto. Sei Sicuro?",
    icon: "warning",
    showDenyButton: true,
    showCancelButton: false,
    confirmButtonText: `Si`,
    denyButtonText: `No`,
    cancelButtonText: `Annulla`,
  }).then((result) => {
    /* Read more about isConfirmed, isDenied below */
    if (result.isConfirmed) {
      ////////////////////////////////////////////////////////////////////
     $("#main").attr("action",$("#actionPage").val());
			$("#cmd", "#main").val("indexFoto");
			$("#act","#main").val("");
			$("#id_puntoFotoIdx").val(l_id);
			Ab.submitAj('main');
      ////////////////////////////////////////////////////////////////////
    } else if (result.isDenied) {
      //Swal.fire('Changes are not saved', '', 'info')
    }
  })
	
	
	
}


function noIndexFoto(l_id)
{
	  Swal.fire({
     title: "Indicizzazione Foto",
		  text: "Verranno annullate le precedenti indicizzazioni su questo punto foto. Sei Sicuro?",
    icon: "warning",
    showDenyButton: true,
    showCancelButton: false,
    confirmButtonText: `Si`,
    denyButtonText: `No`,
    cancelButtonText: `Annulla`,
  }).then((result) => {
    /* Read more about isConfirmed, isDenied below */
    if (result.isConfirmed) {
      ////////////////////////////////////////////////////////////////////
   $("#main").attr("action",$("#actionPage").val());
			$("#cmd", "#main").val("noIndexFoto");
			$("#act","#main").val("");
			$("#id_puntoFotoIdx").val(l_id);
			Ab.submitAj('main');
      ////////////////////////////////////////////////////////////////////
    } else if (result.isDenied) {
      //Swal.fire('Changes are not saved', '', 'info')
    }
  })
	

	
}

/************************************************/
/************************************************/
/* CREAZIONE AUTOMATICA PUNTI FOTO */
/************************************************/
/************************************************/
function creaPuntiFoto()
{
	  Swal.fire({
    title: "Creazione Punti Foto",
		  text: "Verranno creati automaticamente i punti foto in base alla dir base. Sei Sicuro?",
    icon: "warning",
    showDenyButton: true,
    showCancelButton: false,
    confirmButtonText: `Si`,
    denyButtonText: `No`,
    cancelButtonText: `Annulla`,
  }).then((result) => {
    /* Read more about isConfirmed, isDenied below */
    if (result.isConfirmed) {
      ////////////////////////////////////////////////////////////////////
    $("#main").attr("action",$("#actionPage").val());
			$("#cmd", "#main").val("creaPuntiFoto");
			$("#act","#main").val("");
			//$("#id_puntoFotoIdx").val(l_id);
			 // alert('pio');
			Ab.submitAj('main');
      ////////////////////////////////////////////////////////////////////
    } else if (result.isDenied) {
      //Swal.fire('Changes are not saved', '', 'info')
    }
  })
	
	
	
	
}



/************************************/
/************************************/
/* salva il file csv che ho caricato*/
/************************************/
/************************************/
function salvaFileCsv() 
{
	
	var f = document.main;

	//if(confirm("Import Indicizzazione foto. Vuoi Continuare?"))
	{
		$("#main").attr("action", $("#actionPage").val());
		//FACCIO IL SUBMIT
		f.cmd.value="salvaFileCsv";
		//alert(f.cmd.value);
		
		Ab.submitAj('main');
	}
	
}
/************************************************/
/************************************************/
/* CREAZIONE AUTOMATICA PUNTI FOTO */
/************************************************/
/************************************************/
function indexCsvPisa(l_id)
{
	//FACCIO IL SUBMIT
	var f = document.main;
	if (confirm("Indicizzo le foto con il file appena caricato. Sei Sicuro?"))
	{
		$("#main").attr("action", $("#actionPage").val());
		//f.id_puntoFotoIdx.value=l_id;
		f.cmd.value="indexCsvPisa";
		var ct=f.currentTab.value;
		
		f.currentTab.value=ct;
		Ab.submitAj('main');
	}
}



function previewFoto(l_id) {
	//FACCIO IL SUBMIT
	var f = document.main;

	if (confirm("Verra' lanciato il thread di creazione delle preview. Sei Sicuro?")) {
		$("#main").attr("action", $("#actionPage").val());
		f.cmd.value = "preview";
		f.id_puntoFotoIdx.value = l_id;
		var ct = f.currentTab.value;

		f.currentTab.value = ct;
		Ab.submitAj('main');
	}
}
function resetPreview(l_id) {
	//FACCIO IL SUBMIT
	var f = document.main;

	if (confirm("Verra' impostato il flag foto da inviare a tutte le foto di questo punto foto e verra' cancellata la cartella delle preview. Sei Sicuro?")) {
		$("#main").attr("action", $("#actionPage").val());
		f.cmd.value = "resetPreview";
		f.id_puntoFotoIdx.value = l_id;
		var ct = f.currentTab.value;

		f.currentTab.value = ct;
		Ab.submitAj('main');
	}
}



function exportGaraSuWww() {
	var sonosuwww = false;
	if (sonosuwww) {
		alert("testina di vitello!!!! sei su www!");
	} else {


		var f = document.main;

		if (confirm("Export DI TUTTA LA GARA SU WWW. Vuoi Continuare?")) {
			$("#main").attr("action", $("#actionPage").val());
			//FACCIO IL SUBMIT
			f.cmd.value = "exportGaraSuWww";
			//alert(f.cmd.value);

			Ab.submitAj('main');
		}

	}

}

function exportGaraSuWwwOcr() {
	var sonosuwww = false;
	if (sonosuwww) {
		alert("testina di vitello!!!! sei su www!");
	} else {


		var f = document.main;

		if (confirm("Export DI TUTTA LA GARA SU WWW comprese riduzioni + scansione OCR di tutti i punti foto. Vuoi Continuare?")) {
			$("#main").attr("action", $("#actionPage").val());
			//FACCIO IL SUBMIT
			f.cmd.value = "exportGaraSuWwwEOcr";
			//alert(f.cmd.value);

			Ab.submitAj('main');
		}

	}

}

/********************************************/
/********************************************/
/* IMPOSTA MODA GARA A SI CON IL CODICE GARA CHE VIENE PASSATO/*
/********************************************/
/********************************************/
function impostaModGara() {
	var f = document.main;
	$("#main").attr("action", $("#actionPage").val());
	//FACCIO IL SUBMIT
	f.cmd.value = "impostaModGara";
	//alert(f.cmd.value);

	Ab.submitAj('main');


}
/********************************************/
/********************************************/
/* IMPOSTA MODA GARA A NO /*
/********************************************/
/********************************************/
function annullaModGara() {
	var f = document.main;
	$("#main").attr("action", $("#actionPage").val());
	//FACCIO IL SUBMIT
	f.cmd.value = "annullaModGara";
	//alert(f.cmd.value);

	Ab.submitAj('main');


}
/********************************************/
/********************************************/
/* IMPOSTA MODA GARA A NO /*
/********************************************/
/********************************************/
function annullaModGaraCR() {
	var f = document.main;
	$("#main").attr("action", $("#actionPage").val());
	//FACCIO IL SUBMIT
	f.cmd.value = "annullaModGaraCR";
	//alert(f.cmd.value);

	Ab.submitAj('main');


}
/********************************************/
/********************************************/
/* Crea foto test /*
/********************************************/
/********************************************/
function creaRiduzioniTest() {
	var f = document.main;
	$("#main").attr("action", $("#actionPage").val());
	//FACCIO IL SUBMIT
	f.cmd.value = "creaRiduzioniTest";
	//alert(f.cmd.value);
	Ab.fetch(f.actionPage.value, $("#main").serialize(), "fotoTest", null, 1);
	//Ab.submitAj('main');


}

/********************************************/
/********************************************/
/* chiama programma ocr che non funziona!!! /*
/********************************************/
function callOcr(l_id)
{
	  Swal.fire({
     title: "OCR Foto",
		  text: "Verra' lanciato ocr per il punto foto. Sei Sicuro?",
    icon: "warning",
    showDenyButton: true,
    showCancelButton: false,
    confirmButtonText: `Si`,
    denyButtonText: `No`,
    cancelButtonText: `Annulla`,
  }).then((result) => {
    /* Read more about isConfirmed, isDenied below */
    if (result.isConfirmed) {
      ////////////////////////////////////////////////////////////////////
     	$("#main").attr("action",$("#actionPage").val());
			$("#cmd", "#main").val("callOcr");
			$("#act","#main").val("");
			$("#id_puntoFotoIdx").val(l_id);
			Ab.submitAj('main');
      ////////////////////////////////////////////////////////////////////
    } else if (result.isDenied) {
      //Swal.fire('Changes are not saved', '', 'info')
    }
  })
	
	
}
/********************************************/
/********************************************/
/* export file indicizzazione! /*
/********************************************/
function creaFileExportIdx() {
	  Swal.fire({
     title: "Export Indicizzazione",
		  text: "Creazione del file indicezzazione per questa gara. Sei Sicuro?",
    icon: "warning",
    showDenyButton: true,
    showCancelButton: false,
    confirmButtonText: `Si`,
    denyButtonText: `No`,
    cancelButtonText: `Annulla`,
  }).then((result) => {
    /* Read more about isConfirmed, isDenied below */
    if (result.isConfirmed) {
      ////////////////////////////////////////////////////////////////////
     	$("#main").attr("action",$("#actionPage").val());
			$("#cmd", "#main").val("creaFileExportIdx");
			$("#act","#main").val("");
			//$("#id_puntoFotoIdx").val(l_id);
			Ab.submitAj('main');
      ////////////////////////////////////////////////////////////////////
    } else if (result.isDenied) {
      //Swal.fire('Changes are not saved', '', 'info')
    }
  })


}
