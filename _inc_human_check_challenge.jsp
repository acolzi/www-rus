<!-- _inc_human_check_challenge.jsp -->
<jsp:useBean id="lang" class="java.lang.String" type="java.lang.String" scope="session" ></jsp:useBean>
<%@page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/acxent.tld" prefix="acx" %>
<%@ taglib uri="/WEB-INF/art.tld" prefix="art" %>
<%@ page language="java" import="it.acxent.jsp.*" %>
<script src="human/abl-human.js"></script>

<link href="human/abl-human.css" rel="stylesheet">
<jsp:useBean id="attivita" class="it.acxent.cc.Attivita" type="it.acxent.cc.Attivita" scope="session">
</jsp:useBean>
<jsp:useBean id="utenteLogon" class="it.acxent.anag.Users" type="it.acxent.anag.Users" scope="session">
</jsp:useBean>
<jsp:useBean id="msg" class="java.lang.String" type="java.lang.String" scope="request">
</jsp:useBean>
<jsp:useBean id="logon" class="java.lang.String" type="java.lang.String" scope="request">
</jsp:useBean>
<jsp:useBean id="cart" scope="session" type="it.acxent.cart.Cart" class="it.acxent.cart.Cart">
</jsp:useBean>
<jsp:useBean id="cartStatus" scope="request" type="it.acxent.cart.CartStatus" class="it.acxent.cart.CartStatus">
</jsp:useBean>
<jsp:useBean id="lang" class="java.lang.String" type="java.lang.String" scope="session">
</jsp:useBean>
<jsp:useBean id="df" class="it.acxent.util.SimpleDateFormat" scope="request" type="it.acxent.util.SimpleDateFormat">
</jsp:useBean>
<jsp:useBean id="_challenge" class="it.acxent.human.Challenge" type="it.acxent.human.Challenge" scope="session">
</jsp:useBean>
<%String hokpage=request.getParameter("hokpage");%>
<%String httl=request.getParameter("httl");%>


  <div class="row">
    <div class="col"></div>
    <div class="col-sm-12">
      <div class="form-group"><%=_challenge.getHtmlChallenge()%></div>
    </div>
    <div class="col-sm-6">
      <div class="form-group">
        <label for="uname1"><%=_challenge.getQuestion(lang)%></label>
        <input name="h_answer" type="text" class="form-control form-control-lg rounded-0" id="h_answer">
      </div>
      <a href="javascript:checkChallenge()" class="btn btn-primary btn-block">
      <acx:lang>Controlla</acx:lang>
      </a> </div>
    <div class="col"></div>
  </div>

