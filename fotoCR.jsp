<!DOCTYPE html><jsp:useBean id="lang" class="java.lang.String" type="java.lang.String" scope="session" >
</jsp:useBean>
<%@page contentType="text/html; charset=utf-8" %>
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
<jsp:useBean id="vis" scope="session" type="java.lang.String" class="java.lang.String" >
</jsp:useBean>
<jsp:useBean id="totFotoGara" scope="request" class="java.lang.String" type="java.lang.String">
</jsp:useBean>
<jsp:useBean id="modalLog" scope="request" class="java.lang.String" type="java.lang.String">
</jsp:useBean>
<jsp:useBean id="list" scope="request" class="it.acxent.util.Vectumerator" type="it.acxent.util.Vectumerator">
</jsp:useBean>
<jsp:useBean id="bean" scope="request" type="it.acxent.pg.Gara" class="it.acxent.pg.Gara" >
</jsp:useBean>
<jsp:useBean id="user" class="it.acxent.pg.Users" type="it.acxent.pg.Users" scope="request" >
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
<link  rel="stylesheet"  href='admin/_V4/_css/ajaxLoading.css'>
<!-- InstanceBeginEditable name="head" -->
<!-- Css Gallery -->
<acx:if wherecondition="<%=CR.getFlgVisCompatta()==1%>">
  <link href="addons/justified-gallery/css/justifiedGallerySmall.css" rel="stylesheet">
</acx:if>
<acx:else>
  <link href="addons/justified-gallery/css/justifiedGalleryBig.css" rel="stylesheet">
</acx:else>
<!-- InstanceEndEditable -->
<jsp:include page="_inc_cookie.jsp" flush="true" />
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
      <h1 class="my-4"><span class="text-secondary"><%=CR.getGara().getTipoGara().getTipoGaraPadre().getDescrizione(lang)%> // <a href="<%=CR.getGara().getTipoGara().getDescrizione(lang)%>-elenco_eventi-<%=CR.getGara().getId_tipoGara()%>---1-<%=lang%>.html"><%=CR.getGara().getTipoGara().getDescrizione(lang)%></a> // </span><%=CR.getGara().getDescrizione()%></h1>
    </div>
    <div class="col-md-2">
      <acx:if_img checkScaled="false"  scaledPrefix="260/" scaledWidth="260"><img src="_img/_gara/<%=bean.getImgFileName(1) %>" class="img-fluid border border-warning"></acx:if_img>
      <acx:else_img> <img src="http://via.placeholder.com/300x200" class="img-fluid border border-warning"></acx:else_img>
    </div>
    <div class="col-md-10">
      <div class="row riepilogo">
        <div class="col-md-3">
          <p><i class="fa fa-map-marker fa-lg text-warning" aria-hidden="true"></i> <%=CR.getGara().getLocalita()%></p>
        </div>
        <div class="col-md-3">
          <p><i class="fa fa-calendar fa-lg text-warning" aria-hidden="true"></i> <%=df.format(CR.getGara().getDataGaraInizio())%>-<%=df.format(CR.getGara().getDataGaraFine())%></p>
        </div>
        <div class="col">
          <p><i class="fa fa-camera-retro fa-lg text-warning"></i> <%= totFotoGara%></p>
        </div>
      </div>
      <div class="row">
        <div class="col-12"> 
          <!-- Form ricerca sport -->
          <form class="bg-light" onsubmit="return searching()">
            <input name="id_gara" id="id_gara" type="hidden" value="<%= CR.getId_gara() %>">
            <input name="id_foto" id="id_foto" type="hidden">
            <input name="garaDesc" id="garaDesc" type="hidden" value="<%=bean.getDescrizioneGaraHtml() %>">
            <div class="row">
              <input type="hidden" name="pageNumber" id="pageNumber" value="<%=list.getPageNumber()%>">
              <input type="hidden" name="actionPage" id="actionPage" value="Foto.abl">
              <input type="hidden" name="totPageNumber" id="totPageNumber" value="<%=list.getTotNumberOfPages()%>" />
              <div class="form-group mx-3 pt-4 pb-1 mb-0 px-2 arrow_box">
                <h2><acx:lang>Cerca le tue foto</acx:lang></h2>
              </div>
              <div class="form-group col-11 col-md-3 mt-3 ml-3">
                <div class="input-group">
                  <label for="fmdescrizione" class="sr-only"><acx:lang>Descrizione</acx:lang></label>
                  <select name="id_puntoFoto" id="id_puntoFoto" onchange="searchingPF()" class="custom-select form-control form-control-sm mb-2 mb-sm-0" placeholder="<acx:lang>descrizione</acx:lang>">
                    <acx:optionvec  boundcolumn="id_puntoFoto" desccolumn="descrizionePuntoFoto" vectumerator="listaPuntiFoto" value="<%=CR.getId_puntoFoto()%>"><acx:lang>-- Punti Foto --</acx:lang></acx:optionvec>
                  </select>
                </div>
              </div>
              <div class="form-group col-11 col-md-3 mt-3 ml-3">
                <div class="input-group">
                  <label for="fmdescrizione" class="sr-only"><acx:lang>Descrizione</acx:lang></label>
                  <select name="tipoPuntoFoto" id="tipoPuntoFoto" onchange="searchingTPF()" class="custom-select form-control form-control-sm mb-2 mb-sm-0" placeholder="<acx:lang>descrizione</acx:lang>">
                    <acx:optionvec  boundcolumn="tipoPuntoFoto" desccolumn="tipoPuntoFoto" vectumerator="listaTipiPuntoFoto" value="<%=CR.getTipoPuntoFoto()%>"><acx:lang>-- Descrizione/Orario --</acx:lang></acx:optionvec>
                  </select>
                </div>
              </div>
              <acx:if wherecondition="<%=CR.getGara().getFlgTipoIndex()==1%>">
                <div class="form-group col-11 col-md-2 mt-2 ml-2">
                  <div class="input-group">
                    <label for="fmdescrizione" class="sr-only"><acx:lang>Pettorale</acx:lang></label>
                <input name="pettorale" id="pettorale" style="margin-top: 7px;
    margin-left: 9px;" size="5" maxlength="10" class="form-control form-control-sm mb-0 mb-sm-0" placeholder="<acx:lang>Pettorale</acx:lang>" value="<%= CR.getPettorale() %>" /> <div class="input-group-addon form-control-sm " style="margin-top: 7px;"><i class="fa fa-search" onclick="searching()"></i></div>
                  </div>
                </div>  
              </acx:if>
            </div>
          </form>
        </div>
      </div>
    </div>
    <div class="col-12">
      <hr>
    </div>
    <div class="col-md-4 col-inline">
      <p class="lead"><acx:lang>Sono state trovate</acx:lang> <%=list.getTotNumberOfRecords()%> <acx:lang>foto</acx:lang>
        <acx:if wherecondition="<%=CR.getFlgVisCompatta()==0%>"><a href="<%=bean.getDescrizioneGaraHtml()+"_garaC-"+bean.getId_gara()+"-"+CR.getId_puntoFoto()+"-"+CR.getTipoPuntoFoto()+"-"+CR.getPageRow()+"-"+CR.getPageNumber()+".html"%>"><i class="fa fa-search-minus" title="<acx:lang>visualizzazione compatta</acx:lang>"></i></a></acx:if>
        <acx:else><a href="<%=bean.getDescrizioneGaraHtml()+"_garaE-"+bean.getId_gara()+"-"+CR.getId_puntoFoto()+"-"+CR.getTipoPuntoFoto()+"-"+CR.getPageRow()+"-"+CR.getPageNumber()+".html"%>"><i class="fa fa-search-plus" title="<acx:lang>visualizzazione standard</acx:lang>"></i></a></acx:else>
      <div id="vis" style="visibility: hidden"></div>
      </p>
    </div>
    <div class="col-md-5">
      <nav aria-label="paginatore">
        <ul class="pagination justify-content-center">
          <li class="page-item" onclick="$("body").addClass("loading");location.href=$(this).attr("href")">
            <acx:prevvec link='<%=bean.getDescrizioneGaraHtml()+"_gara-"+bean.getId_gara()+"-"+CR.getId_puntoFoto()+"-"+CR.getTipoPuntoFoto()+"-"+CR.getPageRow()+"-#-"+CR.getPettorale()+".html"%>' vectumerator="list" cssclass="page-link"> « </acx:prevvec>
          </li>
          <acx:vecpagelist3 separator="..." link='<%=bean.getDescrizioneGaraHtml()+"_gara-"+bean.getId_gara()+"-"+CR.getId_puntoFoto()+"-"+CR.getTipoPuntoFoto()+"-"+CR.getPageRow()+"-#-"+CR.getPettorale()+".html"%>'  vectumerator="list" numberofpages="3"  cssclassactive="active" cssclassdots="" >
            <li class="page-item #CLASS_ACTIVE#"><a class="page-link" href="#PAGE_LINK#" onclick="$("body").addClass("loading");location.href=$(this).attr("href")">#PAGE_NUMBER#</a></li>
          </acx:vecpagelist3>
          <li class="page-item" onclick="$("body").addClass("loading");location.href=$(this).attr("href")">
            <acx:nextvec link='<%=bean.getDescrizioneGaraHtml()+"_gara-"+bean.getId_gara()+"-"+CR.getId_puntoFoto()+"-"+CR.getTipoPuntoFoto()+"-"+CR.getPageRow()+"-#-"+CR.getPettorale()+".html"%>' vectumerator="list" cssclass="page-link"> » </acx:nextvec>
          </li>
        </ul>
      </nav>
    </div>
    <div class="col-md-3">
      <div class="form-group form-inline pull-right">
        <select name="pageRow" id="pageRow" onchange="searching()" class="custom-select form-control form-control-sm mb-2 mb-sm-0">
          <option value="24" __block_66__>24</option>
          <option value="36" __block_67__>36</option>
          <option value="48" __block_68__>48</option>
      <!--    <option value="60" <%=CR.getPageRow()==60?"selected":""%> >60</option>
          <option value="72" <%=CR.getPageRow()==72?"selected":""%> >72</option>
          <option value="84" <%=CR.getPageRow()==84?"selected":""%> >84</option>
          <option value="96" <%=CR.getPageRow()==96?"selected":""%> >96</option> -->
        </select> 
        <acx:if wherecondition="<%=list.getTotNumberOfPages()>1%>"> 
          <acx:lang>vai a pag.</acx:lang>
          <input type="text" id="pageNumberGo" name="pageNumberGo" __block_70__ size="5" title="<acx:lang>Inserisci il numero di pagina e premi invio o 'Procedi'</acx:lang>">
          <a href="javascript:goPage();"> <i class="fa fa-search"></i></a></acx:if>
      </div>
    </div>
    <!-- LISTING -->
    <acx:if wherecondition="<%=!user.isScadutoPerSito() ||CR.getGara().getFlgFree()==1 %>">
      <div class="col-md-10" style="min-height: 500px">
        <div id="demo">
          <acx:whilevec rowbeanclass="it.acxent.pg.Foto" vectumerator="list">
            <acx:if_logon_ok> <a href="javascript:mostraFoto(<%=rowBean.getId_foto()%>)"> <img src="foto/<%=rowBean.getFileName(".jpg")%>+tn-<%=rowBean.getId_foto()%>.jpg" alt="" class="thumb" />
              <div class="caption"><acx:lang>Hits:</acx:lang> <%=rowBean.getImpression()%> - <%=df.format(rowBean.getDataUltimaVisual())%> </div>
              </a> </acx:if_logon_ok>
            <acx:else_logon> <a data-toggle="modal" data-target="#ModalNoLog"> <img src="foto/<%=rowBean.getFile()%>?id_foto=<%=rowBean.getId_foto()%>" alt="" class="thumb" />
              <div class="caption"><acx:lang>Hits:</acx:lang> <%=rowBean.getImpression()%> - <%=df.format(rowBean.getDataUltimaVisual())%> </div>
              </a> </acx:else_logon>
          </acx:whilevec>
        </div>
      </div>
      <div class="col-md-2">
        <jsp:include page="_inc_ads.jsp"  flush="true"/>
      </div>
    </acx:if>
    <acx:else>
      <div class="col-md-10" style="min-height: 500px">
        <div> <acx:lang>Per poter vedere e scaricare le foto devi effettuare il login ed essere in regola con il rinnovo della quota associativa.</acx:lang><br>
          <br>
          <acx:if_logon_ok> <br>
            <acx:lang>Vai al</acx:lang><a href="dettaglio_clienti-<%=lang%>.html"> <acx:lang>Dettaglio Account</acx:lang> </a><acx:lang>per metterti in regola con il pagamento</acx:lang> </acx:if_logon_ok>
          <acx:else_logon><br>
            <acx:lang>Vai alla</acx:lang><a href="login_clienti-<%=lang%>.html"> <acx:lang>pagina di login</acx:lang></a> <acx:lang>oppure se non sei registrato, vai alla</acx:lang> <a href="registrazione_utente-<%=lang%>.html"><acx:lang>pagina di registrazione</acx:lang></a> </acx:else_logon>
        </div>
      </div>
    </acx:else>
    
    <!-- Modal non loggato -->
    <div class="modal fade" id="ModalNoLog" tabindex="-1" role="dialog" aria-labelledby="ModalNoLoglLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="ModalNoLoglLabel"></h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><i class="fa fa-close"></i> </button>
          </div>
          <div class="modal-body text-center">
            <p> <acx:lang>Se vuoi visualizzare la foto di qualità migliore effettua il login</acx:lang><br>
              <button type="button" class="btn btn-primary mt-4 text-uppercase" data-toggle="modal" data-target=".modal-login"><acx:lang>Login</acx:lang></button>
            </p>
          </div>
        </div>
      </div>
    </div>
    
    <!-- Modal login -->
    
    <div class="modal fade modal-login" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-sm">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="ModalLoginlLabel"><acx:lang>Login</acx:lang></h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><i class="fa fa-close"></i> </button>
          </div>
          <div class="modal-body text-center">
            <form class="container" name="frmLogin" id="frmLogin" method="post" action="Logon.abl">
              <input type="hidden" name="cmd" id="cmd" />
              <input type="hidden" name="act" id="act" />
              <input type="hidden" name="cmdIU" id="cmdIU" />
              <input name="thePage" type="hidden" id="thePage" value="">
              <div class="form-group">
                <label for="uname1"><acx:lang>Username</acx:lang></label>
                <input type="text" class="form-control form-control-lg rounded-0" name="login" id="login" required="">
              </div>
              <div class="form-group">
                <label><acx:lang>Password</acx:lang></label>
                <input type="password" class="form-control form-control-lg rounded-0" id="pwd" name="pwd" required="" autocomplete="new-password">
              </div>
              <div> </div>
              <a href="javascript:loginFCR()" class="btn btn-primary btn-block" style=" max-width: 100px;"><acx:lang>Accedi</acx:lang></a>
              <p class="mt-3"><a href="#"><acx:lang>Hai dimenticato la password?</acx:lang></a></p>
            </form>
          </div>
        </div>
      </div>
    </div>
    <!-- fine modal login --> 
    
    <!-- Modal loggato -->
    <div class="modal fade" id="ModalLog" tabindex="-1" role="dialog" aria-labelledby="ModalLoglLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="ModalLoglLabel"></h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><i class="fa fa-close"></i> </button>
          </div>
          <div class="modal-body text-center" id="fotoView"> ... </div>
        </div>
      </div>
    </div>
    <!-- paginazione -->
    <div class="col-12">
      <nav aria-label="paginatore">
        <ul class="pagination justify-content-center">
          <li class="page-item" onclick="$("body").addClass("loading");location.href=$(this).attr("href")">
            <acx:prevvec link='<%=bean.getDescrizioneGaraHtml()+"_gara-"+bean.getId_gara()+"-"+CR.getId_puntoFoto()+"-"+CR.getTipoPuntoFoto()+"-"+CR.getPageRow()+"-#-"+CR.getPettorale()+".html"%>' vectumerator="list" cssclass="page-link"> « </acx:prevvec> 
          </li>
          <acx:vecpagelist3 separator="..." link='<%=bean.getDescrizioneGaraHtml()+"_gara-"+bean.getId_gara()+"-"+CR.getId_puntoFoto()+"-"+CR.getTipoPuntoFoto()+"-"+CR.getPageRow()+"-#-"+CR.getPettorale()+".html"%>'  vectumerator="list" numberofpages="3"  cssclassactive="active" cssclassdots="" >
            <li class="page-item #CLASS_ACTIVE#"><a class="page-link" href="#PAGE_LINK#" onclick="$("body").addClass("loading");location.href=$(this).attr("href")">#PAGE_NUMBER#</a></li>
          </acx:vecpagelist3>
          <li class="page-item" onclick="$("body").addClass("loading");location.href=$(this).attr("href")">
            <acx:nextvec link='<%=bean.getDescrizioneGaraHtml()+"_gara-"+bean.getId_gara()+"-"+CR.getId_puntoFoto()+"-"+CR.getTipoPuntoFoto()+"-"+CR.getPageRow()+"-#-"+CR.getPettorale()+".html"%>' vectumerator="list" cssclass="page-link"> » </acx:nextvec>
          </li>
        </ul>
      </nav>
    </div>
    <!-- endof paginazione --> 
  </div>
  
  <!-- /.row --> 
  
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
<script src="addons/justified-gallery/js/jquery.justifiedGallery.min.js"></script>
<acx:if wherecondition="<%=CR.getFlgVisCompatta()==1%>"> 
  <script>
 
	$("#demo").justifiedGallery();    </script> 
</acx:if>
<acx:else> 
  <script>
$("#demo").justifiedGallery({
  rowHeight: 150,
  margins: 8,
});
</script> 
</acx:else>
<!-- InstanceEndEditable -->
<div class="modal-loading"></div>
</body>
<!-- InstanceEnd --></html>
