<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ taglib uri="/WEB-INF/acxent.tld" prefix="acx" %>
<jsp:useBean id="nf" scope="request" type="java.text.NumberFormat" ></jsp:useBean>
<jsp:useBean id="df" class="it.acxent.util.SimpleDateFormat" scope="request" type="it.acxent.util.SimpleDateFormat" ></jsp:useBean>
<jsp:useBean id="bean" class="it.acxent.pg.Foto" type="it.acxent.pg.Foto" scope="request" > 
</jsp:useBean>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document 5</title>
</head>

<body><acx:if wherecondition="<%=bean.getImpression()>0%>">
<span style="font-family:Verdana, Arial, Helvetica, sans-serif;font-size:9px">Hits: <%=bean.getImpression()%> - <%=df.format(bean.getDataUltimaVisual())%> </span></acx:if>
</body>
</html>
