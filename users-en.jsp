<!DOCTYPE html><jsp:useBean id="lang" class="java.lang.String" type="java.lang.String" scope="session" ></jsp:useBean>
<%@page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/acxent.tld" prefix="acx" %>
<%@ taglib uri="/WEB-INF/art.tld" prefix="art" %>
<%@ taglib uri="/WEB-INF/pg.tld" prefix="pg" %>
<%@ page language="java" import="it.acxent.jsp.Ab" %>
<%@ taglib uri="/WEB-INF/cc.tld" prefix="cc" %>
<html lang="<%=lang%>"><!-- InstanceBegin template="/Templates/rus.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<jsp:include page="_inc_lang.jsp"  flush="true"  />

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<!-- [favicon] begin -->
<link rel="shortcut icon" type="image/x-icon" href="images/favicon.ico"/>
<link rel="icon" type="image/x-icon" href="images/favicon.ico" />
<!-- [favicon] end -->
<!-- JSP -->
<jsp:useBean id="_listaLangAtt" class="it.acxent.util.Vectumerator" type="it.acxent.util.Vectumerator" scope="session">
</jsp:useBean>
<jsp:useBean id="utenteLogon" class="it.acxent.anag.Users" type="it.acxent.anag.Users" scope="session" >
</jsp:useBean>
<jsp:useBean id="msg" class="java.lang.String" type="java.lang.String" scope="request" >
</jsp:useBean>
<jsp:useBean id="df" class="it.acxent.util.SimpleDateFormat" scope="request" type="it.acxent.util.SimpleDateFormat">
</jsp:useBean>
<jsp:useBean id="cart" scope="session" type=   "it.acxent.cart.Cart" class="it.acxent.cart.Cart" >
</jsp:useBean>
<jsp:useBean id="cartStatus" scope="request" type="it.acxent.cart.CartStatus" class="it.acxent.cart.CartStatus" >
</jsp:useBean>
<jsp:useBean id="CR" scope="request" type="it.acxent.pg.FotoCR" class="it.acxent.pg.FotoCR" >
</jsp:useBean>
<cc:attivita/>
<jsp:useBean id="attivita" class="it.acxent.cc.Attivita" type="it.acxent.cc.Attivita" scope="session">
</jsp:useBean>
<!-- InstanceBeginEditable name="Bean" -->
<%@ taglib uri="/WEB-INF/news.tld" prefix="news" %>
<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="doctitle" -->
<title><acx:lang>Regalami Un Sorriso ETS - Registrazione Utente</acx:lang></title>
<!-- InstanceEndEditable -->

<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- FontAwesome Icons -->
<link rel="stylesheet" href="css/font-awesome.min.css">
<!-- Roboto Font -->
<link href="https://fonts.googleapis.com/css?family=Roboto:300,300i,400,400i,700,700i" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="css/custom-style.css" rel="stylesheet">
<!-- Css Datepicker -->
<link href="addons/datepicker/css/bootstrap-datepicker.standalone.min.css" rel="stylesheet">
<link  rel="stylesheet"  href='admin/_V4/_css/ajaxLoading.css'>
<!-- InstanceBeginEditable name="head" -->
<jsp:useBean id="bean" class="it.acxent.pg.Users" type="it.acxent.pg.Users" scope="request" >
</jsp:useBean>
<!-- InstanceEndEditable -->
<jsp:include page="_inc_cookie.jsp" flush="true" />
<jsp:include page="_inc_head.jsp" flush="true" />
</head>
<body>
<!-- Page Content -->
<!-- InstanceBeginEditable name="main" --><acx:if_logon_ok >
  <jsp:include page="_inc_header.jsp"  flush="true" >
  <jsp:param name="menuAttivo" value="account"/>
  </jsp:include>
  <div class="container my-3">
    <div class="row">
      <div class="col-lg-12 my-4">
        <h1 class="my-3">User Area</h1>
        <p>Hello <%=bean.getCognomeNome()%></p>
      </div>
    </div>
  </div>
</acx:if_logon_ok>
<acx:else_logon>
 <jsp:include page="_inc_header.jsp"  flush="true" >
  	<jsp:param name="menuAttivo" value="account"/>
  </jsp:include>
</acx:else_logon>
  <div class="container my-3">
    <div class="row">
      <div class="col-lg-12">
        <form class="container" id="dettaglio" novalidate action="Users.abl" method="post" name="dettaglio" onsubmit="return controlloRegistrazione();">
          <h1 class="my-3 text-capitalize">Registration / Data Modification</h1>
          <div class="alert-warning" style="font-size: 24px; font-weight: BOLD;"> <%=msg%></div>
          <p class="mt-5 mb-4">If you are already a Supporter of ETS Regalami un Sorriso, go to the <a href="login_clienti-<%=lang%>.html">login</a> page, otherwise, please read carefully what follows and register.</p>
          <div class="alert alert-secondary" role="alert">
            <p>The granting of a password for access to this website is subject to the understanding and acceptance of the following:</p>
            <ul>
              <li>The use of the password is strictly personal and reserved for ETS Regalami un Sorriso supporters only.</li>
              <li>You are allowed to share only images containing yourself (even if in a group context).</li>
              <li>The use of shared images must be strictly personal and private; otherwise, you must request prior authorization from the site owner.</li>
              <li>Please note that improper use of images may violate others' privacy and may lead to sanctions, including criminal penalties, pursuant to Arts. 167, 169, and 170 of Legislative Decree 196/03.</li>
              <li>The owner of this site reserves the right to carry out checks, through their own IT means, on the correct management of images.</li>
            </ul>
            <div class="form-group row text-center">
              <div class="col">
                <div class="form-check">
                  <label class="form-check-label">
                    <input class="form-check-input" type="checkbox" name="ckFlgPrivComunicazione" id="ckFlgPrivComunicazione" __block_29__>
                    <input type="hidden" name="flgPrivComunicazione" id="flgPrivComunicazione" value="<%=bean.getFlgPrivComunicazione()%>">
                    I accept </label>
                </div>
              </div>
            </div>
          </div>
          <div class="alert alert-secondary" role="alert">
            <p>The granting of a password for access to this website is subject to reading the <span class="my-3"><a href="privacy.jsp">INFORMATION NOTICE ON THE PROCESSING OF PERSONAL DATA, PURSUANT TO ART. 13 LEGISLATIVE DECREE 30.6.2003 N. 196 (“PRIVACY CODE”) AND ART. 13 EU REGULATION N. 2016/679 (“GDPR”)</a></span> and to accepting points 2.A and 2.B of said regulation.</p>
            <div class="form-group row text-center">
              <div class="col">
                <div class="form-check">
                  <label class="form-check-label">
                    <input class="form-check-input" type="checkbox" name="ckFlgPrivTrattamento" id="ckfFgPrivTrattamento" __block_31__>
                    <input type="hidden" name="flgPrivTrattamento" id="flgPrivTrattamento" value="<%=bean.getFlgPrivTrattamento()%>">
                    I accept </label>
                    2.A and 2.B
                </div>
              </div>
            </div>
          </div>
          <div class="alert alert-warning" role="alert">
            <p><strong>Attention:</strong> the photo server and photo sharing is exclusively intended for supporters of ETS Regalami un Sorriso. With this procedure, you become a supporter of ETS Regalami un Sorriso; otherwise, you cannot share photos.<br>
              To share photos, you must be a supporter of ETS.<br>
              Sharing photos does not mean purchasing them. ETS Regalami un Sorriso does not sell photos but shares them only with supporters. The photos are the exclusive property of ETS and are not transferred in any way.</p>
          </div>
         <div class="alert alert-warning" role="alert">
            <p><strong>Attention:</strong>
                <ul class="mt-4">
                <li>With a liberal contribution of 20 you can become a Member of ETS and will be entitled to share 1000 photos in 1 year</li>
                <li>The registration confirmation, along with your chosen username and password, will be sent to the provided email</li>
                <li>Be sure your email is correct, otherwise, you will never receive our response</li>
                <li>At the end, if everything has been properly done, an on-screen confirmation of the data entered will appear</li>
                <li>If your data is not correct, write to <a href="mailto:foto.atletica.immagine@gmail.com">foto.atletica.immagine@gmail.com</a></li>
                <li>Once our email is received, you must confirm your registration by clicking, only once, on the appropriate link</li>
                <li>The email must be written entirely in lowercase</li>
                <li>Please see our privacy specifics at <a href="privacy-<%=lang%>.html">privacy</a></li>
              </ul></p>
          </div>
          
          <div class="row">
            <div class="container">
              <p class="lead"><strong>All fields are mandatory</strong></p>
              <div class="row">
                <div class="col-md-6 mb-3">
                  <label for="validationCustom11">Email (which will be your login)</label>
                  <input type="text" class="form-control rounded-0" id="login" name="login" value="<%=bean.getLogin()%>" required __block_34__>
                </div>   <acx:if wherecondition="<%=bean.isSocialAccount()%>"> <div class="col-md-6 mb-3">
                  <label for="validationCustom12">Password:</label><br>
                  <b style="color: darkred">
                      You are logged in using your 
                      <%=bean.getSocialIdType()%> account</b>
                </div></acx:if><acx:else>
                <acx:if wherecondition="<%=bean.getId_users()>0%>">
                	 <div class="col-md-6 mb-3">
                  <label for="validationCustom12">Password (only if you want to change it)</label>
                  <input type="password" class="form-control rounded-0" id="newpwd" name="newpwd">
                </div>
                	
                </acx:if>
                <acx:else>
                <div class="col-md-6 mb-3">
                  <label for="validationCustom12">Choose your Password</label>
                  <input type="password" class="form-control rounded-0" id="pwd" name="pwd" value="<%=bean.getPwd()%>" required>
                </div>
                </acx:else></acx:else>
              </div>
              <div class="row">
                <div class="col-md-6 mb-3">
                  <label for="validationCustom01">First Name</label>
                  <input type="text" class="form-control rounded-0" id="nome" name="nome" value="<%=bean.getNome()%>" required>
                </div>
                <div class="col-md-6 mb-3">
                  <label for="validationCustom02">Last Name</label>
                  <input type="text" class="form-control rounded-0" id="cognome" name="cognome" value="<%=bean.getCognome()%>" required>
                </div>
              </div>
              <div class="row">
                <div class="col-md-6 mb-3">
                  <label for="validationCustom04">Phone</label>
                  <input type="text" class="form-control rounded-0" id="telefono" name="telefono" value="<%=bean.getTelefono()%>" required>
                </div>
              </div>
              <div class="row">
                <div class="col-md-3 mb-3">
                  <label for="validationCustom05">City</label>
                  <input type="text" required class="form-control rounded-0" id="citta" name="citta" value="<%=bean.getCitta()%>">
                </div>
                <div class="col-md-2 mb-3">
                  <label for="validationCustom05">ZIP</label>
                  <input type="text" required class="form-control rounded-0" id="cap" name="cap" value="<%=bean.getCap()%>">
                </div>
                 <div class="col-md-1 mb-3">
                  <label for="validationCustom05">Prov.</label>
                  <input type="text" required class="form-control rounded-0" id="provincia" name="provincia" value="<%=bean.getProvincia()%>">
                </div>
                <div class="col-md-5 mb-3">
                  <label for="validationCustom06">Street</label>
                  <input type="text" required class="form-control rounded-0" id="indirizzo" name="indirizzo" value="<%=bean.getIndirizzo()%>">
                </div>
                <div class="col-md-1 mb-3">
                  <label for="validationCustom07">No.</label>
                  <input type="text" required class="form-control rounded-0" id="numeroCivico" name="numeroCivico" value="<%=bean.getNumeroCivico()%>">
                </div>
              </div>
              <div class="row">
                <div class="col-md-6 mb-3">
                  <label for="validationCustom08">Tax Code</label>
                  <input type="text" class="form-control rounded-0" id="codFisc" name="codFisc" value="<%=bean.getCodFisc()%>">
                </div>
                <div class="col-md-6 mb-3">
                  <label for="validationCustom09">Sports Group</label>
                  <input type="text" class="form-control rounded-0" id="contatto" name="contatto" value="<%=bean.getContatto()%>" required>
                </div>
              </div>
              <div class="row">
                <div class="col-md-12 mb-4">
                  <label for="validationCustom10">Reason for registration request</label>
                  <textarea class="form-control rounded-0" id="nota" name="nota" rows="3" required><%=bean.getNota()%></textarea>
                </div>
              </div>
              <div class="row">
                <div class="col-md-12 mb-4">
                <acx:if wherecondition="<%=bean.getId_users()==0%>">
                      <input type="checkbox" id="ckflgMl" name="ckflgMl" checked />
                    <input type="hidden" name="flgMl" id="flgMl" value="1" />
                </acx:if>
                <acx:else>
                  <input type="checkbox" id="ckflgMl" name="ckflgMl" __block_51__ />
                    <input type="hidden" name="flgMl" id="flgMl" value="<%=bean.getClifor().getFlgMl()%>" />
                </acx:else>
                    Atletica Immagine Registration
                    <div class="invalid-feedback"> WARNING! Some fields have not been completed</div><br>
                  <div class="alert-warning" style="font-size: 24px; font-weight: BOLD;"> <%=msg%></div>
                </div>
              </div>
              <div class="row">
                <div class="col-md-12 mb-3 text-center">
                  <button class="btn btn-primary" type="submit">Submit request</button>
                  <input type="hidden" name="id_users" value="<%=bean.getId_users() %>">
                  <input name="id_userProfile" type="hidden" id="id_userProfile" value="9">
                  <input type="hidden" name="flgValido" value="<%=bean.getFlgValido()%>">
                  <input type="hidden" name="id_profiloUtente" value="9">
                  <input type="hidden" name="act" value="save">
                  <input type="hidden" name="cmd" value="asq">
                </div>
              </div>
              <script>
(function() {
  "use strict";
  window.addEventListener("load", function() {
    var form = document.getElementById("dettaglio");
    form.addEventListener("submit", function(event) {
      if (form.checkValidity() == false) {
        event.preventDefault();
        event.stopPropagation();
      }
    else{
      /*controlloRegistrazione();*/
    }
      form.classList.add("was-validated");
    }, false);
  }, false);
}());
</script>
       
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>

<!-- /.container -->
<!-- InstanceEndEditable -->

<!-- Footer -->
 <jsp:include page="_inc_footer.jsp" flush="true" />

<script>
	$('#datepicker-sport').datepicker({
    language: "it"
});
	$('#datepicker-eventi').datepicker({
    language: "it"
});
		
	</script>
	<!-- InstanceBeginEditable name="lastStuff" --> <!-- InstanceEndEditable -->
<div class="modal-loading"></div>
</body>
<!-- InstanceEnd --></html>
