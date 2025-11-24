<!DOCTYPE html>
<jsp:useBean id="lang" class="java.lang.String" type="java.lang.String" scope="session" >
</jsp:useBean><%@page contentType="text/html; charset=UTF-8" %>
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
<link rel="shortcut icon" type="image/x-icon" href="images/favicon.ico" />
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
<title><acx:lang>Regalami Un Sorriso ETS - Correndo, sognando e... lottando</acx:lang></title>
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
<link rel="stylesheet" href="admin/_V4/_css/ajaxLoading.css">
<!-- InstanceBeginEditable name="head" -->
<!-- InstanceEndEditable -->
	<!-- Begin Cookie Consent plugin by Silktide - http://silktide.com/cookieconsent -->
<script type="text/javascript">
    window.cookieconsent_options = {"message":"Questo sito o gli strumenti terzi da questo utilizzati si avvalgono di cookie necessari al funzionamento ed utili alle finalità illustrate nella cookie policy. Se vuoi saperne di più o negare il consenso a tutti o ad alcuni cookie, consulta la cookie policy. Chiudendo questo banner, scorrendo questa pagina, cliccando su un link o proseguendo la navigazione in altra maniera, acconsenti all'uso dei cookie.","dismiss":"Accetto","learnMore":"Cookie Policy","link":"https://www.regalamiunsorriso.it/privacy.html","theme":"dark-bottom"};
</script>
<script type="text/javascript" src="js/cookieconsent.min.js"></script>
<!-- End Cookie Consent plugin -->
<jsp:include page="_inc_head.jsp" flush="true" />
</head>
<body>
<!-- Page Content -->
<!-- InstanceBeginEditable name="main" --><div class="container my-3">
  <div class="row">
    <div class="col-lg-12 my-4">
      <h1 class="my-3">Atletica Immagine - About Us</h1>
      <div class="row">
        <div class="col-lg-6 col-xs-12">
          <div class="pt-3 px-3 pb-0 bg-light border">
            <p><strong>ATLETICA IMMAGINE</strong> is a publication whose main purpose is to promote running, athletics, and sports in general through widespread distribution among all enthusiasts who request it via mailing list.</p>
            <p>The magazine was created to inherit the legacy of the monthly publication "Runners e benessere," which ceased publication with its last issue in January 2020.</p>
            <blockquote type="cite">
              <blockquote type="cite">Piero Giacomelli, president of ETS Regalami un sorriso, together with Vezio Trifoni, will seek out and share thematic stories, news, updates, and curiosities, also involving industry professionals and experts. The aim, in addition to in-depth sections, is to stay current, and in fact, the online magazine will be published weekly. Graphic design is by <strong>Andrea Grassi</strong>. Numerous commercial partners have already agreed to appear in the magazine, including with service announcements dedicated to users and readers.</blockquote>
            </blockquote>
            <p>One of the features of the magazine is the publication every two weeks of the calendar of running and athletics events and competitions on the schedule, so that readers are always up to date with upcoming appointments. In addition, prominent coverage will be given to events covered by the charitable photo service organized by “Regalami Un Sorriso Ets”, whose proceeds are used to purchase equipment and materials for volunteer organizations or to support individuals in need or affected by illness.</p>
            <p><strong>ATLETICA IMMAGINE</strong> is thus integrated into the technical and organizational platform of Ets Regalami un Sorriso <a href="https://www.regalamiunsorriso.it">www.regalamiunsorriso.it</a> which contains millions of sports photographs, making it a reliable point of reference for enthusiasts and always updated with the latest events up to just a few hours before.</p>
            <p>The magazine can be conveniently received at home or on your mobile phone and/or tablet by joining the mailing list or simply downloading it from the same photo server of Regalami un Sorriso.</p>
            <p><a href="rivista+atleticaImmagine.html">List of Publications</a></p>
          </div>
        </div>
      <div class="col-lg-6 col-xs-12"><img src="pics/atletica2.jpg" class="img-fluid"></div>  
      </div>
    </div>
  </div>
</div>
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
	<!-- InstanceBeginEditable name="lastStuff" -->
<!-- InstanceEndEditable -->
<div class="modal-loading"></div>
</body>
<!-- InstanceEnd --></html>
