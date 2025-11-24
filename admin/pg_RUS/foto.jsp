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
  <jsp:useBean id="tf" class="it.acxent.util.SimpleDateFormat" scope="request" type="it.acxent.util.SimpleDateFormat" >
  </jsp:useBean>
  <input name="pageTitle" type="hidden" id="pageTitle" value="Dettaglio Foto">
  <!--  pagine di dettaglio -->
  <jsp:useBean id="bean" class="it.acxent.pg.Foto" type="it.acxent.pg.Foto" scope="request" >
  </jsp:useBean>
  <jsp:useBean id="list" scope="request" class="it.acxent.util.Vectumerator" type="it.acxent.util.Vectumerator">
  </jsp:useBean>
  <link rel="stylesheet" href="../_V4/_lib/bootstrapMagnify/magnify.css">
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
          <li><a href="javascript:Ab.dashboard()"><i class="fa fa-dashboard"></i> Home</a></li>
          <li ><a href="javascript:Ab.callAbl('/admin/pg_RUS/Foto',null,'back')">Ricerca e Indicizza</a></li>
          <li class="active">Dettaglio Foto</li>
          <!-- InstanceEndEditable -->
        </ol>
      </div>
      <div class="col-lg-2 lastUpdInfo"><!-- InstanceBeginEditable name="lastupdate" --> <%=bean.getLastUpdInfo()%> <!-- InstanceEndEditable --></div>
    </div>
    <div class="box box-header">
      <div class="box-body">
        <div class="row">
          <div class="col-lg-8"><!-- InstanceBeginEditable name="toolbar" --><a class="btn btn-app btn-app-sm" href="javascript:saveCommand()"> <i class="fa fa-floppy-o" title="Salva Record"></i>Salva</a><a class="btn btn-app btn-app-sm" href="javascript:Ab.printW()"> <i class="fa fa-print" title="Stampa"></i>Stampa</a><a class="btn btn-app btn-app-sm" href="javascript:deleteCommand()"> <i class="fa  fa-trash-o" title="Cancella Record"></i>Elimina</a><!-- InstanceEndEditable --></div>
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
      <input type="hidden" name="actionPage" id="actionPage" value="../pg_RUS/Foto.abl">
      <input name="pageType" type="hidden" id="pageType" value="D">
      <input name="lastUpdTmst" id="lastUpdTmst" type="hidden" value="<%= bean.getLastUpdTmstString() %>">
      <input name="currentTab" type="hidden" id="currentTab" value="<%= bean.getCurrentTab() %>">
      <input name="currentFocus" type="hidden" id="currentFocus" value="<%= bean.getCurrentFocus() %>">
      <input type="hidden" name="id_foto" id="id_foto" value="<%=bean.getId_foto()%>">
      <input type="hidden" name="id_gara" id="id_gara" value="<%=bean.getId_gara()%>">
      
      <!-- dettaglio -->
      <div class="row">
      <div class="col-lg-12">
        <div class="box box-dettaglio">
          <div class="box-body">
            <div class="row">
              <div class="col-lg-2 col-xs-6">
                <label for="id_puntoFoto">Punto Foto:</label>
                <br>
                <input defaultFocus="focus" type="text" readonly class="form-control input-sm numberinput" name="puntoFotoDesc" id="puntoFotoDesc" value="<%=bean.getPuntoFoto().getDescrizioneCompleta()%>" maxlength="10">
              </div>
              <div class="col-lg-2 col-xs-6">
                <label for="fileName">File Name:</label>
                <br>
                <input type="text" class="form-control input-sm" readonly name="file" id="file" value="<%=bean.getFile()%>" maxlength="254">
              </div>
              <div class="col-lg-2 col-xs-6">
                <label for="fileName">ID:</label>
                <br>
                <input type="text" class="form-control input-sm" readonly name="idd" id="idd" value="<%=bean.getId_foto()%>" maxlength="254">
              </div>
              <acx:if wherecondition="<%=utenteLogon.getId_users()==1%>">
                <div class="col-lg-2 col-xs-6">
                  <label for="fileName">Pettorale Inviato:</label>
                  <br>
                  <input type="checkbox" class="minimal" readonly <%= bean.getFlgPettoraleInviato()==1?"checked":""%> name="ckflgPettoraleInviato" id="ckflgPettoraleInviato" ">
                  <input name="flgPettoraleInviato" type="hidden" id="flgPettoraleInviato" value="<%= bean.getFlgPettoraleInviato()%>" >
                </div>
              </acx:if>
            </div>
            <div class="row">
              <div class="col-lg-12 col-xs-12"> <br>
                <div class="mag"> <img data-toggle="magnify" src="../../fotoOriginali/<%=bean.getFileURI()%>" alt="" class="thumb" /></div>
              </div> 
            </div>
            <div class="row">
              <div class="col-lg-12 col-xs-12 text-center">
                <label for="pettorali">Pettorali</label>
              </div>
              <div class="row">
                <div class="col-lg-4 col-xs-6 text-right"> <a href="javascript:prevFoto();"><i class="fa fa-arrow-left fa-2x" title="Salva e vai alla precedente"></i></a> </div>
                <div class="col-lg-4 col-xs-6">
                  <input type="text" defaultfocus="focus" class="form-control input-sm" name="pettorali" id="pettorali" value="<%=bean.getPettorali()%>" maxlength="254" nextfocus="nextFoto()" placeholder="Inserire numeri separati da , (11,22,33)">
                </div>
                <div class="col-lg-4 col-xs-6"> <a href="javascript:nextFoto();"><i class="fa fa-arrow-right fa-2x" title="Salva e vai alla successiva"></i></a> </div>
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
  <script language="JavaScript" src="../pg_RUS/_js/ab-foto.js"></script> 
  <!-- InstanceEndEditable --> <!-- InstanceBeginEditable name="extra" --> <!-- InstanceEndEditable --> </acx:if_logon_ok>
<acx:else_logon> gestire il redirect al login </acx:else_logon>
<!-- InstanceEnd --> 