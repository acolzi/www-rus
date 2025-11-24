<jsp:useBean id="lang" class="java.lang.String" type="java.lang.String" scope="session" >
</jsp:useBean>
<%@page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/acxent.tld" prefix="acx" %>
<%@ taglib uri="/WEB-INF/art.tld" prefix="art" %>
<%@ taglib uri="/WEB-INF/pg.tld" prefix="pg" %>
<%@ page language="java" import="it.acxent.jsp.Ab" %>
<%@ taglib uri="/WEB-INF/cc.tld" prefix="cc" %>
<%@ taglib uri="/WEB-INF/common.tld" prefix="acxcom" %>
<jsp:useBean id="user" class="it.acxent.pg.Users" type="it.acxent.pg.Users" scope="request" >
</jsp:useBean>
<jsp:useBean id="bean" scope="request" type="it.acxent.pg.Foto" class="it.acxent.pg.Foto" >
</jsp:useBean>
<script src="_js/rus-fotoView.js"></script>
<img src="foto/<%=bean.getFileName(".jpg")%>+tn-<%=bean.getId_foto()%>.jpg" alt="" class="img-fluid" />	
 <br>
<acx:if_logon_ok>
<acx:if wherecondition="<%=user.puoScaricareFoto() || bean.getPuntoFoto().getGara().getFlgFree()==1 %>">
 <a href="fotoOriginali/<%=bean.getFileURI()%>" target="_blank" class="btn btn-primary mt-4 text-uppercase"><acx:lang>Scarica Foto</acx:lang></a>
</acx:if><acx:else><p><acx:lang>ATTENZIONE! Account scaduto o hai raggiunto il numero di massimo di foto scaricabili</acx:lang></p></acx:else>
<br>
<!-- banner -->
 <acxcom:bannerlist bannertype="15" num="1">
              <div class="modal-body text-center"><a href="Banner.abl?cmd=go&id=<%=rowBean.getId_banner()%>" target="_blank"><img src="_img/_imgBanner/<%=rowBean.getImgFileName(1)%>" border="0" title="<%=rowBean.getTitolo()%>" alt="" class="img-fluid" /></a> </div>
            </acxcom:bannerlist>
</acx:if_logon_ok>
<acx:else_logon><p><acx:lang>Effettua il login</acx:lang></p></acx:else_logon>
 