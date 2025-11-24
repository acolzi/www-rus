<!-- _inc-menu-fotoeventi.jsp -->
<%@page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/acxent.tld" prefix="acx" %>
<%@ taglib uri="/WEB-INF/contab.tld" prefix="contab" %>
<%@ page language="java" import="it.acxent.jsp.*" %>
<jsp:useBean id="utenteLogon" type="it.acxent.common.UsersI" class="it.acxent.common.Users" scope="session" >
</jsp:useBean>
<acx:if_logon_ok trueifnotsecure="true">
  <acx:if wherecondition="<%=utenteLogon.getId_userProfile()<10%>">
    <!-- Small boxes (Stat box) -->
    <div class="row">
           <a href="javascript:Ab.callAbl('/admin/pg_RUS/Gara','search')"> <div class="col-lg-3 col-xs-6">
              <!-- small box -->
              <div class="small-box bg-aqua dashboard-widget">
                <div class="inner">
                  <span class="titolo-widget">Gare</span>
                  <p>&nbsp;</p>
                 
                </div>
                <div class="icon">
                 <i class="fa fa-clock-o"></i>
                </div>
              
            
             </div>
            </div></a><!-- ./col -->
            <a href="javascript:Ab.callAbl('/admin/pg_RUS/TipoGara','search')"> <div class="col-lg-3 col-xs-6">
              <!-- small box -->
              <div class="small-box bg-aqua dashboard-widget">
                <div class="inner">
                  <span class="titolo-widget">Tipo Gara</span>
                  <p>&nbsp;</p>
                 
                </div>
                <div class="icon">
                  <i class="fa fa-cogs"></i>
                </div>
              
            
             </div>
            </div></a>
            <a href="javascript:Ab.callAbl('/admin/pg_RUS/LogFoto','search')"> <div class="col-lg-3 col-xs-6">
              <!-- small box -->
              <div class="small-box bg-aqua dashboard-widget">
                <div class="inner">
                  <span class="titolo-widget">Log Foto</span>
                  <p>&nbsp;</p>
                 
                </div>
                <div class="icon">
                  <i class="ion-stats-bars"></i>
                </div>
              
            
             </div>
            </div></a>
			              <a href="javascript:Ab.callAbl('/admin/pg_RUS/Foto','search')"> <div class="col-lg-3 col-xs-6">
              <!-- small box -->
              <div class="small-box bg-aqua dashboard-widget">
                <div class="inner">
                  <span class="titolo-widget">Ricerca e<br>indicizza</span>
                  <p>&nbsp;</p>
                 
                </div>
                <div class="icon">
                  <i class="fa fa-clock-o"></i>
                </div>
              
            
             </div>
            </div></a>

          </div>
    <!-- row --><!-- /.row -->
    <acx:if wherecondition="<%=utenteLogon.getId_users()<=3 || utenteLogon.getId_users()==16341 || utenteLogon.getId_users()==28732 %>">
      <div class="row"><a href="javascript:Ab.callAbl('/admin/contab/Documento')"> <div class="col-lg-3 col-xs-6">
              <!-- small box -->
              <div class="small-box bg-aqua dashboard-widget">
                <div class="inner">
                  <span class="titolo-widget">Elenco Documenti</span>
                  <p>&nbsp;</p>
                 
                </div>
                <div class="icon">
                  <i class="ion-folder"></i>
                </div>
              
            
             </div>
            </div></a><a href="javascript:Ab.callAbl('/admin/contabConfig/TipoDocumento','list')">
            <div class="col-lg-3 col-xs-6">
              <!-- small box -->
              <div class="small-box bg-aqua dashboard-widget">
                <div class="inner">
                  <span class="titolo-widget">Nuovo Documento</span>
                  <p>&nbsp;</p>
                 
                </div>
                <div class="icon">
                  <i class="ion-document"></i>
                </div>
              
            
             </div>
            </div></a>
           <a href="javascript:Ab.callAbl('/admin/anag/Cliente')"> 			
           <div class="col-lg-3 col-xs-6">
              <!-- small box -->
              <div class="small-box bg-aqua dashboard-widget">
                <div class="inner">
                  <span class="titolo-widget">Anagrafica<br>Clienti</span>
                  <p>&nbsp;</p>
                 
                </div>
                <div class="icon">
                  <i class="ion-ios-people"></i>
                </div>
              
            
             </div>
            </div></a><!-- ./col --></div>
    </acx:if>
    <!-- row --><!-- Main row --><!-- /.row (main row) -->
    </acx:if>
    <acx:if wherecondition="<%=utenteLogon.getId_users()<=3 || utenteLogon.getId_userProfile()==11%>"></acx:if>
</acx:if_logon_ok>
