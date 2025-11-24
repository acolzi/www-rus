///////////////////////////////////////////
////////L O G O N    /////////////////////
///////////////////////////////////////////

function conferma()
{
		//FACCIO IL SUBMIT
		if (checkLogonFields())
		{
			var f = document.logon;
			//alert('pio');
			//f.action="/spa/admin/AdminLogon.Svlt";
			f.cmdIU.value="check";
			f.submit();
				
		}
		
}
function logOff(theFrame)
{
		//FACCIO IL SUBMIT
		if(theFrame==null)
		{
			var f = document.logon;
			f.cmdIU.value="login";
			f.submit();
		}
		else
		{
			var menuSvlt = document.menu.logonAction.value;
			if (menuSvlt.charAt(0)=="/")
			{//path assoluto
				menuSvlt=webApp+menuSvlt;
			}
			if(ns4)
			{
				window.parent.frames[1].location.href=menuSvlt+"?cmdIU=login";
			}
			else
			{
				var theBody=document.parentWindow.top.frames[theFrame];
				//alert(menuSvlt+"?cmd=login");
				theBody.location.href=menuSvlt+"?cmdIU=login";
			}
		}

}
/////////////////////////////////////////////7
function checkLogonFields()
/////////////////////////////////////////////7
{
        var f = document.logon;
		var campo="";
		if (f.login.value=="")
		{
			campo="Login, ";
		}
		if (f.pwd.value=="")
		{
			campo=campo+"Password ";
		}
		if (campo!="")
		{
			alert("Attenzione! Manca uno o più campi obbligatori: "+campo);
			return false;
			
		}
		else
		{
			return true;
		}
}