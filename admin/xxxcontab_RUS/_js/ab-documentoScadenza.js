// javascript per gestione campi obbligatori//
// javascript per gestione campi obbligatori///

function documentReadyScriptCR() 
{
	calcolaImportoSelezionate();
}

$('#myModal').on('show.bs.modal', function (e) 
{
	$("#dataScadenzaMDa").val($("#dataScadenzaDa").val());
	$("#dataScadenzaMA").val($("#dataScadenzaA").val());
	
	if ($("input[id^=ckflgScadenzaSelezionata_]:checked").length > 0) 
	{
		var scadenze = "";
		
		$("input[id^=ckflgScadenzaSelezionata_]:checked").each(function(k, v) {
			scadenze += $(v).attr("idScadenza") + ";";
		});
		
		$("#scadenzeSelezionate").val(scadenze);
	}
	else 
	{
		swal("Errore", "Selezionare almeno una scadenza!", "error");
		$('#myModal').close();
	}
});


function creaDistinta()
{
	var dataDa = $("#dataScadenzaMDa").val(),
		dataA = $("#dataScadenzaMA").val();
	
	/*
	if (dataDa == "") 
	{
		swal("Errore!", "Inserire la data da", "error"); 
		$("#dataScadenzaMDa").focus();
		return;	
	}
	if (dataA == "") 
	{
		swal("Errore!", "Inserire la data a", "error"); 
		$("#dataScadenzaMA").focus();
		return;	
	}
	*/
	if ($("#id_banca").val() == 0) 
	{
		swal("Errore!", "Inserire la banca", "error"); 
		$("#id_banca").focus();
		return;	
	}
	if ($("#dataPresentazione").val() == 0) 
	{
		swal("Errore!", "Inserire la data presentazione", "error"); 
		$("#dataPresentazione").focus();
		return;	
	}
	
	Ab.removeFadeModal();
	
 	var f = document.main;
 	f.action=f.actionPage.value;
 	f.cmd.value="creaDistinta";
 	Ab.submitAj('main');
 }
 

$(":checkbox").on("ifChecked", null, null, function () {
	if ($(this).attr("name").indexOf("ckflgScadenza") >= 0) 
	{
		var id_documentoScadenza = $(this).attr("idScadenza");
		
		Ab.fetch($("#actionPage").val(), "cmd=selezionaScadenza&id_documentoScadenza="+id_documentoScadenza);
		
		calcolaImportoSelezionate();
	}
	else if ($(this).attr("name") == "ckflgAll")
	{
		
		$("input[id^=ckflgScadenzaSelezionata_]").each(function(key, val) 
		{
			$(val).iCheck('check');
		});
		
		checkUncheck(this);
	}
	else 
	{
		checkUncheck(this);
	}
});


$(":checkbox").on("ifUnchecked", null, null, function () {
	if ($(this).attr("name").indexOf("ckflgScadenza") >= 0) 
	{
		var id_documentoScadenza = $(this).attr("idScadenza");
	
		$("#ckflgAll").iCheck('uncheck');
		
		Ab.fetch($("#actionPage").val(), "cmd=deselezionaScadenza&id_documentoScadenza="+id_documentoScadenza);
	
		calcolaImportoSelezionate();
	} 
	else if ($(this).attr("name") == "ckflgAll")
	{
		
		$("input[id^=ckflgScadenzaSelezionata_]").each(function(key, val) 
		{
			$(val).iCheck('uncheck');
		});
		
		checkUncheck(this);
	}
	else 
	{
		checkUncheck(this);
	}
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
 	
	searching();
 }
 
function calcolaImportoSelezionate() 
{
	var tot = 0;
	
	$("input[id^=ckflgScadenzaSelezionata_]:checked").each(function(k, v) {
		tot += parseFloat($(v).attr("importo"));
	});
	
	$("#importoSelezionato").val(tot.toFixed(2).replace(".", ","));
 }
 
 ///////////////////////////////////////////

function creaDistintaAuto()
{
	var dataFatturaDa=$("#dataFatturaDa").val(),
		dataFatturaA=$("#dataFatturaA").val(),
		dataScadenzaDa=$("#dataScadenzaDa").val(),
		dataScadenzaA=$("#dataScadenzaA").val();
		
	if((dataFatturaDa==0 || dataFatturaA==0) && (dataScadenzaDa==0 || dataScadenazaA==0))
		{	
			swal("Errore", "Selezionare almeno una intervallo di fatturazione o scadenza!", "error");
			return;
		}
	if($("#numBancheSelezionate").val()==0)
		{	
			swal("Errore", "Selezionare almeno una banca!", "error");
			return;
		}
	
	swal({   
		title: "Sei sicuro?",   
		text: "Vuoi creare le distinte relative agli importi selezionati?",   
		type: "warning",   
		showCancelButton: true,   
		confirmButtonColor: "#DD6B55",  
		confirmButtonText: "Si",   
		cancelButtonText: "No",   
		closeOnConfirm: true 
	 }, function(){  
		var f = document.main;
		f.action=f.actionPage.value;
		f.cmd.value="creaDistinta";
		Ab.submitAj('main');
	 });
}

function recuperaTotaleAuto()
{
	var actionPage = $("#actionPage").val(),
		dataFatturaDa = $("#dataFatturaDa").val(),
		dataFatturaA = $("#dataFatturaA").val(),
		dataScadenzaDa = $("#dataScadenzaDa").val(),
		dataScadenzaA = $("#dataScadenzaA").val(),
		numDocumentoDa = $("#numDocumentoDa").val(),
		numDocumentoA = $("#numDocumentoA").val();
	
	Ab.fetch(actionPage, "cmd=recuperaTotale&dataFatturaDa="+dataFatturaDa + "&dataFatturaA="+dataFatturaA +"&dataScadenzaDa="+dataScadenzaDa + "&dataScadenzaA="+dataScadenzaA + "&numDocumentoDa="+numDocumentoDa + "&numDocumentoA="+numDocumentoA, null, "postRecuperaTotaleAuto()", true);
	
}

function postRecuperaTotaleAuto(data)
{
	$("#totaleRiba").val(data);	
}

function caricaEstrazione(tmstp)
{
	//FACCIO IL SUBMIT
	var f = document.main;
	f.timestampElaborazione.value = tmstp;
	refresh();
}

/*********************************/
/*********************************/
/* STAMPA SINGOLA DISTINTA */
/*********************************/
/*********************************/
function stampaDistinta(id)
{
	var f = document.main,
		debug=false,
		wwD="700",
		whD="500",
		theAction=f.actionPage.value+".pdf?cmd=print"+"&id_distintaRiba="+id;
	
	if(debug==false)
	{
		window.open(theAction, "Stampa_Report","width="+wwD+",height="+whD+",status=no,resizable=yes,top=100,left=100,scrollbars=yes");
	}
	else
	{
		window.open(theAction); 
	}
}

/////////////////////////////////////////////7
function checkFields()
/////////////////////////////////////////////7
{
	
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

function printr()
{
	var f = document.main;
	var debug=false;
	var wwD="700";
	var whD="500";
	//+"&xxx="+f.xxx.value
	theAction=f.actionPage.value+".pdf?cmd=print&act=lista"+"&id_clifor="+f.id_clifor.value+"&dataScadenzaDa="+f.dataScadenzaDa.value+"&dataScadenzaA="+f.dataScadenzaA.value+"&flgTipoPagamento="+f.flgTipoPagamento.value;
	//
	//var numLabels=prompt("Numero di etichette da stampare","1");	
	if(debug==false)
	{
		window.open(theAction, "Stampa_Report","width="+wwD+",height="+whD+",status=no,resizable=yes,top=100,left=100,scrollbars=yes");
	}
	else
	{
		window.open(theAction); 
	}
	
	/*
	var f = document.main;
	f.action=f.actionPage.value;
	f.cmd.value="print";
	f.act.value="lista";
	Ab.submitAj('main');
	*/
}

function eliminaDistinta(l_id)
{
	swal({   
		title: "Sei sicuro?",   
		text: "I dati saranno cancellati. Vuoi continuare?",   
		type: "warning",   
		showCancelButton: true,   
		confirmButtonColor: "#DD6B55",  
		confirmButtonText: "Si",   
		cancelButtonText: "No",   
		closeOnConfirm: true 
	 }, function(){  
		var f = document.main;
		f.action=f.actionPage.value;
		f.id_distintaRiba.value = l_id;
		f.cmd.value="eliminaDistinta";
		f.act.value="";
		Ab.submitAj('main');
	 });
}

function bancaPiu(id)
{
	//console.log("aaaa");
	
	var f = document.main;
 	f.action=f.actionPage.value;
	f.id_banca.value = id;
 	f.cmd.value="bancaMeno";
 	Ab.submitAj('main');
}

function bancaMeno(id)
{
	console.log("bbbb");

	var f = document.main;
 	f.action=f.actionPage.value;
	f.id_banca.value = id;
 	f.cmd.value="bancaPiu";
 	Ab.submitAj('main');
}

/*******************************************/
/*******************************************/
/* aggiunge la banca all'elenco delle visibili per la distinta */
/*******************************************/
/*******************************************/
function addBancaADistinta()
{
	var f = document.main;
 	f.action=f.actionPage.value;
	//f.id_banca.value = id;
 	f.cmd.value="addBancaADistinta";
 	Ab.submitAj('main');

}

/*******************************************/
/*******************************************/
/* rimuove la banca all'elenco delle visibili per la distinta */
/*******************************************/
/*******************************************/
function rimuoviBancaDaDistinta(id)
{
	
	var f = document.main;
 	f.action=f.actionPage.value;
	f.id_banca.value = id;
 	f.cmd.value="rimuoviBancaDaDistinta";
 	Ab.submitAj('main');
}


/*********************************/
/*********************************/
/* STAMPA elaborazione DISTINTA */
/*********************************/
/*********************************/
function stampaElaborazione()
{
	var f = document.main,
		debug=false,
		wwD="700",
		whD="500",
		theAction=f.actionPage.value+".pdf?cmd=print"+"&timestampElaborazione="+$("#timestampElaborazione").val();
	
	if(debug==false)
	{
		window.open(theAction, "Stampa_Report","width="+wwD+",height="+whD+",status=no,resizable=yes,top=100,left=100,scrollbars=yes");
	}
	else
	{
		window.open(theAction); 
	}
}
