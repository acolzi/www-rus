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

      return Ab.validateForm('descrizione','Descrizione','R');	
}


/************************************************/
/************************************************/
/** REPORT MA FORSE NON SERVE */
/************************************************/
/************************************************/
function reportxxx()
{
		//FACCIO IL SUBMIT
		var f = document.main;
		f.flgReport.value="S";
		//f.action=webApp+"/tr/Pratica.abl";
		f.cmd.value="search";
		Ab.submitAj('main');
}


/************************************************/
/************************************************/
/* TEMPLATE GESTIONE RIGHE */
/************************************************/
/************************************************/
function addRow()
{
       
	var f = document.main;
	f.action=f.actionPage.value;
	if (Ab.validateForm('id_riga','Row','R'))
	{
		f.cmd.value="addRow";
		f.act.value="";
		Ab.submitAj('main');
	}
}

function delRow(l_id)
{
 if (Ab.confirmDelete())
	{      
		var f = document.main;
		f.action=f.actionPage.value;
	//	FACCIO IL SUBMIT
		f.cmd.value="delRow";
		f.act.value="";
		f.id_riga.value=l_id;
		Ab.submitAj('main');
	}

}
function modRow(l_id)
{
 
	{      
		var f = document.main;
		f.action=f.actionPage.value;
	//	FACCIO IL SUBMIT
		f.cmd.value="modRo";
		f.act.value="";
		f.id_riga.value=l_id;
		Ab.submitAj('main');
	}

}

function checkBoxes()
/////////////////////////////////////////////
{


}


function checkBoxesCR()
{
	
}