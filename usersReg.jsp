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
<jsp:useBean id="bean" class="it.acxent.pg.Users" type="it.acxent.pg.Users" scope="request" >
</jsp:useBean>
<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="doctitle" -->
<title>Regalami Un Sorriso ETS -Registrazione effettuata</title>
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
<!-- InstanceEndEditable -->
<jsp:include page="_inc_cookie.jsp" flush="true" />
<jsp:include page="_inc_head.jsp" flush="true" />
</head>
<body>
<!-- Page Content -->
<!-- InstanceBeginEditable name="main" -->
<jsp:include page="_inc_header.jsp"  flush="true" >
  	<jsp:param name="menuAttivo" value="diventa"/>
  </jsp:include>
<div class="container my-3">
  <div class="row">
    <div class="col-lg-12 my-4">
      <h1 class="my-3">Registrazione</h1>
      <div class="row">
        <div class="col-lg-12 col-xs-12">
          <p align="left"><acx:if wherecondition='<%=true ||bean.getCallingJsp().equals("newUser") %>'>
	Complimenti <strong><%=utenteLogon.getCognomeNome()%></strong>, la registrazione/modifica    completata. <br>
	Se è la prima registrazione 
	ti  stata inviata una e-mail all'indirizzo specificato con il riepilogo dei dati inseriti ed un link di attivazione.
 </acx:if></p>
       <p><%=msg%></p>
        </div>
      <div class="col-lg-6 col-xs-12"></div>  </div>
    </div>
  </div>
</div>
<!-- /.container --> <!-- InstanceEndEditable -->

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
