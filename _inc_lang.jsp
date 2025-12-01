<!-- _inc_lang.jsp -->
<%="<script>var webApp='"+(request.getContextPath().equals("/")?"":request.getContextPath())+"';</script>"%>
<%@ page language="java" import="it.acxent.jsp.*" %>
<%@ taglib uri="/WEB-INF/cc.tld" prefix="cc" %>
<%@ taglib uri="/WEB-INF/acxent.tld" prefix="acx" %>
<cc:attivita/>
<jsp:useBean id="attivita" class="it.acxent.cc.Attivita" type="it.acxent.cc.Attivita" scope="session">
</jsp:useBean>
<script src="_js/lang.js"></script>
<%
//request,default,unavailableLang,availabeLangs
//Ab.initSessionLang(request,"it","en","it,en");
Ab.initSessionLang(request,attivita.getLangDefault(),attivita.getLangSeNonDisponibile(),attivita.getLangDisponibili(),false);%>
<jsp:useBean id="lang" class="java.lang.String" type="java.lang.String" scope="session" >
</jsp:useBean>
<input type="hidden" name="lang" id="lang" value="<%=lang%>" />