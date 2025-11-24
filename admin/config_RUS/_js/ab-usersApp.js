/////////////////////////////////////////////7
function checkSearchFields()
/////////////////////////////////////////////7
{
  if (document.main.crNS == 1)
    return false;
  else {
    //return Ab.validateForm('descrizione','Descrizione','R','numero','Numero','RisNum>0','eMail','','NisEmail');
    return true;
  }


}


/////////////////////////////////////////////7
function checkFields()
/////////////////////////////////////////////7
{
  return Ab.validateForm('login', 'Login', 'R', 'pwd', 'Passoword', 'R', 'cognome', '', 'R', 'nome', '', 'R', 'eMail', '', 'NisEmail');

}


/////////////////////////////////////////////7
function checkSearchFields()
/////////////////////////////////////////////7
{
  if (document.main.crNS == 1)
    return false;
  else {
    //return Ab.validateForm('descrizione','Descrizione','R','numero','Numero','RisNum>0','eMail','','NisEmail');
    return true;
  }


}

function checkBoxes()
/////////////////////////////////////////////
{

  var f = document.main;
  if (f.ckflgValido.checked) f.flgValido.value = "S";
  else f.flgValido.value = "N";
  /*Ab.setChekBoxValue("main","flgOperatore","1","0");
  Ab.setChekBoxValue("main","flgNews","1","0");*/


}


function checkBoxesCR()
/////////////////////////////////////////////
{
  
}

function checkRadioCR() {


}

function modifyClifor() {
  //FACCIO IL SUBMIT
  var f = document.main;
  if (f.id_clifor != 0) {
    f.action = "../anag/Cliente.abl";
    f.cmd.value = "md";
    Ab.submitAj('main');
  }
}

/*******************************************/
/*******************************************/
/* RINNOVA UN ANNO CR*/
/*******************************************/
/*******************************************/
function rinnovaAnnoCR(id) {
  Swal.fire({
    title: "Rinnovo 1 anno",
    text: "La quota associativa dell'utente sarà rinnovato per un anno e 1000 foto da oggi. Sei Sicuro?",
    icon: "warning",
    showDenyButton: true,
    showCancelButton: false,
    confirmButtonText: `Si`,
    denyButtonText: `No`,
    cancelButtonText: `Annulla`,
  }).then((result) => {
    /* Read more about isConfirmed, isDenied below */
    if (result.isConfirmed) {
      ////////////////////////////////////////////////////////////////////
      var f = document.main;
      if (f.id_clifor != 0) {
        f.action = f.actionPage.value;
        $("#cmd").val("rinnovaAnnoCR");
        $("#id_users").val(id);
        Ab.submitAj('main');
      }
      ////////////////////////////////////////////////////////////////////
    } else if (result.isDenied) {
      //Swal.fire('Changes are not saved', '', 'info')
    }
  })


}

function rinnovaAnno3CR(id) {
  Swal.fire({
    title: "Rinnovo 3 anni",
    text: "La quota sociale dell'utente sarà rinnovato per 3 anni e 3000 foto da oggi. Sei Sicuro?",
    icon: "warning",
    showDenyButton: true,
    showCancelButton: false,
    confirmButtonText: `Si`,
    denyButtonText: `No`,
    cancelButtonText: `Annulla`,
  }).then((result) => {
    /* Read more about isConfirmed, isDenied below */
    if (result.isConfirmed) {
      ////////////////////////////////////////////////////////////////////
      var f = document.main;
      if (f.id_clifor != 0) {
        f.action = f.actionPage.value;
        $("#cmd").val("rinnovaAnno3CR");
        $("#id_users").val(id);
        Ab.submitAj('main');
      }
      ////////////////////////////////////////////////////////////////////
    } else if (result.isDenied) {
      //Swal.fire('Changes are not saved', '', 'info')
    }
  })


}
/*******************************************/
/*******************************************/
/* RINNOVA UN ANNO DETTAGLIO*/
/*******************************************/
/*******************************************/
function rinnova25() {
  Swal.fire({
    title: "Rinnovo 1 anno 25 foto",
    text: "La quota associativa dell'utente sarà rinnovato per un anno e 25 foto da oggi. Sei Sicuro?",
    icon: "warning",
    showDenyButton: true,
    showCancelButton: false,
    confirmButtonText: `Si`,
    denyButtonText: `No`,
    cancelButtonText: `Annulla`,
  }).then((result) => {
    /* Read more about isConfirmed, isDenied below */
    if (result.isConfirmed) {
      ////////////////////////////////////////////////////////////////////
      var f = document.main;
      if (f.id_clifor != 0) {
        f.action = f.actionPage.value;
        $("#cmd").val("rinnova25");

        Ab.submitAj('main');
      }
      ////////////////////////////////////////////////////////////////////
    } else if (result.isDenied) {
      //Swal.fire('Changes are not saved', '', 'info')
    }
  })


}

function rinnovaAnno() {
  Swal.fire({
    title: "Rinnovo 1 anno",
    text: "La quota associativa dell'utente sarà rinnovato per un anno e 1000 foto da oggi. Sei Sicuro?",
    icon: "warning",
    showDenyButton: true,
    showCancelButton: false,
    confirmButtonText: `Si`,
    denyButtonText: `No`,
    cancelButtonText: `Annulla`,
  }).then((result) => {
      /* Read more about isConfirmed, isDenied below */
      if (result.isConfirmed) {
        ////////////////////////////////////////////////////////////////////
        var f = document.main;
        if (f.id_clifor != 0) {
          f.action = f.actionPage.value;
          $("#cmd").val("rinnovaAnno");

          Ab.submitAj('main');
        }
      
      ////////////////////////////////////////////////////////////////////
    } else if (result.isDenied) {
      //Swal.fire('Changes are not saved', '', 'info')
    }


  })
}

function rinnovaAnno3() {
  Swal.fire({
    title: "Rinnovo 3 anni",
    text: "La quota associativa dell'utente sarà rinnovato per 3 anni e 3000 foto da oggi. Sei Sicuro?",
    icon: "warning",
    showDenyButton: true,
    showCancelButton: false,
    confirmButtonText: `Si`,
    denyButtonText: `No`,
    cancelButtonText: `Annulla`,
  }).then((result) => {
      /* Read more about isConfirmed, isDenied below */
      if (result.isConfirmed) {
        ////////////////////////////////////////////////////////////////////
        var f = document.main;
        if (f.id_clifor != 0) {
          f.action = f.actionPage.value;
          $("#cmd").val("rinnovaAnno3");

          Ab.submitAj('main');
        }
        ////////////////////////////////////////////////////////////////////
      } else if (result.isDenied) {
        //Swal.fire('Changes are not saved', '', 'info')
      }


    })
}
