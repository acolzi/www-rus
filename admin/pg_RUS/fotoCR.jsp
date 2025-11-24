<!-- InstanceBegin template="/Templates/4LTEContent.dwt" codeOutsideHTMLIsLocked="false" --><%@page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/acxent.tld" prefix="acx" %>
<%@ page language="java" import="it.acxent.jsp.*" %>
 
<jsp:useBean id="msg" class="java.lang.String" type="java.lang.String" scope="request" >
</jsp:useBean>
<jsp:useBean id="logon" class="java.lang.String" type="java.lang.String" scope="request" >
</jsp:useBean>
<jsp:useBean id="grantMsg" class="java.lang.String" type="java.lang.String" scope="request" >
</jsp:useBean>
<input type="hidden" name="_async" id="_async">
<jsp:useBean id="encType" class="java.lang.String" type="java.lang.String" scope="request" ></jsp:useBean>
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
  <input name="pageTitle" type="hidden" id="pageTitle" value="Ricerca e Indicizza">
  <jsp:useBean id="list" scope="request" class="it.acxent.util.Vectumerator" type="it.acxent.util.Vectumerator">
  </jsp:useBean>
  <jsp:useBean id="CR" class="it.acxent.pg.FotoCR" type="it.acxent.pg.FotoCR" scope="request" >
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
      <div class="col-lg-8">
        <ol class="breadcrumb">
          <!-- InstanceBeginEditable name="breadcrumb" -->
          <li><a href="javascript:Ab.dashboard()"><i class="fa fa-dashboard"></i> Home</a></li>
          <li class="active">Ricerca e Indicizza</li>
          <!-- InstanceEndEditable -->
        </ol>
      </div>
      <div class="col-lg-4 lastUpdInfo"><!-- InstanceBeginEditable name="lastupdate" --><!-- InstanceEndEditable --></div>
    </div>
    <div class="box box-header">
      <div class="box-body">
        <div class="row">
          <div class="col-lg-8"><!-- InstanceBeginEditable name="toolbar" --><!-- InstanceEndEditable --></div>
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
      <input type="hidden" name="actionPage" id="actionPage" value="../pg_RUS/Foto.abl">
      <input name="pageType" type="hidden" id="pageType" value="R">
      <input name="currentTab" type="hidden" id="currentTab" value="<%= CR.getCurrentTab() %>">
      <input name="currentFocus" type="hidden" id="currentFocus" value="<%= CR.getCurrentFocus() %>">
      <input type="hidden" name="id_foto" id="id_foto" value="<%=CR.getId_foto()%>">
      <div class="row  hidden-print">
        <div class="col-lg-12">
          <div class="box box-ricerca">
            <div class="box-body">
              <div class="row">
                <div class="col-lg-12">
                  <label for="txtRicerca">RICERCA E INDICIZZAZIONE </label>
                  <input name="flgTh" type="hidden" id="flgTh" value="<%=CR.getFlgTh()%>">
                </div>
              </div>
              <div class="row">
				  <div class="col-lg-3 col-xs-12" >
                    <label>Gara:</label>
                    <acx:inputajax bean="" boundcolumn="id_gara"  action='<%="/admin/pg_RUS/Gara.abl?&searchTxt="%>' 
   nchar="0" returndata=""  nextacion="searching()"
   usesubmit="false" usemono="false" javascriptmodify="" javascriptnew="" >
                      <div class="input-group input-group-sm">
                        <input defaultFocus="focus" name="descrizioneGara" type="text" class="form-control input-sm ajSearchText"  id="descrizioneGara" value="<%=CR.getGara().getDescrizioneGaraCompleta()%>" />
                      </div>
                    </acx:inputajax>
                  </div>
               
                <div class="col-lg-3 col-xs-6">
                  <label for="txtRicerca"> Scegli Punto Foto:</label>
                  <br>
                  <select  class="form-control input-sm select2"   name="id_puntoFoto" id="id_puntoFoto" onChange="searchingP()" >
                    <acx:optionvec  boundcolumn="id_puntoFoto" desccolumn="descrizioneCompleta" vectumerator="listaPuntiFoto" value="<%=CR.getId_puntoFoto()%>" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</acx:optionvec>
                  </select>
                </div>
                <div class="col-lg-1 col-xs-6">
                  <label for="txtRicerca">Pettorale: </label>
                  <br>
                  <input   name="pettorale" type="text" class="form-control  input-sm" id="pettorale"  value="<%= CR.getPettorale() %>"   maxlength="15" >
                </div>
                <div class="col-lg-1 col-xs-6">
                  <label for="txtRicerca">Nome  Foto: </label>
                  <br>
                  <input   name="file" type="text" class="form-control  input-sm" id="file"  value="<%= CR.getFile() %>"   maxlength="15" nextFocus="searchingP()">
                </div>
                <div class="col-lg-1 col-xs-6"> <a class="btn btn-app btn-app-sm pull-right hidden-print" href="javascript:searchingP()"> <i class="fa fa-search" title="Cerca" style="color:blue"></i>Cerca </a> </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <acx:if wherecondition='<%=CR.getFlgTh()==0%>' >
        <div class="row">
          <div class="col-lg-12">
            <div class="box"> 
              <!-- .box-header -->
              <div class="box-header clearfix hidden-print">
                <jsp:include page="../_V4/_inc/_inc_paginazione.jsp" flush="true" />
              </div>
              <!-- /.box-header -->
              <div class="box-body table-responsive">
                <table class="table table-bordered table-hover table-striped dataTable table-condensed ">
                  <thead>
                    <tr>
                      <th>&nbsp;</th>
                      <th>Gara</th>
                      <th>File Name</th>
                      <th>Pettorali associati alla foto</th>
                    </tr>
                  </thead>
                  <acx:whilevec rowbeanclass="it.acxent.pg.Foto" vectumerator="list">
                    <tr>
                      <td class="comandi text-center" style="width: 80px"><div class="inline text-center hidden-print"><a href="javascript:modifyCommand('<%=rowBean.getId_foto()%>');"><i class="fa fa-edit fa-2x" title="Modifica Record"></i></a> <a href="javascript:deleteCommandCR('<%=rowBean.getId_foto()%>','<%= rowBean.getLastUpdTmstString() %>');"><i class="fa fa-trash-o fa-2x" title="Cancella Record"></i></a></div></td>
                      <td data-title="Gara"><%= rowBean.getPuntoFoto().getDescrizioneCompleta() %>..<%= rowBean.getId_puntoFoto() %> <%= rowBean.getId_foto() %></td>
                      <td data-title="File Name"><%=rowBean.getFile()%></td>
                      <td data-title="Pettorali"><%=rowBean.getPettorali()%></td>
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
      </acx:if>
      <acx:else>
        <div class="row">
          <div class="col-lg-12">
            <div class="box"> 
              <!-- .box-header -->
              <div class="box-header clearfix hidden-print">
               <jsp:include page="../_V4/_inc/_inc_paginazione.jsp" flush="true" />
              </div>
              <div class="box-body table-responsive">
                <table class="table table-bordered table-hover table-striped dataTable table-condensed ">
                  <thead>
                    <tr>
                      <th>N:</th>
                      <th>FOTO</th>
                    </tr>
                  </thead>
                  <% int i=(CR.getPageNumber()-1)*20;%>
                  <acx:whilevec rowbeanclass="it.acxent.pg.Foto" vectumerator="list">
                    <% i++;%>
                    <tr>
                      <td class="text-center" data-title="N." ><br>
                        <br>
                        <span style="font-size: 30px;vertical-align: middle" ><%=i%><br>
                        <%=rowBean.getFile()%></span><br>
                        <br>
                        <br>
                        <a href="javascript:modifyCommand('<%=rowBean.getId_foto()%>');"><i class="fa fa-edit fa-4x" title="Modifica Record"></i></a> <br>
                        <br>
                        <span style="font-size: 30px;vertical-align: middle" ><%=rowBean.getPettorali()%></span></td>
                      <td data-title="File Name">
						  <!-- ok per www tanto sono le semi ridotte 
						<img src="../../fotoOriginali/<%=rowBean.getFileURI()%>" alt="" class="thumb" style="max-width: 200px"/>-->
						  <!-- foto su admin ridotte -->
						  <img src="../../fotoTnAdmin/<%=rowBean.getFile()%>?id_foto=<%=rowBean.getId_foto()%>" alt="" class="thumb" style="max-width: 400px" />
						  
                    </td>
                    </tr>
                  </acx:whilevec> 
                </table>
              </div> 
            </div>
          </div>
        </div>
      </acx:else>
      <!-- InstanceEndEditable -->
    </form>
  </section>
   <!-- SCRIPT DI RESET --> 
   <script language="JavaScript" src="../_V4/_js/_reset.js"></script> 
  <!-- InstanceBeginEditable name="js-pagina" --> 
  <!-- SCRIPT PERSONALIZZATI DELLA PAGINA --> 
  <script language="JavaScript" src="../pg_RUS/_js/ab-foto.js"></script> 
  <!-- InstanceEndEditable --> <!-- InstanceBeginEditable name="extra" --> <!-- InstanceEndEditable --> </acx:if_logon_ok>
<acx:else_logon> gestire il redirect al login </acx:else_logon>  
<!-- InstanceEnd -->