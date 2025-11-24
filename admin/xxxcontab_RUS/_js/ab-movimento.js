$(function() {
	$( "#selReport" ).dialog({
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
	$( "#selReport" ).dialog("option", "title", "Seleziona Tipo Report");
	$( "#btn_elabReport" ).click(function() {
		report();
		$( "#selReport" ).dialog( "close" );
	});
	$( "#btn_closerReport" ).click(function() {
	  $( "#selReport" ).dialog( "close" );
	});
});



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
	var f = document.main;
	if(f.flgTipo.value==1)
		return Ab.validateForm('descrizione','Descrizione','R','oggettoEmail','Oggetto Email','R');
	else
		return Ab.validateForm('descrizione','Descrizione','R');
	
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
	//Ab.setChekBoxValue("dettaglio","flgSommaCRL","1","0");

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
function addRow()
/////////////////////////////////////////////
{
       
	var f = document.main;
	f.action=f.actionPage.value;
	if (Ab.validateForm('id_rowBean','RowBean','R'))
	{
		f.cmd.value="gr";
		f.act.value="addRow";
		Ab.submitAj('main');
	}
}

function delRow(l_id)
/////////////////////////////////////////////
{
 if (Ab.confirmDelete())
	{      
		var f = document.main;
		f.action=f.actionPage.value;
	//	FACCIO IL SUBMIT
		f.cmd.value="gr";
		f.act.value="delRow";
		f.id_rowBean.value=l_id;
		Ab.submitAj('main');
	}

}

function modRow(l_id)
/////////////////////////////////////////////
{

		var f = document.main;
		f.action=f.actionPage.value;
	//	FACCIO IL SUBMIT
		f.cmd.value="gr";
		f.act.value="modRow";
		f.id_rowBean.value=l_id;
		Ab.submitAj('main');

}



function creaCMByFile()
{
	var f = document.main;
	if(f.id_templateMsg.value!="" && f.nomeFile.value!="")
	{
		if (confirm("Verr&agrave; creata una nuova coda di messaggi in base al template e al file di indirizzi email selezionato. Sei Sicuro?"))
		{   
			//Ab.popUp("ELAB");
			f.action=f.actionPage.value;
		//	FACCIO IL SUBMIT
			f.cmd.value="creaCodaMsg";
			Ab.submitAj('main');
		}
	}
	else
	 alert('Template non valido o file non selezionato!');
	
	
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
		f.id_allegatoTemplateMsg.value=l_id;
		Ab.submitAj('main');
	}

}


/////////////////////////////////
// funzione richiamata sul document ready
//in modo da averne uno solo
///////////////////////////////
function documentReadyScript()
{
	//////////////////////
	//$('.editor').jqte();
	////////////////////////////
	var opts = {
		lang         : 'it',   // set your language
		styleWithCSS : false,
		height       : 500,
		toolbar      : 'maxi'
	};
	// create editor
	//$('#messaggio').elrte(opts);
	/////////////////////////////
	if($("#flgTipo").val()==1)
		CKEDITOR.replace( 'messaggio' );
	//rebuildAllEditor();
}

function dettaglioArticoliVarianti(l_id_articolo, l_id_magazzino, l_id_clifor) {
	var f = document.main;
	
	$("#dettaglioWin").dialog("open");		
	$("#dettaglioWin").load("Movimento.abl?cmd=viewM&id_articolo="+l_id_articolo+"&id_magFisico="+l_id_magazzino+"&id_clifor="+l_id_clifor+"&flgInMagazzino="+f.flgInMagazzino.value);
	
	/*
	var f = document.main;
	//alert("kk "+f.descrizioneCli.value);
	theAction=webApp+"/admin/contab/Movimento.abl?cmd=viewM&id_articolo="+l_id_articolo+"&id_magFisico="+l_id_magazzino+"&id_clifor="+l_id_clifor+"&flgInMagazzino="+f.flgInMagazzino.value;
	//hideList('listaClienti');
	//f.descrizioneCliente.value="";
	//f.id_cliente.value="";
	wArticolo=window.open(theAction, "Lista_Varianti","width=810,height=600,status=yes,resizable=yes,top=100,left=100,scrollbars=yes");
	wArticolo.focus();
	*/
}

function closeMW() {
	$("#dettaglioWin").dialog("close");	
}

////////////////////////////////////////////////////
// INTERROGAZIONI ACCESSORIE SU ORDINI A FORNITORE
////////////////////////////////////////////////////
function searching2()
{
	var f = document.main;
	f.action=f.actionPage.value;
	f.cmd.value="interrogazione2";
	f.act.value="";
	Ab.submitAj('main');
}

function loadDettaglio2(id_documento)
{
	var f = document.main;
	f.id_documento.value = id_documento;
	f.action=f.actionPage.value;
	f.cmd.value="loadDettaglio2";
	f.act.value="";
	Ab.submitAj('main');
}

function loadDettaglio3(id_documento)
{
	var f = document.main;
	f.id_documento2.value = id_documento;
	f.action=f.actionPage.value;
	f.cmd.value="loadDettaglio3";
	f.act.value="";
	Ab.submitAj('main');
}

function loadDettaglio4(id_rigaDocumento)
{
	var f = document.main;
	f.id_rigaDocumento.value = id_rigaDocumento;
	f.action=f.actionPage.value;
	f.cmd.value="loadDettaglio4";
	f.act.value="";
	Ab.submitAj('main');
}

function aggiustaOrdini()
{
	var f = document.main;
	f.action=f.actionPage.value;
	f.cmd.value="aggiustaOrdini";
	f.act.value="";
	Ab.submitAj('main');
}

function searching3()
{
	var f = document.main;
	f.action=f.actionPage.value;
	f.cmd.value="interrogazione3";
	f.act.value="";
	Ab.submitAj('main');
}

/////////////////////////////////////report
///////////////////////////////////
function apriReport() {
	$( "#selReport" ).dialog( "open" );
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

///////////////////////////////////
//fetch per report csv
///////////////////////////////////
function reportCsv()
{
	Ab.fetch("Movimento.abl", "cmd=creaReportCsv", "fileCsv",null,1);	
}