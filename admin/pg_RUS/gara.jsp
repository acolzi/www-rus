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
  <!--  pagine di dettaglio -->
  <jsp:useBean id="bean" class="it.acxent.pg.Gara" type="it.acxent.pg.Gara" scope="request" >
  </jsp:useBean>
  <jsp:useBean id="list" scope="request" class="it.acxent.util.Vectumerator" type="it.acxent.util.Vectumerator">
  </jsp:useBean>
  <!--  pagine di ricerca --> 
  <!-- InstanceEndEditable --> 
  <!--- intestazione stampa -->
  <div class="row visible-print-block">
    <div class="col-lg-12">
      <div id="printTitleContent" class="pageTitle pull-left">Stampa</div>
    </div>
  </div>
  <div class="content-toolbar hidden-print">
    <div class="row  row-breadcrumb">
      <div class="col-lg-10">
        <ol class="breadcrumb">
          <!-- InstanceBeginEditable name="breadcrumb" -->
          <li><a href="javascript:Ab.dashboard()"><i class="fa fa-dashboard"></i> Home</a> RUS</li>
          <li ><a href="javascript:Ab.callAbl('/admin/pg_RUS/Gara',null,'back')">Elenco Gest. GARA</a></li>
          <li class="active">Dettaglio Gest. GARA</li>
          <!-- InstanceEndEditable -->
        </ol>
      </div>
      <div class="col-lg-2 lastUpdInfo"><!-- InstanceBeginEditable name="lastupdate" --> <%=bean.getLastUpdInfo()%> <!-- InstanceEndEditable --></div>
    </div>
    <div class="box box-header">
      <div class="box-body">
        <div class="row">
          <div class="col-lg-8"><!-- InstanceBeginEditable name="toolbar" --> <a class="btn btn-app btn-app-sm" href="javascript:newCommand()"> <i class="fa fa-file-o" title="Nuovo Record"></i>Nuovo</a><a class="btn btn-app btn-app-sm" href="javascript:saveCommand()"> <i class="fa fa-floppy-o" title="Salva Record"></i>Salva</a><a class="btn btn-app btn-app-sm" href="javascript:Ab.printW()"> <i class="fa fa-print" title="Stampa"></i>Stampa</a><a class="btn btn-app btn-app-sm" href="javascript:creaPuntiFoto()"> <i class="fa fa-film" title="Crea Punti Foto"></i>Crea Punti Foto</a><a class="btn btn-app btn-app-sm" href="javascript:deleteCommand()"> <i class="fa  fa-trash-o" title="Cancella Record"></i>Elimina</a>
            <acx:if wherecondition="<%=bean.isModGara(bean.getId_gara())%>"><a class="btn btn-app btn-app-sm" href="javascript:annullaModGara()"> <i class="fa  fa-check" style="color:forestgreen" title="Imposta Mod Gara a NO"></i>Mod Gara SI</a></acx:if>
            <acx:else><a class="btn btn-app btn-app-sm" href="javascript:impostaModGara()"> <i class="fa  fa-ban" style="color:red" title="Imposta Mod Gara a SI "></i>Mod Gara NO</a></acx:else>
            <acx:if wherecondition="<%=utenteLogon.getId_users()==1%>"> <a  class="btn btn-app btn-app-sm" href="javascript:creaFileExportIdx();"><i class="fa  fa-download" style="color:red" title="Export Indicizzazione"></i>Export Indicizzazione </a></acx:if>
            <acx:ifparm codice="SERVER_3_PIANO" value="true">
              <acx:if wherecondition="<%=utenteLogon.getId_userProfile()==1%>"><a class="btn btn-app btn-app-sm" href="javascript:exportGaraSuWww();"><i class="fa  fa-cloud-upload" style="color:red" title="EXPORT GARA SU WWW"></i> Invio GARA SU WWW</a><a class="btn btn-app btn-app-sm" href="javascript:exportGaraSuWwwOcr();"><i class="fa  fa-cloud-upload" style="color:black" title="EXPORT GARA SU WWW + OCR"></i> Invio GARA SU WWW+ OCR</a></acx:if>
            </acx:ifparm>
            <!-- InstanceEndEditable --></div>
          <div class="col-lg-4" >
            <p id="messaggi" class="messaggi"><%=Ab.formatBeanMsg( msg,  grantMsg)%></p>
          </div>
        </div>
      </div>
    </div>
  </div>
  <section class="content">
    <form method="post" action="" name="main" id="main" >
      <jsp:include page="../_V4/_inc/_formMainFields.jsp" flush="true" />
      <!-- InstanceBeginEditable name="logonOk" -->
      <input type="hidden" name="actionPage" id="actionPage" value="../pg_RUS/Gara.abl">
      <input name="pageType" type="hidden" id="pageType" value="D">
      <input name="lastUpdTmst" id="lastUpdTmst" type="hidden" value="<%= bean.getLastUpdTmstString() %>">
      <input name="currentTab" type="hidden" id="currentTab" value="<%= bean.getCurrentTab() %>">
      <input name="currentFocus" type="hidden" id="currentFocus" value="<%= bean.getCurrentFocus() %>">
      <input type="hidden" name="id_gara" id="id_gara" value="<%=bean.getId_gara()%>">
      <!-- dettaglio -->
      <div class="row">
        <div class="col-lg-12">
          <div class="box box-dettaglio">
            <div class="box-body">
              <div class="row">
                <div class="col-lg-1 col-xs-6">
                  <label for="flgTipoEvento">Id_gara:</label>
                  <br>
                  <span class="text-danger"><b><%=bean.getId_gara()%></b></span> </div>
                <acx:ifparm codice="SERVER_3_PIANO" value="true">
                  <acx:if wherecondition="<%=utenteLogon.getId_users()==1%>">
                    <div class="col-lg-1 col-xs-6">
                      <label for="descrizioneGara">Id Gara WWW: <i class="fa fa-info" style="color:darkred" title="ATTENZIONE A METTERE MANUALMENTE IL CODICE GARA SU WWW!"></i></label>
                      <br>
                      <input type="text" class="form-control input-sm" name="codGara" id="codGara" value="<%=bean.getCodGara()%>" maxlength="254">
                    </div>
                  </acx:if>
                  <acx:else>
                    <div class="col-lg-1 col-xs-6">
                      <label for="descrizioneGara">Id Gara WWW: <i class="fa fa-info" style="color:darkred" title="PER METTERE MANUALMENTE IL CODICE GARA SU WWW CHIEDERE AD ANDREA"></i></label>
                      <br>
                      <B> <%=bean.getCodGara()%></B> </div>
                  </acx:else>
                </acx:ifparm>
                <div class="col-lg-3 col-xs-6">
                  <label for="descrizione">Descrizione (id: <%=bean.getId_gara()%>):</label>
                  <br>
                  <input defaultFocus="focus" type="text" class="form-control input-sm" name="descrizione" id="descrizione" value="<%=bean.getDescrizione()%>" maxlength="100">
                </div>
                <div class="col-lg-1 col-xs-6">
                  <label for="dataGaraInizio">Data Inizio:</label>
                  <br>
                  <input type="text" class="form-control input-sm datemask" name="dataGaraInizio" id="dataGaraInizio" value="<%=df.format(bean.getDataGaraInizio())%>" maxlength="10">
                </div>
                <div class="col-lg-1 col-xs-6">
                  <label for="dataGaraFine">Data Fine:</label>
                  <br>
                  <input type="text" class="form-control input-sm datemask" name="dataGaraFine" id="dataGaraFine" value="<%=df.format(bean.getDataGaraFine())%>" maxlength="40">
                </div>
                <div class="col-lg-2 col-xs-6">
                  <label for="id_tipoGara">Tipo Gara:</label>
                  <br>
                  <acx:inputajax bean="bean" boundcolumn="id_tipoGara" action='/admin/pg_RUS/TipoGara.abl?flgSoloFoglie=1&searchTxt=' nchar="3" returndata="" nextacion="flgEventoInLinea" usesubmit="false" usemono="false" javascriptmodify="" javascriptnew="">
                    <div class="input-group input-group-sm">
                      <input name="tipoGaraDesc" type="text" class="form-control input-sm ajSearchText" id="tipoGaraDesc" value="<acx:inputTextFormat><%=bean.getTipoGara().getDescrizioneCompleta()%></acx:inputTextFormat>" />
                    </div>
                  </acx:inputajax>
                </div>
                <div class="col-lg-2 col-xs-6">
                  <label for="flgEventoInLinea">Evento In Linea:</label>
                  <br>
                  <select name="flgEventoInLinea" id="flgEventoInLinea"  class="form-control select2">
                    <acx:optionflg  boundcolumn="flgEventoInLinea" valuelist="0,1,2"> </acx:optionflg>
                  </select>
                </div>
                <div class="col-lg-2 col-xs-6">
                  <label for="flgTipoIndex">Tipo Indicizzazione:</label>
                  <br>
                  <select  class="form-control input-sm select2" name="flgTipoIndex" id="flgTipoIndex">
                    <acx:optionflg boundcolumn="flgTipoIndex" valuelist="0,1"> </acx:optionflg>
                  </select>
                </div>
              </div>
              <div class="row">
                <div class="col-lg-2 col-xs-6">
                  <label for="localita">Localita:</label>
                  <br>
                  <input type="text" class="form-control input-sm" name="localita" id="localita" value="<%=bean.getLocalita()%>" maxlength="40">
                </div>
                <div class="col-lg-3 col-xs-6">
                  <label for="pathBase">Path Foto:</label>
                  <br>
                  <b> <%=bean.getParm("PATHFOTO").getTesto()%></b> </div>
                <acx:ifparm codice="SERVER_3_PIANO" value="true">
                  <div class="col-lg-3 col-xs-6">
                    <label for="pathBase">Path Foto RIDOTTE:</label>
                    <br>
                    <b> <%=bean.getParm("PATHFOTO_RIDOTTE").getTesto()%></b> </div>
                </acx:ifparm>
                <div class="col-lg-3 col-xs-6">
                  <label for="pathBase">Path Base Gara:</label>
                  <br>
                  <input type="text" class="form-control input-sm" name="pathBase" id="pathBase" value="<%=bean.getPathBase()%>" maxlength="60">
                </div>
                <div class="col-lg-2 col-xs-6">
                  <label for="flgEventoInLinea">Evento Omaggio:</label>
                  <br>
                  <select name="flgFree" id="flgFree"  class="form-control select2">
                    <acx:optionflg  boundcolumn="flgFree" valuelist="0,1"> </acx:optionflg>
                  </select>
                </div>
                <div class="col-lg-4"><br>
                  <span class='msgWarn' id="threadMsg"><%=it.acxent.pg.Gara.threadCreaPuntiFotoMsg%></span> </div>
              </div>
              <acx:if wherecondition='<%=bean.isFileExportOk()%>'>
                <div class="row">
                  <div class="col-lg-6"><br>
                    <a  class='msgWarn' href='../../_tmp/<%=bean.getFileNameExport()%>' target="_blank" download><%=bean.getFileNameExport()%></a></div>
                </div>
              </acx:if>
              <div class="row tabs">
                <div class="col-lg-12"> 
                  <!-- Custom Tabs -->
                  <div class="nav-tabs-custom">
                    <ul class="nav nav-tabs" id="tabs">
                      <li class="active"><a href="#PUNTIFOTO" data-toggle="tab">Punti Foto</a></li>
                      <li><a href="#IMG" data-toggle="tab">Immagini</a></li>
                      <li><a href="#DIM" data-toggle="tab">Dati Ridimensionamento</a></li>
                      <li><a href="#IMPORT" data-toggle="tab">Import Indicizzazione</a></li>
                    </ul>
                    <div class="tab-content">
                      <div class="tab-pane active" id="PUNTIFOTO">
                        <jsp:include page="_inc_gara_puntifoto.jsp" flush="true" />
                      </div>
                      <div class="tab-pane" id="IMG">
                        <jsp:include page="_inc_gara_immagine.jsp" flush="true" />
                      </div>
                      <div class="tab-pane" id="DIM">
                        <jsp:include page="_inc_gara_ridimensiona.jsp" flush="true" />
                      </div>
                      <div class="tab-pane" id="IMPORT">
                        <jsp:include page="_inc_gara_import.jsp" flush="true" />
                      </div>
                      <!-- /.tab-pane --> 
                    </div>
                    <!-- /.tab-content --> 
                  </div>
                  <!-- nav-tabs-custom --> 
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- InstanceEndEditable -->
    </form>
  </section>
  <!-- InstanceBeginEditable name="js-pagina" --> 
  <!-- SCRIPT PERSONALIZZATI DELLA PAGINA --> 
  <script language="JavaScript" src="../pg_RUS/_js/ab-gara.js"></script> 
  <!-- InstanceEndEditable --> <!-- InstanceBeginEditable name="extra" --> <!-- InstanceEndEditable --> </acx:if_logon_ok>
<acx:else_logon> gestire il redirect al login </acx:else_logon>
<!-- InstanceEnd --> 