<!-- InstanceBegin template="/Templates/4LTEContent.dwt" codeOutsideHTMLIsLocked="false" -->
<%@ taglib uri="/WEB-INF/acxent.tld" prefix="acx" %>
<%@ page language="java" import="it.acxent.jsp.*" %>
<jsp:useBean id="msg" class="java.lang.String" type="java.lang.String" scope="request" >
</jsp:useBean>
<jsp:useBean id="logon" class="java.lang.String" type="java.lang.String" scope="request" >
</jsp:useBean>
<jsp:useBean id="grantMsg" class="java.lang.String" type="java.lang.String" scope="request" >
</jsp:useBean>
<input type="hidden" name="_async" id="_async">
<jsp:useBean id="encType" class="java.lang.String" type="java.lang.String" scope="request" >
</jsp:useBean>
<input name="beanMsg" type="hidden" id="beanMsg" value="<%=Ab.formatBeanMsg( msg,  grantMsg)%>">
<input name="logonRes" type="hidden" id="logonRes" value="<%=logon%>">
<jsp:useBean id="utenteLogon" type="it.acxent.common.UsersI" class="it.acxent.common.Users" scope="session" >
</jsp:useBean>
<jsp:useBean id="df" class="it.acxent.util.SimpleDateFormat" scope="request" type="it.acxent.util.SimpleDateFormat" >
</jsp:useBean>
<jsp:useBean id="nf" scope="request" type="java.text.NumberFormat" >
</jsp:useBean>
<jsp:useBean id="readonly" class="java.lang.String" type="java.lang.String" scope="request" >
</jsp:useBean>
<acx:if_logon_ok trueifnotsecure="true"><!-- InstanceBeginEditable name="bean" -->
  <input name="pageTitle" type="hidden" id="pageTitle" value="Gest. LOG_FOTO Dettaglio">
  <jsp:useBean id="list" scope="request" class="it.acxent.util.Vectumerator" type="it.acxent.util.Vectumerator">
  </jsp:useBean>
  <jsp:useBean id="CR" class="it.acxent.pg.LogFotoCR" type="it.acxent.pg.LogFotoCR" scope="request" >
  </jsp:useBean>
  <!-- InstanceEndEditable --> 
  <!--- intestazione stampa -->
  <div class="row visible-print-block">
    <div class="col-lg-12">
      <div id="printTitleContent" class="pageTitle pull-left">Stampa</div>
    </div>
  </div>
  <div class="content-toolbar hidden-print">
    <div class="row  row-breadcrumb">
      <div class="col-lg-9">
        <ol class="breadcrumb">
          <!-- InstanceBeginEditable name="breadcrumb" -->
          <li><a href="javascript:Ab.dashboard()"><i class="fa fa-dashboard"></i> Home</a></li>
          <li class="active">Elenco
            Gest. LOG_FOTO </li>
          <!-- InstanceEndEditable -->
        </ol>
      </div>
      <div class="col-lg-3 lastUpdInfo"><!-- InstanceBeginEditable name="lastupdate" --><!-- InstanceEndEditable --></div>
    </div>
    <div class="box box-header">
      <div class="box-body">
        <div class="row">
          <div class="col-lg-8"><!-- InstanceBeginEditable name="toolbar" --><a class="btn btn-app btn-app-sm" href="javascript:newCommand()"> <i class="fa fa-file-o" title="Nuovo Record"></i>Nuovo</a><a class="btn btn-app btn-app-sm" href="javascript:Ab.printW()"> <i class="fa fa-print" title="Stampa Pagina"></i>Stampa</a><a class="btn btn-app btn-app-sm " href="javascript:report()"> <i class="fa fa-bar-chart" title="Report"></i>Report </a><!-- InstanceEndEditable --></div>
          <div class="col-lg-4" >
            <p id="messaggi" class="messaggi"><%=Ab.formatBeanMsg( msg,  grantMsg)%></p>
          </div>
        </div>
      </div>
    </div>
  </div>
  <section class="content">
    <form method="post" action="" name="main" id="main" <%=encType%>>
      <jsp:include page="../_V4/_inc/_formMainFields.jsp" flush="true" />
      <!-- InstanceBeginEditable name="logonOk" -->
      <input type="hidden" name="actionPage" id="actionPage" value="../pg_RUS/LogFoto.abl">
      <input name="pageType" type="hidden" id="pageType" value="R">
      <input name="currentTab" type="hidden" id="currentTab" value="<%= CR.getCurrentTab() %>">
      <input name="currentFocus" type="hidden" id="currentFocus" value="<%= CR.getCurrentFocus() %>">
      <input type="hidden" name="id_logFoto" id="id_logFoto" value="<%=CR.getId_logFoto()%>">
      <div class="row hidden-print">
        <div class="col-lg-12">
          <div class="box box-ricerca">
            <div class="box-body">
              <div class="row">
                <div class="col-lg-3 col-xs-6">
                  <label for="descrizione">Foto Vecchie:</label>
                  <br>
                  <input type="text" class="form-control input-sm" name="descrizione" id="descrizione" value="<%=CR.getDescrizione()%>" maxlength="254" onChange="searching()">
                </div>
                <div class="col-lg-3 col-xs-6">
                  <label for="id_foto">Foto Nuove:</label>
                  <br>
                  <input type="text" class="form-control input-sm " name="descrizioneFotoNuove" id="descrizioneFotoNuove" value="<%=CR.getDescrizioneFotoNuove()%>" maxlength="10" onChange="searching()">
                </div>
                <div class="col-lg-2 col-xs-6">
                  <label for="id_foto">Indirizzo Ip:</label>
                  <br>
                  <input type="text" class="form-control input-sm " name="ipAddress" id="ipAddress" value="<%=CR.getIpAddress()%>" maxlength="10" onChange="searching()">
                </div>
                <div class="col-lg-3 col-xs-12">
                  <label>Utente:</label>
                  <br>
                  <acx:inputajax bean="" boundcolumn="id_users" resultboundcolumn="id_users" action='<%="/admin/config/Users.abl?searchTxt="%>' 
   nchar="0" nrow="20"  returndata=""  nextacion="searching()"
   usesubmit="false" usemono="false" javascriptmodify="" javascriptnew="">
                    <div class="input-group input-group-sm">
                      <input name="descrizioneUtente"  enablenodb="false" enabledesc="false" type="text" class="form-control input-sm ajSearchText"  id="descrizioneUtente" value="<acx:inputTextFormat><%= CR.getUsers().getCognomeNome()%></acx:inputTextFormat>"  />
                    </div>
                  </acx:inputajax>
                </div>
                <div class="col-lg-1 col-xs-6"><a class="btn btn-app btn-app-sm pull-right hidden-print" href="javascript:searching()"> <i class="fa fa-search"title="Cerca"></i>Cerca </a></div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-lg-12">
          <div class="box"> 
            <!-- .box-header -->
            <div class="box-header clearfix hidden-print">
              <jsp:include page="../_V4/_inc/_inc_paginazione.jsp" flush="true" />
            </div>
            <!-- /.box-header -->
            <div class="box-body" id="no-more-tables">
              <table class="table table-bordered table-hover table-striped dataTable table-condensed ">
                <thead>
                  <tr>
                    <th>&nbsp;</th>
                    <th>Utente</th>
                    <th>Data Log</th>
                    <th>Foto Vecchie</th>
                    <th>Foto Nuove</th>
                    <th>Indirizzo IP</th>
                    <th>Timestamp</th>
                  </tr>
                </thead>
                <acx:whilevec rowbeanclass="it.acxent.pg.LogFoto" vectumerator="list">
                  <tr>
                    <td class="comandi text-center"><div class="inline text-center hidden-print"><a href="javascript:modifyCommand('<%=rowBean.getId_logFoto()%>');"><i class="fa fa-edit" title="Modifica Record"></i></a> <a href="javascript:deleteCommandCR('<%=rowBean.getId_logFoto()%>','<%= rowBean.getLastUpdTmstString() %>');"><i class="fa fa-trash-o" title="Cancella Record"></i></a></div></td>
                    <td data-title="Utente"><%=rowBean.getUsers().getCognomeNome()%></td>
                    <td data-title="Data Log"><%=df.format(rowBean.getDataLog())%></td>
                    <td data-title="Descrizione"><%=rowBean.getDescrizione()%></td>
                    <td align="center" data-title="Foto"><img src='../../foto/<%=rowBean.getFoto().getFileName(".jpg")%>+tn-<%=rowBean.getId_foto()%>.jpg' width="100" class="thumb" title="<%=rowBean.getFoto().getFile()%>" /><br>
                      <%=rowBean.getFoto().getFile()%></td>
                    <td data-title="Indirizzo IP"><%=rowBean.getIpAddress()%></td>
                    <td data-title="Indirizzo IP"><%=rowBean.getCreateTmst()%></td>
                  </tr>
                </acx:whilevec>
              </table>
            </div>
            <div class="box-footer clearfix hidden-print">
              <jsp:include page="../_V4/_inc/_inc_paginazione.jsp" flush="true" />
            </div>
          </div>
        </div>
      </div>
      <!-- InstanceEndEditable -->
    </form>
  </section>
  <!-- SCRIPT DI RESET --> 
  <script language="JavaScript" src="../_V4/_js/_reset.js"></script> 
  <!-- InstanceBeginEditable name="js-pagina" --> 
  <!-- SCRIPT PERSONALIZZATI DELLA PAGINA --> 
  <script language="JavaScript" src="../pg_RUS/_js/ab-logFoto.js"></script> 
  <!-- InstanceEndEditable --> <!-- InstanceBeginEditable name="extra" --> <!-- InstanceEndEditable --> </acx:if_logon_ok>
<acx:else_logon> gestire il redirect al login </acx:else_logon>
<!-- InstanceEnd --> 