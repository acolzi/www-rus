// javascript per gestione campi obbligatori///


///////////////////////////////////////////
////////T O O L B A R /////////////////////
///////////////////////////////////////////
function vediFotoOld(foto,Atleta)
{
		//FACCIO IL SUBMIT
		var f = document.main;
		f.action=foto;
		f.AtletaCR.value=Atleta;
		f.target="_blank"; 
		Ab.submitAj('main');
		
}
function vediFoto(id_foto)
{
		//FACCIO IL SUBMIT
		var f = document.main;
		f.action="Foto.abl";
		f.id_foto.value=id_foto;
		f.cmd.value="foto";
		f.target="_blank"; 
		Ab.submitAj('main');
		
}
function vediFotoPD(foto)
{
		//FACCIO IL SUBMIT
		var f = document.main;
		f.action=foto;
		f.target="_blank" ;
		Ab.submitAj('main');
		
}

function searchingP()
{
		//FACCIO IL SUBMIT
	var f = document.main;
	if($("#file").val()==""){
		f.flgTh.value=0;
	}
	else{
		//alert("pio");
		f.flgTh.value=1;
	}
	//sempre con le foto
	f.flgTh.value=1;
		
		formSearching();
		Ab.submitAj('main');
		
}
function searchingPP()
{
		//FACCIO IL SUBMIT
		var f = document.main;
		f.flgTh.value=0;
		f.id_atleta.value=0;
		formSearching();
		Ab.submitAj('main');
		
}

function reportS()
{
		//FACCIO IL SUBMIT
		var f = document.main;
		f.flgReport.value="S";
		//f.action=webApp+"/tr/Pratica.abl";
		f.action="Foto.abl";
		f.cmd.value="search";
		f.target="" ;
	
		Ab.submitAj('main');
		
}



//****************************************************************
//****************************************************************
var pdfWin;

function previewDiploma(l_id,l_idpf)
{
		var f = document.main;
		crs="&id_foto="+l_id+"&id_puntoFoto="+l_idpf+"&pettorale="+f.pettorale.value+"&id_atleta="+f.id_atleta.value+"&secShift="+f.secShift.value+"&secRange="+f.secRange.value;
		//alert("Foto.abl?cmd=print&act=pw"+crs);
		pdfWin = window.open("Foto.abl?cmd=print&act=pw"+crs, "Print_window","");
	
}


/*********************************/
/*********************************/
/* nuovo print diploma direttamente sulla maschera unica di ricerca foto*/
/*********************************/
/*********************************/
function printDiploma(l_id)
{
	var f = document.main;
		crs="&id_foto="+l_id+"&id_puntoFoto="+f.id_puntoFoto.value+"&testo1="+f.testo1.value+"&testo2="+f.testo2.value+"&testo3="+f.testo3.value;
	
	pdfWin = window.open("../anag/Foto.abl?cmd=print"+crs, "Print_window","");
		
		
}

function previewDiplomaB(l_id)
{
		var f = document.main;
		crs="&id_fotoBase="+l_id+"&Atleta="+f.Atleta.value+"&id_puntoFoto="+f.id_puntoFoto.value+"&pettorale="+f.pettorale.value+"&id_atleta="+f.id_atleta.value+"&secShift="+f.secShift.value+"&secRange="+f.secRange.value;
		//alert("Foto.abl?cmd=print&act=pw"+crs);
		pdfWin = window.open("Foto.abl?cmd=print&act=pw"+crs, "Print_window","");
}

function printDiplomaB(l_id)
{
		var f = document.main;
		crs="&id_fotoBase="+l_id+"&Atleta="+f.Atleta.value+"&id_puntoFoto="+f.id_puntoFoto.value+"&pettorale="+f.pettorale.value+"&id_atleta="+f.id_atleta.value+"&secShift="+f.secShift.value+"&secRange="+f.secRange.value;
		//alert("Foto.abl?cmd=print&act=pw"+crs);
		pdfWin = window.open("Foto.abl?cmd=print"+crs, "Print_window","");
}
//////////////////////////////////////////



function previewFoto(l_id,l_idpf)
{
		var f = document.main;
		crs="&act2=F&id_foto="+l_id+"&id_puntoFoto="+l_idpf+"&pettorale="+f.pettorale.value+"&id_atleta="+f.id_atleta.value+"&secShift="+f.secShift.value+"&secRange="+f.secRange.value;
		//alert("Foto.abl?cmd=print&act=pw"+crs);
		pdfWin = window.open("Foto.abl?cmd=print&act=pw"+crs, "Print_window","");
		
}

function printFoto(l_id,l_idpf)
{
	var f = document.main;
		crs="&act2=F&id_foto="+l_id+"&id_puntoFoto="+l_idpf+"&pettorale="+f.pettorale.value+"&id_atleta="+f.id_atleta.value+"&secShift="+f.secShift.value+"&secRange="+f.secRange.value;
		pdfWin = window.open("Foto.abl?cmd=print"+crs, "Print_window","");
		
		
}


/////////////////////////////////////////////////

/////////////////////////////////////////////7
function checkFields()
/////////////////////////////////////////////7
{
	var f = document.main;
	return Ab.validateForm('descrizione','Descrizione','R');
}


function checkBoxes()
/////////////////////////////////////////////
{
//	var f = document.main;
//if (f.ckFlgMl.checked)	f.flgMl.value="1";	else f.flgMl.value="0";
}

function eseguiImport()
{
		//FACCIO IL SUBMIT
		var f = document.main;
		if (f.fileCsv.value=="")
			alert("Immettere il nome del file csv di import");
			else
			if (confirm("Sei Sicuro?"))
			{
			f.action="Foto.abl";
			f.cmd.value="import";
			Ab.submitAj('main');
		
			}
}

function pulisciCr(currentCr)
{
	var f = document.main;
	if(currentCr!="descrizioneAtleta")
	{
		f.descrizioneAtleta.value="";
		f.id_atleta.value="";
	}
	/*if(currentCr!="codChip")
	{
		f.codChip.value="";
	}*/
	if(currentCr!="pettorale")
	{
		f.pettorale.value="";
	}
	
}
function resetPf(currentCr)
{
	var f = document.main;
	f.secShift.value=0;
	f.secRange.value=0;
	
}

function nextFoto()
{
	if (checkFields())
	{
		checkBoxes();
    	var f = document.main;
		$("#main").attr("action", $("#actionPage").val()+"#foto");
//		FACCIO IL SUBMIT
		f.act.value="save";
		f.cmd.value="asq";
		f.act2.value="next";
		
		f.target="" ;
	
		//alert(f.cmd.value);
		Ab.submitAj('main');
		
	}

}

function prevFoto()
{
	if (checkFields())
	{
		checkBoxes();
    	var f = document.main;
		$("#main").attr("action", $("#actionPage").val()+"#foto");
//		FACCIO IL SUBMIT
		f.act.value="save";
		f.cmd.value="asq";
		f.act2.value="prev";
		
		f.target="" ;
	
		//alert(f.cmd.value);
		Ab.submitAj('main');
		
	}

}

function checkBoxesCR()
/////////////////////////////////////////////
{
	//var f = document.main;
	//if (f.ckFlgValido.checked) f.flgValido.value="S";else	f.flgValido.value="N";
}

function checkRadioCR()
{
	/*var f = document.main;
	
	if(f.rbFlgPagata[0].checked)
		f.flgPagata.value=f.rbFlgPagata[0].value;
	else
	if(f.rbFlgPagata[1].checked)
		f.flgPagata.value=f.rbFlgPagata[1].value;
	else
	f.flgPagata.value="";
	*/

}


/**********************************************/
/**********************************************/
/* paginazione ricerca e indicizza
/**********************************************/
/**********************************************/

function nextPageFoto()
{
	var f = document.main;
	//richiamo anche un metodo che carica i checkBox e i checkRadio
	f.flgTh.value=1;
	Ab.nextPage();
	
}

function prevPageFoto()
{
		var f = document.main;
	f.flgTh.value=1;
	Ab.prevPage();
}
function goPageFoto()
{
		var f = document.main;
	f.flgTh.value=1;
	Ab.goPage();
}
