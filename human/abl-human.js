// human

// JavaScript Document

/*************************************************************/
/*************************************************************/
/*catica il challenge*/
/*************************************************************/
/*************************************************************/
function fetchChallenge() {

  $("#cmd").val("sendChallenge");
	console.log($("#hkForm").serialize());
  Ab.fetch4("HumanCeck.abl", $("#hkForm").serialize(), "_challenge", null, true);
}


/*************************************************************/
/*************************************************************/
/*invia la risposta*/
/*************************************************************/
/*************************************************************/
function checkChallenge() {

  $("#cmd").val("checkChallenge");
  //alert(	$("#h_answer").val());
  //alert($("#hkForm").serialize());
	console.log($("#hkForm").serialize());
  Ab.fetch4("HumanCeck.abl", $("#hkForm").serialize(), null, "postCheckChallenge()",false);

}

function postCheckChallenge(response) {
  //ricarico l'ordine
  //Ab.swal($("#msgWarn").val(), $("#procedi").val()+" "+response, "warning");
	console.log(response);
  var jObj = $.parseJSON(response);

  //
  var res = jObj.res;
  var page = jObj.page;
  if (res == "true") {
    //alert("ok..."+page);
	  location.href=page;
  } else {
    alert('NOOOOO');
    fetchChallenge();
  }

}


/*************************************************************/
/*************************************************************/
/*preparazione challenge*/
/*************************************************************/
/*************************************************************/
function getRandomColor() {
  const letters = '0123456789ABCDEF';
  let color = '#';
  for (let i = 0; i < 6; i++) {
    color += letters[Math.floor(Math.random() * 16)];
  }
  return color;
}

function isColorTooDark(color) {
  // Calcola la luminosità del colore basandosi sulla formula WCAG
  const luminance = (0.299 * parseInt(color.substr(1, 2), 16))
    + (0.587 * parseInt(color.substr(3, 2), 16))
    + (0.114 * parseInt(color.substr(5, 2), 16));

  // Restituisce true se il colore è abbastanza scuro da rendere il testo illeggibile
  return luminance < 128;
}


$(document).ready(function () {
  const spans = document.querySelectorAll('.human-boxed-text span');

  spans.forEach(span => {
    let randomColor;
    do {
      randomColor = getRandomColor();
    } while (isColorTooDark(randomColor));

    span.style.backgroundColor = randomColor;
  });

});
