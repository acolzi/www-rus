
/*************************************/
/*************************************/
/* apre popup ricerca banca
/*************************************/
/*************************************/
function cercaBanca()
{
	console.log("cercabanca...");

	$("#modalBanca").modal("show");
}

function selezionaBanca(descrizione, iban,bic)
{
	$("#bancaDesc").val(descrizione);
	$("#iban").val(iban);
	$("#bic").val(bic);
	
	$("#modalBanca").modal("hide");
}