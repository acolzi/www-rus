<!DOCTYPE html><jsp:useBean id="lang" class="java.lang.String" type="java.lang.String" scope="session" >
</jsp:useBean>
<%@page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/acxent.tld" prefix="acx" %>
<%@ taglib uri="/WEB-INF/art.tld" prefix="art" %>
<%@ taglib uri="/WEB-INF/pg.tld" prefix="pg" %>
	<%@ taglib uri="/WEB-INF/common.tld" prefix="acxcom" %>
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
<title><acx:lang>Regalami Un Sorriso ONLUS - Correndo, sognando e... lottando</acx:lang></title>
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
<jsp:param name="menuAttivo" value="home"/>
</jsp:include>
<header><br>
</header>
<div class="container">
  <div class="row mb-5">
    <div class="col-lg-12">
      <h1 class="my-4 text-uppercase"><acx:lang>Attenzione!!</acx:lang></h1>
      <p><strong><acx:lang>Attenzione!. Questa Foto non può essere scaricata!!
        Sarà prelevabile, come da accordi con l'organizzatore,
        solo dopo che l'agenzia fotografica, a cui è stata ceduta l'esclusiva,
        avrà terminato la commercializzazione.</acx:lang></strong></p>
    </div>
  </div>
  
  <!-- Marketing Icons Section -->
  <div class="row">
    <div class="col-lg-12 col-md-12 col-sm-12 hidden-xs ">
      <div class="lista-banner-home">
        <h4 class="boxed-title"><acx:lang>Partners</acx:lang></h4>
        <div id="owl-banner" class="owl-carousel">
          <acxcom:bannerlist bannertype="6" num="0">
            <div><a href="Banner.abl?cmd=go&id=<%=rowBean.getId_banner()%>" target="_blank"><img src="_img/_imgBanner/<%=rowBean.getImgFileName(1)%>" border="0" title="" alt="" class="img-responsive" /></a> </div>
          </acxcom:bannerlist>
        </div>
      </div>
    </div>
  </div>
  <div class="row"> </div>
</div>
<!-- Include js plugin --> 
<script src="vendor/owl-carousel/owl.carousel.min.js"></script> 
<script>
    $(document).ready(function() {
      $("#owl-banner").owlCarousel({
       
		  loop:true,
    margin:10,
		   autoplay:true,
    autoplayTimeout:4000,
    autoplayHoverPause:true,
    responsiveClass:true,
    responsive:{
        0:{
            items:1,
            nav:true
        },
        600:{
            items:2,
            nav:false
        },
        1000:{
            items:3,
            nav:true,
            loop:true  
        }
    }
								   
      });

    });
    </script> 
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
