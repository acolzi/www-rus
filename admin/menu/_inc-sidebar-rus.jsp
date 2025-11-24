<!-- _inc-sidebar-fotoeventi.jsp V.jsp 05-10-2021 -->
<%@page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/acxent.tld" prefix="acx" %>
<%@ taglib uri="/WEB-INF/contab.tld" prefix="contab" %>
<%@ page language="java" import="it.acxent.jsp.*" %>
<jsp:useBean id="utenteLogon" type="it.acxent.common.UsersI" class="it.acxent.common.Users" scope="session" >
</jsp:useBean>
<acx:if_logon_ok trueifnotsecure="true">
  <!-- INIZIO ANAGRAFICHE -->
  <acx:if wherecondition="<%=utenteLogon.getId_userProfile()<10%>">
    <li class="treeview active"><a href="#"> <i class="fa fa-smile-o"></i> <span>Regalami un sorriso</span> <i class="fa fa-angle-left pull-right"></i> </a>
      <ul class="treeview-menu">
        <li><a href="javascript:Ab.callAbl('/admin/pg_RUS/Gara')"><i class="fa fa-clock-o"></i>Gara</a></li>
        <li><a href="javascript:Ab.callAbl('/admin/pg_RUS/TipoGara')"><i class="fa fa-cogs"></i>Tipo Gara</a></li>
        <li><a href="javascript:Ab.callAbl('/admin/pg_RUS/Coupon')"><i class="fa fa-money"></i> Coupon</a></li>
        <li><a href="javascript:Ab.callAbl('/admin/pg_RUS/LogFoto')"><i class="fa fa-bar-chart"></i>Log Foto</a></li>
        <li><a href="javascript:Ab.callAbl('/admin/pg_RUS/Foto')"><i class="fa fa-film"></i>Indicizza Foto</a></li>
      </ul>
    </li>
  </acx:if>
</acx:if_logon_ok>
