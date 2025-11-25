<%@page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/acxent.tld" prefix="acx" %>
<%@ taglib uri="/WEB-INF/art.tld" prefix="art" %>
<%@ taglib uri="/WEB-INF/pg.tld" prefix="pg" %>
<%@ page language="java" import="it.acxent.jsp.Ab" %>
<%@ taglib uri="/WEB-INF/cc.tld" prefix="cc" %>

<jsp:useBean id="utenteLogon" class="it.acxent.anag.Users" type="it.acxent.anag.Users" scope="session" >
</jsp:useBean>
<jsp:useBean id="msg" class="java.lang.String" type="java.lang.String" scope="request" >
</jsp:useBean>
<jsp:useBean id="cart" scope="session" type=   "it.acxent.cart.Cart" class="it.acxent.cart.Cart" >
</jsp:useBean>
<jsp:useBean id="cartStatus" scope="request" type="it.acxent.cart.CartStatus" class="it.acxent.cart.CartStatus" >
</jsp:useBean>
<jsp:useBean id="lang" class="java.lang.String" type="java.lang.String" scope="session" >
</jsp:useBean>
<jsp:useBean id="CR" scope="request" type="it.acxent.pg.FotoCR" class="it.acxent.pg.FotoCR" >
</jsp:useBean>
<jsp:useBean id="user" class="it.acxent.pg.Users" type="it.acxent.pg.Users" scope="session" >
</jsp:useBean>
<jsp:useBean id="attivita" class="it.acxent.cc.Attivita" type="it.acxent.cc.Attivita" scope="session">
</jsp:useBean>
<input name="id_tipoSel" type="hidden" id="id_tipoSel" value="<%=CR.getId_tipoGara()%>">
<acx:if wherecondition="<%=attivita.isFacebookSignIn()%>"> 
  <!-- facebook init script-->
  <div id="fb-root"></div>
  <script>
  window.fbAsyncInit = function() {
    FB.init({
      appId            : '<%=attivita.getPFacebookSigninClientId()%>',
      autoLogAppEvents : true,
      xfbml            : true,
      version          : 'v15.0',

	
	});
  };
</script> 
  <script async defer crossorigin="anonymous" src="https://connect.facebook.net/it_IT/sdk.js"></script> 
</acx:if>
<!-- Bootstrap core JavaScript --> 
<script src="vendor/jquery/jquery.min.js"></script> 
<script src="vendor/popper/popper.min.js"></script> 
<script src="admin/_V4/_js/_acxent.js"></script> 
<script src="_js/rus-ecom-240621.js"></script> 
<script src="addons/datepicker/js/bootstrap-datepicker.min.js"></script> 
<script src="addons/datepicker/locales/bootstrap-datepicker.it.min.js"></script> 
<script src="vendor/bootstrap/js/bootstrap.min.js"></script> 
<!-- google sign in --> 
<script src="https://accounts.google.com/gsi/client" async defer></script> 
<!-- --> 
<!-- owl -->
<link rel="stylesheet" href="vendor/owl-carousel/owl.carousel.min.css">
<link rel="stylesheet" href="vendor/owl-carousel/owl.theme.default.min.css">
<!-- sweet alert -->
<link rel="stylesheet" type="text/css" href="js/sweetalert/sweetalert.css">
<script src="js/sweetalert/sweetalert.min.js"></script>
<%String menuAttivo = request.getParameter("menuAttivo");%>
<% if(menuAttivo==null) menuAttivo="home";%>
<a id="top"></a> 
<!-- Navigation -->
<nav class="navbar fixed-top navbar-expand-lg navbar-light bg-white fixed-top">
  <div class="container"> <a class="navbar-brand" href="index.html"><img src="images/layout/regalami-un-sorriso-ets-640.png" alt="<acx:lang>Regalami Un Sorriso Ets</acx:lang>" width="100"></a>
    <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"> <span class="navbar-toggler-icon"></span> </button>
    <div class="collapse navbar-collapse" id="navbarResponsive">
      <ul class="navbar-nav">
        <li class="nav-item"> <a class="nav-link <%= menuAttivo.equals("home") ? "active" : "" %>" href="index.html"><acx:lang>Home</acx:lang></a> </li>
        <li class="nav-item"> <a class="nav-link <%= menuAttivo.equals("associazione") ? "active" : "" %>" href="associazione-<%=lang%>.html"><acx:lang>Associazione</acx:lang></a> </li>
        <li class="nav-item"> <a class="nav-link <%= menuAttivo.equals("associazione") ? "active" : "" %>" href="  rivista+atleticaImmagine-<%=lang%>.html"><img src="pics/atletica2.jpg" class="img-fluid" style="max-width: 110px"></a> </li>
        <li class="nav-item dropdown"> <a href="#" class="dropdown-toggle nav-link  <%= menuAttivo.equals("fotox") ? "active" : "" %>" data-toggle="dropdown"><acx:lang>Foto</acx:lang> <b class="caret"></b></a>
          <ul class="dropdown-menu multi-column columns-2" style="overflow-y:scroll">
            <div class="row">
              <pg:whiletipogara id_tipoPadre="0" rowbeanname="rowBean">
                <div class="col-sm-6 <%=rowBean.getId_tipoGara()==2?"vertical-divider":""%>">
                  <h2><%=rowBean.getDescrizione(lang)%></h2>
                  <ul class="multi-column-dropdown">
                    <pg:whiletipogara id_tipoPadre="<%=rowBean.getId_tipoGara()%>" id_tipoPadreSelected="<%=rowBean.getId_tipoGara()%>"  rowbeanname="rowBean1">
                      <li><a href="<%=rowBean1.getDescrizione()%>-elenco_eventi-<%=rowBean1.getId_tipoGara()%>---1-<%=lang%>.html"><%=rowBean1.getDescrizione(lang)%></a></li>
                    </pg:whiletipogara>
                  </ul>
                </div>
              </pg:whiletipogara>
            </div>
          </ul>
        </li>
        <acx:if wherecondition="<%=!user.isDaRinnovare()%>">
          <li class="nav-item dropdown show"> <a class="nav-link btn btn-sm btn-warning dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="true"><acx:lang>Archivio</acx:lang> <b class="caret"></b></a>
            <ul class="dropdown-menu ">
              <li>
                <h2 style="margin: 0px;font-size: 12px;"><a style="padding-left: 0px;" href="gallery1.php"><acx:lang>Fino al 2011</acx:lang></a></h2>
              </li>
              <li>
                <h2 style="margin: 0px;font-size: 12px;"><a style="padding-left: 0px;" href="gallery2.php">2012-2017</a></h2>
              </li>
            </ul>
          </li>
        </acx:if>
        <acx:else>
          <li class="nav-item dropdown show"> <a class="nav-link btn btn-sm btn-warning dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="true"><acx:lang>Archivio</acx:lang> <b class="caret"></b></a>
            <ul class="dropdown-menu ">
              <li>
                <h2 style="margin: 0px;font-size: 12px;"><a style="padding-left: 0px;"><acx:lang>Per poter vedere e scaricare le foto devi effettuare il login ed essere in regola con il rinnovo della quota associativa.</acx:lang></a></h2>
              </li>
            </ul>
          </li>
        </acx:else>
        <acx:if_logon_ok> <a href="dettaglio_clienti-<%=lang%>.html"><img src="https://www.regalamiunsorriso.it/images/btn_donateCC_LG.gif" border="0" name="submit" alt="<acx:lang>PayPal - Il sistema di pagamento online piu' facile e sicuro!</acx:lang>"></a> 
          <!--
          <form action="https://www.paypal.com/cgi-bin/webscr" method="post">
            <input type="hidden" name="cmd" value="_s-xclick">
            <input type="hidden" name="hosted_button_id" value="4089564">
            <input type="image" src="https://www.regalamiunsorriso.it/images/btn_donateCC_LG.gif" border="0" name="submit" alt="PayPal - Il sistema di pagamento online piu' facile e sicuro!">
          </form>--> 
        </acx:if_logon_ok>
        <acx:else_logon>
          <li class="nav-item"> <a href="login_clienti-<%=lang%>.html"><img src="https://www.regalamiunsorriso.it/images/btn_donateCC_LG.gif" border="0" name="submit" alt="<acx:lang>PayPal - Il sistema di pagamento online piu' facile e sicuro!</acx:lang>"></a></li>
        </acx:else_logon>  </ul>
       
      <acx:if_logon_ok>
        <ul class="navbar-nav ml-auto">
          <li class="nav-item dropdown"> <a class="nav-link dropdown-toggle <%= menuAttivo.equals("account") ? "active" : "" %>" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="fa fa-user" aria-hidden="true"></i> <acx:lang>Il mio account</acx:lang> </a>
            <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink"> <a class="dropdown-item" href="dettaglio_clienti-<%=lang%>.html"><i class="fa fa-user" aria-hidden="true"></i> <acx:lang>Dettaglio Account</acx:lang></a> <a class="dropdown-item" href="<%=attivita.getNoCacheTs()%>-user_logout-<%=lang%>.html"><i class="fa fa-sign-out" aria-hidden="true"></i> <acx:lang>Esci</acx:lang></a> </div>
          </li>
          <li class="nav-item"> <a class="nav-link" href="https://it-it.facebook.com/pg/Regalami-un-sorriso-ETS-189377806523/community/"><img src="images/FB-f-Logo__blue_29.png" class="img-fluid" alt="<acx:lang>Facebook</acx:lang>"></a></li>
        </ul>
      </acx:if_logon_ok>
      <acx:else_logon>
        <ul class="navbar-nav ml-auto">
          <li class="nav-item"> <a class="nav-link <%= menuAttivo.equals("login") ? "active" : "" %>" href="<%=attivita.getNoCacheTs()%>-login_clienti-<%=lang%>.html"><i class="fa fa-user" aria-hidden="true"></i> <acx:lang>Login</acx:lang></a> </li>
          <li class="nav-item"> <a class="nav-link <%= menuAttivo.equals("diventa") ? "active" : "" %>" href="registrazione_utente-<%=lang%>.html" style="font-size: 11px"><i class="fa fa-user-plus" aria-hidden="true"></i> <acx:lang>Iscriviti e Diventa sostenitore!</acx:lang></a> </li>
          <li class="nav-item"> <a class="nav-link" href="https://it-it.facebook.com/pg/Regalami-un-sorriso-ETS-189377806523/community/"><img src="images/FB-f-Logo__blue_29.png" class="img-fluid" alt="<acx:lang>Facebook</acx:lang>"></a></li>
        </ul>
      </acx:else_logon>
		<ul class="navbar-nav ml-auto" data="langMenu">
          <li class="nav-item dropdown">
           <a class="nav-link dropdown-toggle" href="#" id="langDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <img src="images/flags/<%=lang%>.png" alt="<%=Ab.getLangDesc(lang)%>" title="<%=Ab.getLangDesc(lang)%>" class="flag"> </a>
              <div class="dropdown-menu" aria-labelledby="langDropdownMenuLink">
              <acx:whilevec rowbeanclass="it.acxent.common.Lang" vectumerator="_listaLangAtt">
                <acx:changelang targetlang="<%=rowBean.getLang()%>" hide="true">
                 <a class="dropdown-item" href="#"> <img src="images/flags/<%=rowBean.getLang()%>.png" class="flag" alt="<%=Ab.getLangDesc(rowBean.getLang())%>" title="<%=Ab.getLangDesc(rowBean.getLang())%>"> <%=Ab.getLangDesc(rowBean.getLang())%> </a>
                </acx:changelang>
              </acx:whilevec>
            </div>
      </ul>
    </div>
  </div>
</nav>
