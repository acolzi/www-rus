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
  <input name="pageTitle" type="hidden" id="pageTitle" value="Gest. GARA Dettaglio">
  <jsp:useBean id="list" scope="request" class="it.acxent.util.Vectumerator" type="it.acxent.util.Vectumerator">
  </jsp:useBean>
  <jsp:useBean id="CR" class="it.acxent.pg.GaraCR" type="it.acxent.pg.GaraCR" scope="request" >
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
          <li><a href="javascript:Ab.dashboard()"><i class="fa fa-dashboard"></i> Home</a>RUS</li>
          <li class="active">Elenco
            Gest. GARA </li>
          <!-- InstanceEndEditable -->
        </ol>
      </div>
      <div class="col-lg-3 lastUpdInfo"><!-- InstanceBeginEditable name="lastupdate" --><!-- InstanceEndEditable --></div>
    </div>
    <div class="box box-header">
      <div class="box-body">
        <div class="row">
          <div class="col-lg-8"><!-- InstanceBeginEditable name="toolbar" --><a class="btn btn-app btn-app-sm" href="javascript:newCommand()"> <i class="fa fa-file-o" title="Nuovo Record"></i>Nuovo</a><a class="btn btn-app btn-app-sm" href="javascript:Ab.printW()"> <i class="fa fa-print" title="Stampa Pagina"></i>Stampa</a><a class="btn btn-app btn-app-sm " href="javascript:report()"> <i class="fa fa-bar-chart" title="Report"></i>Report </a><acx:if wherecondition="<%=CR.isModGara()%>"><a class="btn btn-app btn-app-sm" href="javascript:annullaModGaraCR()"> <i class="fa  fa-check" style="color:forestgreen" title="Imposta Mod Gara a NO"></i>Mod Gara SI</a></acx:if><!-- InstanceEndEditable --></div>
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
      <input type="hidden" name="actionPage" id="actionPage" value="../pg_RUS/Gara.abl">
      <input name="pageType" type="hidden" id="pageType" value="R">
      <input name="currentTab" type="hidden" id="currentTab" value="<%= CR.getCurrentTab() %>">
      <input name="currentFocus" type="hidden" id="currentFocus" value="<%= CR.getCurrentFocus() %>">
      <input type="hidden" name="id_gara" id="id_gara" value="<%=CR.getId_gara()%>">
      <div class="row hidden-print">
        <div class="col-lg-12">
          <div class="box box-ricerca">
            <div class="box-body">
              <div class="row">
                <div class="col-lg-2 col-xs-6">
                  <label for="descrizione">Descrizione:</label>
                  <br>
                  <input type="text" class="form-control input-sm" name="searchTxt" id="searchTxt" value="<%=CR.getSearchTxt()%>" maxlength="100" onChange="searching()">
                </div>
                <div class="col-lg-2 col-xs-6">
                  <label for="dataGaraInizioDa">Data Da:</label>
                  <br>
                  <input type="text" class="form-control input-sm datemask" name="dataGaraInizioDa" id="dataGaraInizioDa" value="<%=df.format(CR.getDataGaraInizioDa())%>" maxlength="10" onChange="searching()">
                </div>
                <div class="col-lg-2 col-xs-6">
                  <label for="dataGaraInizioA">Data A:</label>
                  <br>
                  <input type="text" class="form-control input-sm datemask" name="dataGaraInizioA" id="dataGaraInizioA" value="<%=df.format(CR.getDataGaraInizioA())%>" maxlength="40" onChange="searching()">
                </div>
                <div class="col-lg-3 col-xs-6">
                  <label for="id_tipoGara">Tipo Gara:</label>
                  <br>
                  <acx:inputajax bean="bean" boundcolumn="id_tipoGara" action='/admin/pg_RUS/TipoGara.abl?flgSoloFoglie=-1&searchTxt=' nchar="0" returndata="" nextacion="" usesubmit="false" usemono="false" javascriptmodify="" javascriptnew="">
                    <div class="input-group input-group-sm">
                      <input name="tipoGaraDesc" type="text" class="form-control input-sm ajSearchText" id="tipoGaraDesc" value="<acx:inputTextFormat><%=CR.getTipoGara().getDescrizioneCompleta()%></acx:inputTextFormat>" />
                    </div>
                  </acx:inputajax>
                </div>
                <div class="col-lg-2 col-xs-6">
                  <label for="flgEventoInLinea">Evento In Linea:</label>
                  <br>
                  <select name="flgEventoInLinea" id="flgEventoInLinea"  onChange="searching()" class="form-control select2">  
   <acx:optionflg  boundcolumn="flgEventoInLinea" valuelist="-1,0,1,2"> </acx:optionflg>
 </select>
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
                    <th>TipoGara</th>
                    <th>In Linea</th>
                    <th>Descrizione</th>
                    <th>Data Inizio</th>
                    <th>Data Fine</th>
                    <th>Localita</th>
                    <th>Path Base</th>
                    <th>Free</th>
                  </tr>
                </thead>
                <acx:whilevec rowbeanclass="it.acxent.pg.Gara" vectumerator="list">
                  <tr>
                    <td class="comandi text-center"><div class="inline text-center hidden-print"><a href="javascript:modifyCommand('<%=rowBean.getId_gara()%>');"><i class="fa fa-edit fa-2x" title="Modifica Record"></i></a> <a href="javascript:deleteCommandCR('<%=rowBean.getId_gara()%>','<%= rowBean.getLastUpdTmstString() %>');"><i class="fa fa-trash-o fa-2x" title="Cancella Record"></i></a></div></td>
                    <td data-title="TipoGara"><%=rowBean.getTipoGara().getDescrizioneCompleta()%></td>
                    <td data-title="In Linea"><%=rowBean.getEventoInLinea()%></td>
                    <td data-title="Descrizione"><%=rowBean.getDescrizione()%></td>
                    <td data-title="Data Inizio"><%=df.format(rowBean.getDataGaraInizio())%></td>
                    <td data-title="Data Fine"><%=df.format(rowBean.getDataGaraFine())%></td>
                    <td data-title="Localita"><%=rowBean.getLocalita()%></td>
                    <td data-title="Path Base"><%=rowBean.getPathBase()%></td>
                    <td data-title="Path Base"><acx:if wherecondition="<%=rowBean.getFlgFree()==1%>"><i class="fa fa-check-circle"  style="color:darkgreen" title="Gara Omaggio"></i></acx:if></td>
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
  <script language="JavaScript" src="../pg_RUS/_js/ab-gara.js"></script> 
  <!-- InstanceEndEditable --> <!-- InstanceBeginEditable name="extra" --> <!-- InstanceEndEditable --> </acx:if_logon_ok>
<acx:else_logon> gestire il redirect al login </acx:else_logon>
<!-- InstanceEnd --> 