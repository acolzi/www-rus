// JavaScript Document


/***************************************************/
/***************************************************/
/* PAGINA INDEX.JSP */
/***************************************************/
/***************************************************/
function searchFS() {

	var f = document.frmFS;

	Ab.submitAj('frmFS', 'gareFS');
	console.log("1 fatto..");


}

function searchFE() {

 f
	Ab.submitAj('frmFE', 'gareFE');
	console.log("2 fatto..");

}

function prevPageFS() {
	var f = document.frmFS;
	//
	var currentPage=eval($("#pageNumberFS").val());
		//alert(currentPage  );
	if(currentPage>1)
		{
			f.pageNumberFS.value =currentPage  - 1;
			Ab.submitAj('frmFS', 'gareFS');
		}
	
}

function nextPageFS() {
	var f = document.frmFS;
	//
	var currentPage=eval($("#pageNumberFS").val());
	var totPage=eval($("#totPageNumber_0").val());
	//alert(currentPage +" "+totPage );
	if(currentPage<totPage)
		{
			f.pageNumberFS.value = currentPage + 1;
			//alert(f.pageNumberFS.value);
			Ab.submitAj('frmFS', 'gareFS');
		}
		
}

function prevPageFE() {
	var f = document.frmFE;
	//
	var currentPage=eval($("#pageNumberFE").val());
		//alert(currentPage  );
	if(currentPage>1)
		{
			f.pageNumberFE.value =currentPage  - 1;
			Ab.submitAj('frmFE', 'gareFE');
		}
}

function nextPageFE() {
	var f = document.frmFE;
	//
	var currentPage=eval($("#pageNumberFE").val());
	var totPage=eval($("#totPageNumber_1").val());
	//alert(currentPage +" "+totPage );
	if(currentPage<totPage)
		{
			f.pageNumberFE.value = currentPage + 1;
			//alert(f.pageNumberFS.value);
			Ab.submitAj('frmFE', 'gareFE');
		}
}
/***************************************************/
/***************************************************/
/* PAGINA GARA.CR */
/***************************************************/
/***************************************************/
function searchGara() {
	//eventi,Gara.abl,search,,@id_tipoGara@flgMese@anno@pageNumber
	var f = document.main;
	$("body").addClass("loading");
	f.submit();
	//Ab.submitAj('main');


}
/***************************************************/
/***************************************************/
/* PAGINA RICERCA FOTOCR */
/***************************************************/
/***************************************************/
function searching() {
	//gara%201_gara-1---2.html
	$("body").addClass("loading");
	theSvlt = $("#garaDesc").val() + "_gara-" + $("#id_gara").val() + "-" + $("#id_puntoFoto").val() + "-" + $("#tipoPuntoFoto").val() + "-" + $("#pageRow").val() + "-1-"+$("#pettorale").val()+".html";
	//alert(theSvlt);
	location.href = theSvlt;

}
function searchingTPF() {
	//gara%201_gara-1---2.html

	theSvlt = $("#garaDesc").val() + "_gara-" + $("#id_gara").val() + "--" + $("#tipoPuntoFoto").val() + "-" + $("#pageRow").val() + "-1.html";
	//alert(theSvlt);
	location.href = theSvlt;

}
function searchingPF() {
	//gara%201_gara-1---2.html

	theSvlt = $("#garaDesc").val() + "_gara-" + $("#id_gara").val() + "-" + $("#id_puntoFoto").val() + "--" + $("#pageRow").val() + "-1.html";
	//alert(theSvlt);
	location.href = theSvlt;

}
function loginFCR() {
	//FACCIO IL SUBMIT
	var f = document.frmLogin;
	if (Ab.validateForm('login', 'Login', 'R', 'pwd', 'password', 'R')) {
		$("body").addClass("loading");
		f.cmdIU.value = "check";
		f.act.value = "";
		f.thePage.value = window.location.href;
		f.action = "Logon.abl";
		f.submit();
	}

}

function mostraFoto(l_id) {
	//alert("Foto2.abl?cmd=mostraFoto&id_foto=" + l_id);
	$("#fotoView").load("Foto2.abl?cmd=mostraFoto&id_foto=" + l_id);

	$("#ModalLog").modal("show");

}
/***************************************************/
/***************************************************/
/* PAGINA dati personali DOCUMENTOCR */
/***************************************************/
/***************************************************/
function loginDCR() {
	//FACCIO IL SUBMIT
	var f = document.frmLogin;
	if (Ab.validateForm('login', 'Login', 'R', 'pwd', 'password', 'R')) {
		$("body").addClass("loading");
		f.cmdIU.value = "check";
		f.act.value = ""
		f.action = "Logon.abl";
		f.submit();
	}

}
/*************************************************************/
/*************************************************************/
/*** invia coupon
/*************************************************************/
/*************************************************************/

function inviaCoupon() {
	//FACCIO IL SUBMIT
	
	var f = document.frmCoupon;
	if (Ab.validateForm('coupon', 'Coupon', 'R')) {
		$("body").addClass("loading");
		f.cmd.value = "inviaCoupon";
		f.act.value = ""
		f.action = "Ordine.abl";
		f.submit();
	}

}


/*************************************************************/
/*************************************************************/
/*** LOST PASSWORD
/*************************************************************/
/*************************************************************/

function lostPwdForm(theForm) {
	var f = theForm;
	var l_lang = $("#lang").val();
	if (Ab.validateForm('lostPwdEmail', 'Email di recupero', 'RisEmail')) {
		$("body").addClass("loading");
		f.action = "Users.abl";
		f.cmd.value = "lostPassword";
		f.act.value = "";
		f.submit();
	}
}

function lostPwdCheckOut() {
	lostPwdForm(document.cart);
}

function lostPwdLogon() {
	lostPwdForm(document.frmLogin);
}

/***************************************************/
/***************************************************/
/* PAGINA registrazione */
/***************************************************/
/***************************************************/
function controlloRegistrazione() {
	//alert('pio');  
	var f = document.dettaglio; 
	//if (Ab.validateForm('login', 'Login', 'R', 'pwd', 'Password', 'R', 'nome', 'Nome', 'R', 'cognome', 'Cognome', 'R', 'eMail', 'Indirizzo e-mail', 'RisEmail', 'citta', 'Citta', 'R', 'cap', 'Cap', 'R', 'indirizzo', 'Indirizzo', 'R', 'numeroCivico', 'Numero Civico', 'R', 'codFisc', 'Codice Fiscale', 'R'))
	if (Ab.validateForm('login', 'Login', 'R', 'pwd', 'Password', 'R', 'nome', 'Nome', 'R', 'cognome', 'Cognome', 'R', 'eMail', 'Indirizzo e-mail', 'RisEmail', 'citta', 'Citta', 'R', 'cap', 'Cap', 'R', 'indirizzo', 'Indirizzo', 'R', 'numeroCivico', 'Numero Civico', 'R'))
	//	if(true)
	{

		//checkboxes
		

		if (f.ckFlgPrivTrattamento.checked) f.flgPrivTrattamento.value = "1";
		else f.flgPrivTrattamento.value = "0";
		if (f.ckFlgPrivComunicazione.checked) f.flgPrivComunicazione.value = "1";
		else f.flgPrivComunicazione.value = "0";
	if (f.ckflgMl.checked) f.flgMl.value = "1";
		else f.flgMl.value = "0";
		//privacy

		if (f.flgPrivTrattamento.value == "1")
			return true;
		else {
			alert("Attenzione!. E' obbligatorio fornire il consenso al trattamento dei dati comuni");
			return false;
		}
		if (f.flgPrivComunicazione.value == "1")
			return true;
		else {
			alert("Attenzione!. E' obbligatorio fornire il consenso alle norme di utilizzo delle immagini");
			return false;
		}




	} else
		return false;



}
/*************************************************************/
/*************************************************************/
/*** VISTA COMPATTA E ESTESA FOTOCR
/*************************************************************/
/*************************************************************/

function vistaCompatta() { 
	
		//fetch(servlet, command, divList, postProcess, async, type)
	Ab.fetch("Foto2.abl", "cmd=vistaCompatta", "vis", null, 1);
	var thePage= window.location.href;
	
	location.href = thePage;
}

function vistaEstesa() {
	
	Ab.fetch("Foto2.abl", "cmd=vistaEstesa", "vis", null, 1);
	var thePage= window.location.href;
	
	location.href = thePage;
}

/*************************************************************/
/*************************************************************/
/*** go page sopra
/*************************************************************/
/*************************************************************/
function goPage()
{
		//richiamo anche un metodo che carica i checkBox e i checkRadio
  	var pnGo=$("#pageNumberGo").val(),
	pn=$("#totPageNumber").val();
	
	
		if(parseFloat(pnGo)<= parseFloat(pn))
        {
            theSvlt = $("#garaDesc").val() + "_gara-" + $("#id_gara").val() + "-" + $("#id_puntoFoto").val() + "-" + $("#tipoPuntoFoto").val() + "-" + $("#pageRow").val() + "-"+pnGo+".html";
		//alert(theSvlt);
		location.href = theSvlt;
        }
        else
        alert('Errore!!');
}

 


/*************************************************************/
/*************************************************************/
/*** fase INIZIALE pagamento paypal
/*************************************************************/
/*************************************************************/
function startPayPal()
{
var f = document.paypal;
//if (confirm(f.seiSicuro.value))
	{	
		{
			$("body").addClass("loading");
			f.submit();
		}
	}
		
}
function startPayPal1()
{
	$("#amt").val("20,00");
	startPayPal();
		
}
function startPayPal3()
{
	$("#amt").val("40,00");
	startPayPal();
		
} 
function startPayPal20f()
{
	$("#amt").val("5,00");
	startPayPal();
		
} 
/*************************************************************/
/*************************************************************/
/*** fase finale pagamento paypal
/*************************************************************/
/*************************************************************/
function doPayPal()
{ 
var f = document.cart;
//if (confirm(f.seiSicuro.value)) 
	{	
		
		{
			$("body").addClass("loading");
			f.action="PayPalDoPayment.abl";
			f.cmd.value="doPayment";
			f.submit();
		}
	}
		
}

/*************************************************************/
/*************************************************************/
/*** faggiungo click thru sull'allegato immagine
/*************************************************************/
/*************************************************************/
function addClickThroughAttach(id)
{ 
//alert('aaaa News.abl?cmd=addClickThroughAttach&id='+id);
    Ab.fetch4("News.abl", "cmd=addClickThroughAttach&id="+id, null, null, true, null) ;
    //Ab.fetch("News.abl", "cmd=addClickThroughAttach&id="+id, "", null, 1);
		
}
