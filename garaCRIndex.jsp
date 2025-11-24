<!DOCTYPE html><jsp:useBean id="lang" class="java.lang.String" type="java.lang.String" scope="session" >
</jsp:useBean>
<%@page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/acxent.tld" prefix="acx" %>
<%@ taglib uri="/WEB-INF/art.tld" prefix="art" %>
<%@ taglib uri="/WEB-INF/pg.tld" prefix="pg" %>
<%@ page language="java" import="it.acxent.jsp.Ab" %>
<%@ taglib uri="/WEB-INF/cc.tld" prefix="cc" %>
<jsp:useBean id="df" class="it.acxent.util.SimpleDateFormat" scope="request" type="it.acxent.util.SimpleDateFormat">
</jsp:useBean>
<jsp:useBean id="list" scope="request" class="it.acxent.util.Vectumerator" type="it.acxent.util.Vectumerator">
</jsp:useBean>
<jsp:useBean id="CR" scope="request" type="it.acxent.pg.FotoCR" class="it.acxent.pg.FotoCR" >
</jsp:useBean> 
<html>
<body>

    <input type="hidden" name="totPageNumber_<%=CR.getFlgTipoEvento()%>" id="totPageNumber_<%=CR.getFlgTipoEvento()%>" value="<%=list.getTotNumberOfPages()%>"> 
     <input type="hidden" name="currentPage_<%=CR.getFlgTipoEvento()%>" id="currentPage_<%=CR.getFlgTipoEvento()%>" value="<%=list.getPageNumber()%>"> 
  <acx:whilevec rowbeanclass="it.acxent.pg.Gara" vectumerator="list">
    <div class="col-md-6">
      <div class="card"> <a href="<%=rowBean.getDescrizioneGaraHtml()%>_gara-<%=rowBean.getId_gara()%>---24-1.html">
        <acx:if_img checkScaled="false"  scaledPrefix="320/" scaledWidth="320"><img src="_img/_gara/<%=rowBean.getImgFileName(1) %>" class="card-img-top"></acx:if_img>
        <acx:else_img><img class="card-img-top" src="http://placehold.it/700x400" alt=""></acx:else_img>
        </a>
        <div class="card-body">
          <h4 class="card-title"> <a href="<%=rowBean.getDescrizioneGaraHtml()%>_gara-<%=rowBean.getId_gara()%>---24-1.html"><%=rowBean.getDescrizione()%></a> </h4>
          <p class="card-text"><small><i class="fa fa-calendar" aria-hidden="true"></i> <%=df.format(rowBean.getDataGaraInizio())%><i class="fa fa-map-marker ml-3" aria-hidden="true"></i> <%=rowBean.getLocalita()%> <i class="fa fa-download" aria-hidden="true"></i> 
                 <%=rowBean.getNDownload()%></small></p>
        </div>
      </div>
    </div>
  </acx:whilevec>

</body>
</html>