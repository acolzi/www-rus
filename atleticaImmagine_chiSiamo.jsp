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
<!-- InstanceBeginEditable name="main" -->
  <jsp:include page="_inc_header.jsp"  flush="true" >
  	<jsp:param name="menuAttivo" value="associazione"/>
  </jsp:include>
<div class="container my-3">
  <div class="row">
    <div class="col-lg-12 my-4">
      <h1 class="my-3">Atletica Immagine - Chi Siamo</h1>
      <div class="row">
        <div class="col-lg-6 col-xs-12">
          <div class="pt-3 px-3 pb-0 bg-light border">
            <p><strong>ATLETICA IMMAGINE</strong>, una pubblicazione che ha lo scopo principale di promuovere il podismo, l’atletica e lo sport in generale attraverso una diffusione capillare tra tutti gli appassionati che ne faranno richiesta tramite mailing list.</p>
            <p>La rivista nasce per raccogliere l’eredità della pubblicazione mensile Runners e benessere che cessa le pubblicazioni con l’ultimo numero nel mese di gennaio 2020.</p>
            <blockquote type="cite">
              <blockquote type="cite">Piero Giacomelli presidente della ETS Regalami un sorriso insieme a Vezio Trifoni cercheranno e racconteranno storie a tema, notizie, novità e curiosità, coinvolgendo anche addetti ai lavori ed esperti. L’intento, oltre alle rubriche di approfondimento, è quello di restare sulla stretta attualità, e infatti la rivista telematica sarà prodotta con uscite a cadenza settimanale. La grafica è a cura di<strong> Andrea Grassi</strong>. Numerosi partner commerciali hanno già dato la loro adesione per comparire sulla rivista, anche con annunci di servizio dedicati agli utenti e ai lettori.</blockquote></blockquote>
            <p>Una delle caratteristiche della rivista è la pubblicazione con cadenza quindicinale del calendario delle gare e degli eventi di podismo e atletica in programma, affinchè i lettori siano sempre aggiornati sugli appuntamenti. Inoltre saranno segnalate in evidenza le manifestazioni coperte dal servizio fotografico benefico a cura di “Regalami Un Sorriso Ets”, i cui proventi servono per acquistare strumentazioni e attrezzature per gli enti di volontariato e per il sostegno dei casi di persone in difficoltà, o colpiti da malattie.</p>
            <p><strong>ATLETICA IMMAGINE</strong> si integra quindi nella piattaforma tecnica ed organizzativa della Ets regalami un sorriso <a href="https://www.regalamiunsorriso.it">www.regalamiunsorriso.it</a> contenente milioni di fotografie sportive, sicuro punto di riferimento per gli appassionati, sempre aggiornato agli eventi avvenuti fino a poche ore prima.</p>
            <p>La rivista si può ricevere comodamente a casa o sul proprio telefonino e/o tablet aderendo alla mail list o semplicemente scaricandola dallo stesso server foto di regalami un sorriso. </p>
            <p><a href="rivista+atleticaImmagine.html">Elenco Pubblicazioni</a></p>
          </div>
        </div>
    
      <div class="col-lg-6 col-xs-12"><img src="pics/atletica2.jpg" class="img-fluid"></div>  </div>
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
