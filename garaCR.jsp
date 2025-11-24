<!DOCTYPE html><jsp:useBean id="lang" class="java.lang.String" type="java.lang.String" scope="session" >
</jsp:useBean>
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
<jsp:useBean id="list" scope="request" class="it.acxent.util.Vectumerator" type="it.acxent.util.Vectumerator">
</jsp:useBean>
<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="doctitle" -->
<title><acx:lang>Regalami Un Sorriso ETS - Gare</acx:lang><%=CR.getTipoGara().getDescrizione()%></title>
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
<jsp:param name="menuAttivo" value="foto"/>
</jsp:include>
<div class="container my-3"> 
  
  <!-- Marketing Icons Section -->
  <div class="row mb-5">
    <div class="col-lg-12">
      <h1 class="my-4"><span class="text-secondary"><%=CR.getTipoGara().getTipoGaraPadre().getDescrizione()%> //</span><%=CR.getTipoGara().getDescrizione()%></h1>
      <!-- Form ricerca sport -->
      <form class="form-giallo" action="Gara.abl" method="post" id="main" name="main">
        <input type="hidden" id="tipoGaraDesc" name="tipoGaraDesc" value="<%=CR.getTipoGara().getDescrizione()%>">
        <input type="hidden" id="pageNumber" name="pageNumber" value="<%=list.getPageNumber()%>">
        <input type="hidden" id="id_tipoGara" name="id_tipoGara" value="<%=CR.getId_tipoGara()%>">
        <div class="form-row">
          <div class="form-group col-md-2">
            <label for="fmlocalita" class="sr-only"><acx:lang>Località</acx:lang></label>
            <div class="input-group">
              <input name="localita" type="text" class="form-control form-control-sm mb-2 mb-sm-0" id="localita" placeholder="<acx:lang>località</acx:lang>" value="<%=CR.getLocalita()%>" aria-describedby="basic-addon1" aria-label="Data">
              <span class="input-group-addon" id="basic-addon1"><i class="fa fa-map-marker" aria-hidden="true"></i></span> </div>
          </div>
          <div class="form-group col-md-2">
            <label for="fmdata" class="sr-only"><acx:lang>Mese</acx:lang></label>
            <div class="input-group">
              <select name="flgMese" id="flgMese" onchange="searchGara()" class="custom-select form-control form-control-sm mb-0">
                <acx:optionflg  boundcolumn="flgMese" valuelist="0,1,2,3,4,5,6,7,8,9,10,11,12"> </acx:optionflg>
              </select>
            </div>
          </div>
          <div class="form-group col-md-2">
            <label for="fmdata" class="sr-only"><acx:lang>Anno</acx:lang></label>
            <div class="input-group">
              <acx:selectyear name="anno" value="<%=CR.getAnno()%>" start="2017" stop="0" >
                <select class="custom-select form-control form-control-sm mb-0" name="anno" id="anno" onchange="searchGara()">
                </select>
              </acx:selectyear>
            </div>
          </div>
          <div class="form-group col-md-2"> <a href="javascript:searchGara()" class="btn btn-primary btn-sm btn-block"><acx:lang>Cerca</acx:lang></a> </div>
        </div>
      </form>
      <!-- --> 
      <!-- LISTING -->
      
      <div class="row mt-3">
        <div class="col-md-10">
          <div class="row">
            <acx:whilevec rowbeanclass="it.acxent.pg.Gara" vectumerator="list">
              <div class="col-md-3">
                <div class="card"> <a href="<%=rowBean.getDescrizioneGaraHtml()%>_gara-<%=rowBean.getId_gara()%>---96-1.html">
                  <acx:if_img  checkScaled="false"  scaledPrefix="320/" scaledWidth="320" ><img src="_img/_gara/<%=rowBean.getImgFileName(1) %>" class="card-img-top"></acx:if_img>
                  <acx:else_img><img class="card-img-top" src="http://placehold.it/700x400" alt=""></acx:else_img>
                  </a>
                  <div class="card-body">
                    <h4 class="card-title"> <a href="<%=rowBean.getDescrizioneGaraHtml()%>_gara-<%=rowBean.getId_gara()%>---24-1.html"><%=rowBean.getDescrizione()%></a> </h4>
                    <p class="card-text"><i class="fa fa-calendar" aria-hidden="true"></i> <%=df.format(rowBean.getDataGaraInizio())%><i class="fa fa-map-marker ml-3" aria-hidden="true"></i> <%=rowBean.getLocalita()%> <i class="fa fa-download" aria-hidden="true"></i> 
                 <%=rowBean.getNDownload()%></p>
                  </div>
                </div>
              </div>
            </acx:whilevec>
          </div>
        </div>
        <div class="col-md-2">
          <jsp:include page="_inc_ads.jsp"  flush="true"/>
        </div>
      </div>
      <!-- paginazione -->
        <nav aria-label="paginatore">
  <ul class="pagination justify-content-center">
      <li class="page-item">
      <acx:prevvec link='javascript:prevPageGara()' vectumerator="list" cssclass="page-link">  
      «
   </acx:prevvec>
       </li>
    <acx:vecpagelist3 separator="..." link='javascript:goPageGara(#)'  vectumerator="list" numberofpages="3"  cssclassactive="active" cssclassdots="" >
            <li class="page-item #CLASS_ACTIVE#"><a class="page-link" href="#PAGE_LINK#">#PAGE_NUMBER#</a></li>
          </acx:vecpagelist3>
            
    <li class="page-item">
        <acx:nextvec link='javascript:nextPageGara()' vectumerator="list" cssclass="page-link"> » </acx:nextvec>
     
    </li>
  </ul>
</nav>
     
     
      
      
      <!-- endof paginazione --> 
    </div>
    
    <!-- /.row --> 
    
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
	<!-- InstanceBeginEditable name="lastStuff" --> <!-- InstanceEndEditable -->
<div class="modal-loading"></div>
</body>
<!-- InstanceEnd --></html>
