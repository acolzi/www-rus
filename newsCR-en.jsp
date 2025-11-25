<!DOCTYPE html><jsp:useBean id="lang" class="java.lang.String" type="java.lang.String" scope="session" ></jsp:useBean>
<%@page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/acxent.tld" prefix="acx" %>
<%@ taglib uri="/WEB-INF/art.tld" prefix="art" %>
<%@ taglib uri="/WEB-INF/pg.tld" prefix="pg" %>
<%@ page language="java" import="it.acxent.jsp.Ab" %>
<%@ taglib uri="/WEB-INF/cc.tld" prefix="cc" %>
<html lang="<%=lang%>"><!-- InstanceBegin template="/Templates/rusNoCr.dwt" codeOutsideHTMLIsLocked="false" -->
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
<jsp:useBean id="attivita" class="it.acxent.cc.Attivita" type="it.acxent.cc.Attivita" scope="session">
</jsp:useBean>
<!-- InstanceBeginEditable name="Bean" -->
<meta name="robots" content="noindex">
<jsp:useBean id="CR" scope="request" type="it.acxent.news.NewsCR" class="it.acxent.news.NewsCR" >
</jsp:useBean>
<jsp:useBean id="listaAllegati" scope="request" class="it.acxent.util.Vectumerator" type="it.acxent.util.Vectumerator">
</jsp:useBean>
<jsp:useBean id="list" scope="request" class="it.acxent.util.Vectumerator" type="it.acxent.util.Vectumerator">
</jsp:useBean>
<%@ taglib uri="/WEB-INF/news.tld" prefix="news" %>
<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="doctitle" -->
<title><acx:lang>Regalami Un Sorriso ETS - Correndo, sognando e... lottando - Rivista Atletica Immagine</acx:lang></title>
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
<jsp:include page="_inc_head.jsp" flush="true" />
</head>

<body>
<!-- Page Content --> 
<!-- InstanceBeginEditable name="main" -->
<jsp:include page="_inc_headerNoCrNews.jsp"  flush="true" >
<jsp:param name="menuAttivo" value="associazione"/>
</jsp:include>
<div class="container my-3">
  <div class="row">
    <div class="col-lg-12 my-4">
      <h1 class="my-3"><acx:lang>Atletica Immagine</acx:lang></h1>
      <div class="row">
        <div class="col-lg-3 col-xs-12"><img src="pics/atletica2.jpg" class="img-fluid"></div>
        <div class="col-lg-9 col-xs-12">
          <p>ATLETICA IMMAGINE is a publication integrated into the technical and organizational platform of Ets regalami un sorriso (Give Me a Smile) www.regalamiunsorriso.it, a trusted resource for sports and running enthusiasts, always up-to-date on events up to a few hours before. The magazine can be conveniently delivered to your home or delivered to your mobile phone and/or tablet by joining the mailing list or simply downloading it from the same photo server as regalami un sorriso.</p>
          <p><a href="atleticaImmagine_chiSiamo.html"><acx:lang>Chi Siamo</acx:lang></a></p>
        </div>
      </div>
      <acx:ifhuman hid="atleticaimmagine" uselogonok="true"> 
        <!-- elenco news -->
        <div class="row">
          <div class="col-lg-6 col-xs-6">
            <label>
              <acx:lang>Totale Record
              :</acx:lang> ${list.getTotNumberOfRecords()}</label>
          </div>
          <div class="col-lg-6 col-xs-6 right-text">
            <acx:prevvec link='<%="rivista+atleticaImmagine-"+(list.getPageNumber()-1)+".html"%>' vectumerator="list"> <i class="fa fa-angle-double-left fa-lg fa-border"></i></acx:prevvec>
            <label>
              <acx:lang>Pagina</acx:lang>
              ${list.getPageNumber()}
              <acx:lang>di</acx:lang>
              ${list.getTotNumberOfPages()}</label>
            <acx:nextvec link='<%="rivista+atleticaImmagine-"+(list.getPageNumber()+1)+".html"%>'  vectumerator="list"><i class="fa fa-angle-double-right fa-lg fa-border"></i></acx:nextvec>
          </div>
        </div>
        <div class="row">
          <table class="table table-striped table-condensed">
            <thead>
              <tr>
                <th><acx:lang>Data.</acx:lang></th>
                <th><acx:lang>Titolo</acx:lang></th>
                <th> <acx:lang>Clicca sull'immagine</acx:lang><br>
                  <acx:lang>per sfogliare la rivista</acx:lang></th>
                <th><acx:lang>Rivista</acx:lang></th>
              </tr>
            </thead>
            <tbody>
              <acx:whilevec rowbeanclass="it.acxent.news.News" vectumerator="list">
                <tr>
                  <td><%= df.format(rowBean.getDataNews()) %></td>
                  <td><%=(rowBean.getTitolo()) %></td>
                  <td><%  listaAllegati=rowBean.getAllegati();
								it.acxent.news.AllegatoNews beanAN=(it.acxent.news.AllegatoNews)listaAllegati.nextElement();
								%>
                    <img class="img-thumbnail" style=" max-width: 100px" id="container<%=rowBean.getId_news()%>" src="_news/_img/<%=rowBean.getImgFileName(1) %>" onclick="addClickThroughAttach(<%=beanAN.getId_allegatoNews()%>)" /></td>
                  <td><acx:if wherecondition="<%=listaAllegati.getTotNumberOfRecords()>=1%>"> 
                      <script type="text/javascript">

    $(document).ready(function () {
        $("#container<%=rowBean.getId_news()%>").flipBook({
            pdfUrl:"_news/_attach/<%=beanAN.getNomeFile()%>?id=<%=beanAN.getId_allegatoNews()%>", lightBox:true
        });

    })
</script> 
                      <a href="_news/_attach/<%=beanAN.getNomeFile()%>?w=1&id=<%=beanAN.getId_allegatoNews()%>" target="_blank"><acx:lang>Scarica Pdf</acx:lang></a>
                      <acx:if wherecondition="<%=utenteLogon.getId_userProfile()==1%>"> (<%=beanAN.getClickThroughAN()%>)</acx:if>
                    </acx:if>
                    <acx:whilevec  rowbeanclass="it.acxent.news.AllegatoNews"  vectumerator="listaAllegati" rowbeanname="rowBean2"><a href="_news/_attach/<%=rowBean2.getNomeFile()%>?id=<%=rowBean2.getId_allegatoNews()%>" target="_blank"><%=rowBean2.getNomeFile()%></a></acx:whilevec></td>
                </tr>
              </acx:whilevec>
            </tbody>
          </table>
        </div>
      </acx:ifhuman>
      <acx:elsehuman hid="atleticaimmagine" hokpage="rivista+atleticaImmagine.html" httl="60"> 
        <jsp:include page="_inc_human_check.jsp"  flush="true"  >
        <jsp:param name="hid" value="<%=hid%>" />
        <jsp:param name="hokpage" value="<%=hokpage%>" />
        <jsp:param name="httl" value="<%=httl%>" />
        </jsp:include>
      </acx:elsehuman>
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
<!-- InstanceBeginEditable name="lastStuff" --> <!-- InstanceEndEditable -->
<div class="modal-loading"></div>
</body>
<!-- InstanceEnd --></html>
