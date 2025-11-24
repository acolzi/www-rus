
function controlloRegistrazione()
{
	var f = document.dettaglio;
	if(validateForm('login','Login','R','pwd','Password','R','nome','Nome','R','cognome','Cognome','R','eMail','Indirizzo e-mail','RisEmail','citta','Citta','R','indirizzo','Indirizzo','R','numeroCivico','Numero Civico','R','codFisc','Codice Fiscale','R'))

	{
		
				//checkboxes
			
				if (f.ckFlgPrivTrattamento.checked)	f.flgPrivTrattamento.value="1";	else f.flgPrivTrattamento.value="0";
				if (f.ckFlgPrivComunicazione.checked)	f.flgPrivComunicazione.value="1";	else f.flgPrivComunicazione.value="0";
				//privacy
				
				if(f.flgPrivTrattamento.value=="1")
					return true;
				else
				{
					alert("Attenzione!. E' obbligatorio fornire il consenso al trattamento dei dati comuni");
					return false;
				}	
				if(f.flgPrivComunicazione.value=="1")
					return true;
				else
				{
					alert("Attenzione!. E' obbligatorio fornire il consenso alle norme di utilizzo delle immagini");
					return false;
				}	
				
				
			

	}
	else
		return false;
		
	
	
}
