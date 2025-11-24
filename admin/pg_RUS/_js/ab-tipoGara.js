

/*****************************************************/
/*****************************************************/
/* gestione righe */
/*****************************************************/
/*****************************************************/
function deleteBean(id)
{	
  Ab.confirmDelete4(function()
	{
		var f = document.main;
		f.act.value="del";
		f.cmd.value="asq";
		f.id_tipoGara.value=id;
		f.action=f.actionPage.value;
		Ab.submitAj('main');
	});
	
	
}

function modifyBean(id)
{

//	FACCIO IL SUBMIT
	var f = document.main;
	f.action=f.actionPage.value;
	f.cmd.value="md";
	f.id_tipoGara.value=id;
	Ab.submitAj('main');


}

/*****************************************************/
/*****************************************************/
/*** BOH!*/
/*****************************************************/
/*****************************************************/
function diventaRoot()
{
	var f = document.main;
		f.action=f.actionPage.value;
	f.id_tipoGaraPadre.value=0;
	Ab.submitAj('main');
	
}



/////////////////////////////////////////////7
function checkFields()
/////////////////////////////////////////////7
{
    return Ab.validateForm('id_tipoGara','Codice','R','descrizione','Descrizione','R');

}

function listaTipoGara(id)
{

//	FACCIO IL SUBMIT
	var f = document.main;
	f.action=f.actionPage.value;
	f.cmd.value="search";
	f.id_tipoGaraPadre.value=id;
	Ab.submitAj('main');


}

function visibilita(id)
{

//	FACCIO IL SUBMIT
	var f = document.main;
		f.action=f.actionPage.value;
	f.cmd.value="search";
	f.act.value="visibilita";
	Ab.submitAj('main');


}

function ordineAlfabetico()
{

//	FACCIO IL SUBMIT
if(confirm("I Tipi articolo verranno riordinati in ordine alfabetico. Vuoi Continuare?"))
{
	var f = document.main;
	f.action=f.actionPage.value;
	f.cmd.value="ordinaAlfabetico";
	f.act.value="";
	Ab.submitAj('main');
}

}


function newCommandPDxx()
{
   	var f = document.main;
	if(confirm("Nuovo Record. Vuoi salvare il record corrente?"))
	{
		if (checkFields())
		{
			checkBoxes();
			f.cmd.value="asq";
			f.act.value="ni";
			Ab.submitAj('main');
		}
	}
	else
	{
		f.cmd.value="ni";
		Ab.submitAj('main');
	}
		
}
function rebuildDesc()
{
	
	
}

function checkBoxesCR()
/////////////////////////////////////////////
{
		
}
function checkBoxes()
/////////////////////////////////////////////
{
		
}


function ricalcolaIndici()
{

//	FACCIO IL SUBMIT
if(confirm("Verrranno ricalcolati gli indici. Vuoi Continuare?"))
{
	var f = document.main;
	f.action=f.actionPage.value;
	f.cmd.value="indici";
	f.act.value="";
	Ab.submitAj('main');
}

}
