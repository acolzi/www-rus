/* ab-documento lte *
/* 4.1 */
/******************************/
/* JAVASCRIPT AD HOC PER DOCUMENTO TAGIO */
/* DALLA MODAL ALLA MAIN E VICEVERSA */
/******************************/
/* COPPIA FORMFIELD MODALFIELD PER CARICAMENTO DATI */
/* DALLA MODAL ALLA MAIN E VICEVERSA per cnuovo o midifico clifor*/
var retItemsColoreTaglio = [{
		"formField": "id_coloreDaAggiungere",
		"modalField": "id_colore"
	}, {
		"formField": "descrizioneColore",
		"modalField": "descrizioneColore"
	}

];

/*******************************************/
/*******************************************/
// evento dopo aver cercato articolo
/*******************************************/
/*******************************************/
function refreshArticolo() {
	if($("#id_articolo").val()==0 || $("#id_articolo").val()=="" ){
		alert("articolo non trovato");
	}
		
	else
		{
			$("#currentFocus").val("id_taglia");
		refresh();
		}
	
}

function checkArticoloTrovato() {
	if($("#id_articolo").val()==0 || $("#id_articolo").val()=="" ){
		
		Ab.setFocus("descrizioneRiga");
			setTimeout(function () {
		{
			swal("Attenzione!", "Articolo non trovato", "error")
			
		}

	}, 100);
		
		//alert("articolo non trovato");
	}
		 
	
	
}


/*******************************************/
/*******************************************/
// 
/*******************************************/
/*******************************************/
function calcolaTessutiTaglio() {

	if($("#id_magFisicoPartenza2").val()==0)
		{
			swal("Attenzione!", "Impostare una Magazzino di partenza tessuto", "warning")
		}
	else{
		
	
	
	swal({
			title: "Calcola Necessita' Tessuti per taglio",
			text: "In base agli articoli scelti, vengono scaricati i tessuti necessari. Sei Sicuro?",
			type: "warning",
			showCancelButton: true,
			confirmButtonClass: "btn-danger",
			confirmButtonText: "si",
			cancelButtonText: "no",
				closeOnConfirm: true,
				closeOnCancel: true
			},
			function (isConfirm) {
				//alert( $('#main').serialize());
				if (isConfirm) {
					//chiamo un comando che lancia un thread?
					var f = document.main;
					f.action = f.actionPage.value;
					//$("#id_documento").val(l_id);
					$("#cmd").val("calcolaTessutiTaglio");
					Ab.submitAj('main');

				} else {

				}
			});

			}
	
}

/*******************************************/
/*******************************************/
/*  documento taglio.. aggiunger riga smart!!!*/
/*******************************************/
/*******************************************/
function aggiungiColoreTaglio() {


	var f = document.main;

	var l_lang = $("#lang").val(),
		descArticolo = $("#descArticolo").val(),
		descTaglia = $("#descTaglia").val(),
		descColore = $("#descColore").val();
	//checkBoxes();
	f.action = f.actionPage.value;



	if (Ab.validateForm3(l_lang, "main", "id_articolo", descArticolo, "RisNumKey", "id_taglia", descTaglia, "RisNumkey", "id_coloreDaAggiungere", descColore, "RisNumKey")) {


		f.cmd.value = "aggiungiColoreTaglio";
		//f.act.value="addRigaTessuto";
		$("#currentFocus").val("descrizioneColore");
		//
		Ab.submitAj('main');
	}


}


/*******************************************/
/*******************************************/
/*  documento taglio.. salva riga con totale capi da fare!!!*/
/*******************************************/
/*******************************************/
function aggiornaCapiRigaDocumentoTaglio(l_id) {
	var action = $("#actionPage").val();


	Ab.fetch(action, "cmd=aggiornaCapiRigaDocumentoTaglio&id_rigaDocumento=" + l_id + "&nrNew=" + $("#nr_" + l_id).val(), "messaggi");
	Ab.setFocusNextField("nr_" + l_id);

}


/////////////////////////////////////////////
// APRE POPUP lista ordini di taglio
/////////////////////////////////////////////
function popupOrdiniTaglio() {
	var l_id_documento = $("#id_documento").val();
	//alert($("#actionPage").val() + "?cmd=associaOrdineTaglioS&id_documento=" + l_id_documento);
	$('#modalWindow .modal-title').html("Elenco Ordini Taglio");
	$('#modalWindow').modal('show');
	$('#modalWindow .modal-body').load($("#actionPage").val() + "?cmd=associaOrdineTaglioS&id_documento=" + l_id_documento);
	/*$(".dummyCreaDoc").load($("#actionPage").val() + "?cmd=creaDocFigliS&id_documento=" + l_id_documento, function () {
		$('#modalDocFiglio .modal-body').html($(".dummyCreaDoc").html());

		$(".dummyCreaDoc").html();
	});*/
}

/////////////////////////////////////////////
//comando associazione ordine di taglio a disposizione taglio
/////////////////////////////////////////////
function associaOrdineTaglio(l_id_documento) {
	var f = document.main;
	if (l_id_documento == 0) {
		alert("ERRORE! documento non valido!");
		return;
	}
	$('#modalWindow').modal('hide')
		//apro la finestra che mi permette di scegliere il fornitore ed

	f.cmd.value = "associaOrdineTaglio";
	f.action = f.actionPage.value;
	f.id_documentoOrdineTaglio.value = l_id_documento;

	//f.act.value="addRigaTessuto";
	//
	Ab.submitAj('main');
}

/*****************************************************/
/*****************************************************/
/* DISSOCIA ORDINE TAGLIO   MA NON TOGLIE LE RIGHE */
/*****************************************************/
/*****************************************************/
function dissociaOrdineTaglio(l_id) {
	Ab.confirmDelete4(function () {
		var f = document.main;
		//	FACCIO IL SUBMIT
		f.cmd.value = "dissociaOrdineTaglio";
		f.id_docFiglioPadre.value = l_id;
		f.action = f.actionPage.value;
		Ab.submitAj('main');
	});
}



/************************************************/
/************************************************/
/* BOTTONE NUOVOCOLORE CAMPO AJAX
/************************************************/
/************************************************/
function nuovoColoreTaglio() {
	newColore("main", retItemsColoreTaglio);
}


/************************************************/
/************************************************/
/* dopo aver salvato il colore vodo ad associarlo all'ordine di taglio
/************************************************/
/************************************************/
function extraPostSaveColore() {
	aggiungiColoreTaglio();
}

/************************************************/
/************************************************/
/* da articolo non funziona direttamente il save command....
// mezzo secondo di ritatdo  e funziona
/************************************************/
/************************************************/
function saveCommandDaArticolo() {
	setTimeout(function () {
		{
			$("#currentTab").val("#ORDINI");
			$("#act").val("saveDisposizioneTaglio");
			//attivaTab("ORDINI");
			saveCommand();

		}

	}, 100);


}

/************************************************/
/************************************************/
/* nella schelta degli ordine taglio seleziono tutti gli ordini
/************************************************/
/************************************************/
function selezionaTuttoOrdineTaglio() {
	//var valore = $("#ckflgSelezionaTutto").attr("checked")=="checked"?true:false; 
	var valore = $("#flgOrdineTaglioST").val();
	$("input[id^='ckflgOrdineTaglio_']").each(function (index, element) {
		//element.checked = valore;
		var id = $(element).attr("name").replace("ckflgOrdineTaglio_", "");
		element.checked = valore == 0 ? false : true;
		$("#flgOrdineTaglio_" + id).val(valore);
	});
}



/*****************************************/
/*****************************************/
/* comando associa tutti gli ordini di taglio selezionati/*
/*****************************************/
/*****************************************/
function associaOrdineTaglioSelezionati() {
	var f = document.main;
	$('#modalWindow').modal('hide')
	setTimeout(function () {
		{
			swal({
					title: "Associazione Ordini Taglio",
					text: "Verranno Associati gli Ordini di Taglio Selezionati. Sei Sicuro?",
					type: "warning",
					showCancelButton: true,
					confirmButtonClass: "btn-danger",
					confirmButtonText: "si",
					cancelButtonText: "no",
					closeOnConfirm: true,
					closeOnCancel: true
				},
				function (isConfirm) {
					if (isConfirm) {
						f.cmd.value = "associaOrdiniTaglio";



						var id_documenti = "";
						$("input[name^='ckflgOrdineTaglio_']").each(function () {
							// faccio la lista dei servizi selezionati da passare alla servlet
							if (this.checked) {
								var id = this.name.replace("ckflgOrdineTaglio_", "");

								id_documenti += id + ",";
							}
						});

						f.id_documenti.value = id_documenti;

						f.action = f.actionPage.value;
						Ab.submitAj('main');
					} else {

					}
				});

		}

	}, 500);


}

/*****************************************/
/*****************************************/
/* stampaDisposizioneTaglio report, non quella per il tagliatore/*
/*****************************************/
/*****************************************/
function stampaDisposizioneTaglio()
{
	//swal(id);
	id=$("#id_documento").val();
	//alert(id);
	if(id!=0)
	{
		var f = document.main;
		
			var debug=false;
			var wwD="700";
			var whD="500";
			//+"&xxx="+f.xxx.value
			theAction=f.actionPage.value+".pdf?cmd=printDisposizioneTaglio&id_documento="+id;
			//
			//var numLabels=prompt("Numero di etichette da stampare","1");	
			if(debug==false)
			{
				window.open(theAction, "Stampa_Disposizione","width="+wwD+",height="+whD+",status=no,resizable=yes,top=100,left=100,scrollbars=yes");
			}
			else
			{
				window.open(theAction); 
			}
		
		
	}
	
}

/*****************************************/
/*****************************************/
/* nuovo articolo: va proprio sulla pagina articolo/*
/*****************************************/
/*****************************************/
function nuovoArticolo()
{

swal({
		  title: "Nuovo Articolo",
		  text: "Crei un nuovo articolo?",
		  type: "info",
		  showCancelButton: true,
		  confirmButtonClass: "btn-info",
		  confirmButtonText: "si",
		  cancelButtonText: "no",
		  closeOnConfirm: true,
		  closeOnCancel: true
		},
		function(isConfirm) {
		  if (isConfirm) {
			$("#main").attr("action","../art/Articolo.abl");		
			//$("#flgReport").val("S");
			$("#cmd", "#main").val("ni");
			$("#act","#main").val("");
			$("#cmd2").val("");
			$("#act2").val("");
			$("#pageNumber").val("1");
			Ab.submitAj('main');
		  } else {
			
		  }
		});
		
}

/*****************************************/
/*****************************************/
/* modifica articolo: va proprio sulla pagina articolo/*
/*****************************************/
/*****************************************/
function modificaArticolo()
{


	$("#main").attr("action","../art/Articolo.abl");		
	//$("#flgReport").val("S");
	$("#cmd", "#main").val("md");
	$("#act","#main").val("");
	$("#cmd2").val("");
	$("#act2").val("");
	$("#pageNumber").val("1");
	Ab.submitAj('main');
		  
}
