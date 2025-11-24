/**
 *
 * GESTIONE DELLA VISUALIZZAZIONE DEI LINK DELL'IMMAGINE
 *
 */
for (var i=1; i<=3; i++)
{
	// se esiste il campo vuol dire che sto 
	// visualizzando un'immagine e quindi 
	// devo visualizzare anche i link sottostanti
	if ($("#img_vis_"+i).val()) 
	{
		$("#btn-area-div_"+i).show();
	}
}
