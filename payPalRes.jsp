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
<jsp:useBean id="bean" class="it.acxent.contab.Documento" type="it.acxent.contab.Documento" scope="request" >
</jsp:useBean>
<jsp:useBean id="payPalResp" class="it.acxent.bank.paypal.PayPalResp" type="it.acxent.bank.paypal.PayPalResp" scope="request" >
</jsp:useBean>
<jsp:useBean id="user" class="it.acxent.pg.Users" type="it.acxent.pg.Users" scope="request" >
</jsp:useBean>
<jsp:useBean id="listRD" scope="request" class="it.acxent.util.Vectumerator" type="it.acxent.util.Vectumerator">
</jsp:useBean>
<jsp:useBean id="nf" scope="request" type="java.text.NumberFormat" >
</jsp:useBean>
<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="doctitle" -->
<title><acx:lang>Regalami Un Sorriso ETS - Area Utente</acx:lang></title>
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
<jsp:param name="menuAttivo" value="account"/>
</jsp:include>
<div class="container my-3">
  <div class="row">
    <div class="col-lg-6 my-4">
      <h1 class="my-3"><acx:lang>Pagamento tramite PayPal</acx:lang></h1>
      <p class="mt-5 mb-4"><acx:lang>Ciao</acx:lang> <strong><%=utenteLogon.getCognomeNome()%></strong><br>
        <acx:lang>Indirizzo</acx:lang>: <strong><%=user.getIndirizzo()%> <acx:lang>n.</acx:lang> <%=user.getNumeroCivico()%>, <%=user.getCitta()%> <%=user.getCap()%> (<%=user.getProvincia()%>)</strong><br>
        <acx:lang>Società di appartenenza</acx:lang>: <strong><%=user.getContatto()%> </strong><br>
        <acx:lang>Telefono</acx:lang>: <strong><%=user.getTelefono()%></strong><br>
        <acx:lang>Email</acx:lang>: <strong><%=user.getEMail()%></strong><br>
        <acx:lang>Codice Fiscale</acx:lang>: <strong><%=user.getCodFisc()%></strong><br>
        <acx:lang>Società di appartenenza</acx:lang>: <strong><%=user.getContatto()%></strong><br>
        <acx:lang>Data Scadenza</acx:lang>: <strong><%=df.format(user.getDataScadenza())%></strong><br>
        <acx:lang>Num. foto visualizzate/N. foto Max</acx:lang>: <strong><%=user.getNFotoVisual()%>/<%=user.getNFotoMax()%></strong><br>
        <acx:lang>Num. foto visualizzate oggi</acx:lang>: <strong><%=user.getNFotoVisualOggi()%></strong></p>
      <acx:if wherecondition="<%=user.getDataScadenza()!=null%>">
        <p class="mt-5 mb-4"><acx:lang>Mancano</acx:lang> <strong><%=user.getGgAScadenza()%> </strong> <acx:lang>giorni alla scadenza.</acx:lang></p>
      </acx:if>
    </div>
    <div class="col-lg-6 my-4">
      <h1 class="my-3"><acx:lang>Risultato della transazione</acx:lang></h1>
      <acx:if wherecondition='<%=!payPalResp.isResponseOk() ||  payPalResp.getPAYERID().equals("") %>'> <span class="bg-warning">
        <acx:lang>ATTENZIONE!! Pagamento non avvenuto</acx:lang>
        </span>
        <p><strong>
          <%=msg%>
          </strong></p>
        <p>
          <acx:lang>Risultato Transazione
          </acx:lang>:<strong><%=payPalResp.getL_SHORTMESSAGE0()%></strong><br />
          <acx:lang>Error Code
          </acx:lang>: <strong><%=payPalResp.getL_ERRORCODE0()%></strong> <br />
          <acx:lang>Error Desc
          </acx:lang>: <strong>
          <%=payPalResp.getL_LONGMESSAGE0()%>
          </strong><br />
          <acx:lang>Riprova</acx:lang> <a href="dettaglio_clienti.html"><acx:lang>tornando alla pagina di pagamento</acx:lang></a> <acx:lang>oppure contatta</acx:lang>
          <a href="mailto:foto@pierogiacomelli.com"><acx:lang>foto@pierogiacomelli.com</acx:lang></a> </p>
      </acx:if>
      <acx:else>
      <form method="post" action="" name="cart">
        <input type="hidden" name="cmd" id="cmd">
        <input type="hidden" name="act" id="act">
        <input type="hidden" name="actionPage" value="Ordine.abl">
        <input name="id_users" type="hidden" id="id_users" value="<" __block_50__>
        <input name="id_ordine" type="hidden" id="id_ordine" value="<%=user.getId_users()%>">
        <acx:if wherecondition='<%=payPalResp.isResponseOk()&& !payPalResp.isPaymentDone() %>'>
          <div class="col-lg-12 my-4">
            
              <div align="center">
                <p><img src="_img/PayPal_mark_37x23.gif" alt="PayPal" width="37" height="23" />
                  <acx:lang>Verifica PAYPAL Payer Detail</acx:lang> 
                  <strong><img src="_img/PayPal_mark_37x23.gif" alt="PayPal" width="37" height="23" /></strong></p>
              </div>
            
          </div>
          <div class="col-lg-12 my-4"><strong>
            <acx:lang>Payer ID 
            </acx:lang>:</strong> <%=payPalResp.getPAYERID()%><br>
            <strong>
            <acx:lang>Nome
            </acx:lang>: </strong><%= payPalResp.getFIRSTNAME() %> <strong>
            <acx:lang>Cognome
            </acx:lang>:</strong> <%= payPalResp.getLASTNAME() %> <strong>
            <acx:lang>E-mail
            </acx:lang>:</strong> <%= payPalResp.getEMAIL() %>
            </p>
            <br>
            <p><strong>
              <acx:lang>Indirizzo di Spedizione</acx:lang>: 
              </strong><%= payPalResp.getSHIPTOSTREET() %> - <%= payPalResp.getSHIPTOZIP() %> <%= payPalResp.getSHIPTOCITY() %> -<%= payPalResp.getSHIPTOSTATE() %></p>
            <br>
            <p class="bg-warning">
              <acx:lang>Sto completando il processo di pagamento tramite PayPal</acx:lang> 
            </p>
            <!--
            <br><div align="center"><a href="javascript:doPayPal();"><img src="_img/btn_xpressCheckout_it.gif" border="0" alt="Procedi con il pagamento tramite PayPal" /></a>
            </div>-->
            <input name="TOKEN" type="hidden" id="TOKEN" value="<%=payPalResp.getTOKEN()%>" />
            <input name="PAYERID" type="hidden" id="PAYERID" value="<%=payPalResp.getPAYERID()%>" />
            <input name="amt" type="hidden" id="amt" value="<%=nf.format(Double.parseDouble(payPalResp.getAMT()))%>" />
            <input name="SHIPTONAME" type="hidden" id="SHIPTONAME" value="<%= user.getCognomeNome() %>" />
            <input name="SHIPTOCOUNTRYCODE" type="hidden" id="SHIPTOCOUNTRYCODE" value="<%= user.getId_nazione() %>" />
            <input name="SHIPTOSTREET" type="hidden" id="SHIPTOSTREET" value="<%= user.getEMail() %>" />
            <input name="SHIPTOZIP" type="hidden" id="SHIPTOZIP" value="<%= user.getEMail() %>" />
          </div>
          <script>
				$(document).ready(function() {
	doPayPal();
				});
				
				</script> 
        </acx:if>
        <acx:if wherecondition="<%=payPalResp.isResponseOk()&& payPalResp.isPaymentDone()%>">
          <tr>
          <tr>
            <td><p><strong>
                <acx:lang>Data Pagamento</acx:lang>
                </strong>: <%=df.format(bean.getDataPagamento())%></p></td>
            <td><p><strong>
                <acx:lang>Transaction ID</acx:lang> 
                </strong>: <%=bean.getDescTransaction()%></p></td>
          </tr>
          <tr>
            <td colspan="2"><p> <a href="dettaglio_clienti.html"><acx:lang>Torna alla pagina di pagamento</acx:lang></a> </p>
              <p><strong><%=msg%></strong></p></td>
          </tr>
        </acx:if>
        <acx:ifparm codice="TEST" value="1">
          <tr>
            <td colspan="2"><p><acx:lang>Importo</acx:lang>:<%=payPalResp.getAMT()%><br />
                <acx:lang>Payer. ID</acx:lang>: <%=payPalResp.getPAYERID()%><br />
                <acx:lang>Buyer Name</acx:lang>:<%=payPalResp.getFIRSTNAME()+" "+payPalResp.getLASTNAME()%><br />
                <acx:lang>Buyer Email</acx:lang>:<%=payPalResp.getEMAIL()%><br />
                <acx:lang>Token.</acx:lang>:<%=payPalResp.getTOKEN()%><br />
                <acx:lang>Risultato Transazione
                </acx:lang>:<strong><%=payPalResp.getACK()%> <%=payPalResp.getL_SHORTMESSAGE0()%></strong><br />
                <acx:lang>Error Code
                </acx:lang>: <strong><%=payPalResp.getL_ERRORCODE0()%></strong> <br />
                <acx:lang>Error Desc
                </acx:lang>: <strong>
                <%=payPalResp.getL_LONGMESSAGE0()%>
                </strong></p></td>
          </tr>
        </acx:ifparm>
      </form>
      </acx:else>
    </div>
    
    <!-- parte resp paypal --> 
    
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
