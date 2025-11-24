// pkg_rigaDocumento

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

///////////////////////////////////////////
////////T O O L B A R /////////////////////
///////////////////////////////////////////

function report()
{
		//FACCIO IL SUBMIT
		var f = document.main;
		var rep = document.rep;	

		//f.flgTipoReport.value = rep.flgTipoReportC.value;

		//f.flgReport.value="S";
		f.flgReport.value=rep.flgTipoReport.value;
		if(rep.flgTipoReport.value=="TA")
			f.flgOrderBy.value=9;
		else
			f.flgOrderBy.value="";
			
		//f.action=webApp+"/tr/Pratica.abl";
		f.cmd.value="search";
		Ab.submitAj('main');
}

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
return Ab.validateForm('descrizione','Descrizione','R','numero','Numero','RisNum>0','eMail','','NisEmail');
	
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

function modifyDocumento(id)
{
	//FACCIO IL SUBMIT
	var f = document.main;
	f.action="../contab/Documento.abl";
	f.cmd.value="md";
	//f.act.value="view";
	f.id_documento.value=id;
	
	Ab.submitAj('main');
}

function riordino()
{
	var f = document.main;
	if(confirm("Verrà effettuato il riordino di magazzino per l'articolo. Vuoi continuare?"))
	{
		f.action=f.actionPage.value;
		f.cmd.value="riordinoMag";
		Ab.submitAj('main');	
	}
}

function apriReport() {
	$( "#selReport" ).dialog( "open" );
}
