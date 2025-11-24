function checkFields()
/////////////////////////////////////////////
{
	return true;
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

$(":checkbox").on("ifChecked", null, null, function () {
	checkUncheck(this);
});

$(":checkbox").on("ifUnchecked", null, null, function () {
	checkUncheck(this);
});

function checkUncheck(that)
{
	// trovo l'input collegato alla checkbox
	var name = $(that).attr("name").replace("ck", "");
	
	// controllo lo stato della checkbox e valorizzo la input
	if ($(that).is(":checked"))
	{
		$("#" + name).val(1);
	}
	else
	{
		$("#" + name).val(0);
	}
	
	
	saveCommand();
}

function creaFile()
{
	var f = document.main;
	f.action=f.actionPage.value;
	f.cmd.value="creaFile";
	Ab.submitAj('main');
}

function printCommand()
{
	var f = document.main,
		debug=false,
		wwD="700",
		whD="500",
		theAction=f.actionPage.value+".pdf?cmd=print"+"&id_distintaRiba="+f.id_distintaRiba.value;
	
	if(debug==false)
	{
		window.open(theAction, "Stampa_Report","width="+wwD+",height="+whD+",status=no,resizable=yes,top=100,left=100,scrollbars=yes");
	}
	else
	{
		window.open(theAction); 
	}
}