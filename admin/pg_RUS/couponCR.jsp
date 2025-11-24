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
  <input name="pageTitle" type="hidden" id="pageTitle" value="COUPON Dettaglio">
  <jsp:useBean id="list" scope="request" class="it.acxent.util.Vectumerator" type="it.acxent.util.Vectumerator">
  </jsp:useBean>
  <jsp:useBean id="CR" class="it.acxent.pg.CouponCR" type="it.acxent.pg.CouponCR" scope="request" >
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
            Coupon </li>
          <!-- InstanceEndEditable -->
        </ol>
      </div>
      <div class="col-lg-3 lastUpdInfo"><!-- InstanceBeginEditable name="lastupdate" --><!-- InstanceEndEditable --></div>
    </div>
    <div class="box box-header">
      <div class="box-body">
        <div class="row">
          <div class="col-lg-8"><!-- InstanceBeginEditable name="toolbar" --><a class="btn btn-app btn-app-sm" href="javascript:newCommand()"> <i class="fa fa-file-o" title="Nuovo Record"></i>Nuovo</a><a class="btn btn-app btn-app-sm" href="javascript:Ab.printW()"> <i class="fa fa-print" title="Stampa Pagina"></i>Stampa</a><a class="btn btn-app btn-app-sm " href="javascript:report()"> <i class="fa fa-bar-chart" title="Report"></i>Report </a><a class="btn btn-app btn-app-sm " href="javascript:generaCouponShow()"> <i class="fa fa-cogs" title="Report"></i>Genera Coupon </a><a class="btn btn-app btn-app-sm " href="javascript:stampaCouponShow()"> <i class="fa fa-print" title="Report"></i>Stampa Coupon </a><!-- InstanceEndEditable --></div>
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
      <input type="hidden" name="actionPage" id="actionPage" value="../pg_RUS/Coupon.abl">
      <input name="pageType" type="hidden" id="pageType" value="R">
      <input name="currentTab" type="hidden" id="currentTab" value="<%= CR.getCurrentTab() %>">
      <input name="currentFocus" type="hidden" id="currentFocus" value="<%= CR.getCurrentFocus() %>">
      <input type="hidden" name="id_coupon" id="id_coupon" value="<%=CR.getId_coupon()%>">
      <div class="row hidden-print">
        <div class="col-lg-12">
          <div class="box box-ricerca">
            <div class="box-body">
              <div class="row">
                <div class="col-lg-3 col-xs-6">
                  <label for="serie">Serie:</label>
                  <br>
                  <input type="text" class="form-control input-sm" name="serie" id="serie" value="<%=CR.getSerie()%>" maxlength="40" onChange="searching()">
                </div>
                <div class="col-lg-3 col-xs-6">
                  <label for="codice">Codice:</label>
                  <br>
                  <input type="text" class="form-control input-sm" name="codice" id="codice" value="<%=CR.getCodice()%>" maxlength="40" onChange="searching()">
                </div>
                <div class="col-lg-2 col-xs-6">
                  <label for="codice">Attivi:</label>
                  <br>
                <select name="flgAttivi" id="flgAttivi"  onChange="searching()" class="form-control select2">  
   <acx:optionflg  boundcolumn="flgAttivi" valuelist="-1,0,1,"> </acx:optionflg>
 </select>
 
                </div>
                <div class="col-lg-2 col-xs-6"><a class="btn btn-app btn-app-sm pull-right hidden-print" href="javascript:searching()"> <i class="fa fa-search"title="Cerca"></i>Cerca </a></div>
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
                <thead>     <tr >
              <th colspan="13"> <div id="fileCsv" style="font-size: 14px" class="d-print-none"><a href="javascript:couponCsv()"> Premi per avere il file in formato csv (Excel)</a>&nbsp;</div></th>
            </tr>
                  <tr>
                    <th>&nbsp;</th>
                    <th>Serie</th>
                    <th>Codice</th>
                    <th>Num. Foto</th>
                    <th>Creato</th>
                    <th>Stampato</th>
                    <th>Utilizzato</th>
                  </tr>
                </thead>
                <acx:whilevec rowbeanclass="it.acxent.pg.Coupon" vectumerator="list">
                  <tr>
                    <td class="comandi text-center"><div class="inline text-center hidden-print"><a href="javascript:modifyCommand('<%=rowBean.getId_coupon()%>');"><i class="fa fa-edit" title="Modifica Record"></i></a> <a href="javascript:deleteCommandCR('<%=rowBean.getId_coupon()%>','<%= rowBean.getLastUpdTmstString() %>');"><i class="fa fa-trash-o" title="Cancella Record"></i></a></div></td>
                    <td data-title="Serie"><%=rowBean.getSerie()%></td>
                    <td data-title="Codice"><%=rowBean.getCodice()%></td>
                    <td data-title="Num. Foto"><%=rowBean.getNFoto()%></td>
                    <td data-title="Riga Documento"><%=rowBean.getCreateTmstS()%></td>
                    <td data-title="Riga Documento"><%=rowBean.getPrintTmstS()%></td>
                    <td data-title="Riga Documento"><acx:if wherecondition="<%=rowBean.isValido()%>"><i class="fa fa-check" title="Coupon valido"></i></acx:if><acx:else><%=rowBean.getRigaDocumento().getDocumento().getNumeroDocumento()%> del <%=df.format(rowBean.getRigaDocumento().getDocumento().getDataDocumento())%> -  <%=rowBean.getRigaDocumento().getDocumento().getNominativoDocumento()%> </acx:else></td>
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
      <!-- generazione coupon -->
      <div id="generaCoupon" class="modal fade" role="dialog">
        <div class="modal-dialog"> 
          <!-- Modal content-->
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal">&times;</button>
              <h4 class="modal-title">Genera Coupon</h4>
            </div>
            <div class="modal-body mov-body scroll-300">
              <div class="col-lg-4">
                <label>Serie:</label>
                <br>
                 <input type="text" class="form-control input-sm" name="serie1" id="serie1"  maxlength="40">
            
              </div>
               <div class="col-lg-4">
                <label>N. Foto:</label>
                <br>
                 <input type="text" class="form-control input-sm numberinput" name="nFoto1" id="nFoto1"  maxlength="40">
            
              </div>
                 <div class="col-lg-4">
                <label>N. coupon:</label>
                <br>
                 <input type="text" class="form-control input-sm numberinput" name="numCoupon" id="numCoupon"  maxlength="40">
            
              </div>
              <div class="col-lg-3"><a class="btn btn-success btn-associative"  href="javascript:generaCoupon()">Genera Coupon!</a></div>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-default" data-dismiss="modal">Chiudi</button>
            </div>
          </div>
        </div>
      </div>
      <!-- stampa serie -->
      <div id="stampaCoupon" class="modal fade" role="dialog">
        <div class="modal-dialog"> 
          <!-- Modal content-->
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal">&times;</button>
              <h4 class="modal-title">Stampa Serie</h4>
            </div>
            <div class="modal-body mov-body scroll-300">
              <div class="col-lg-4">
                <label>Serie:</label>
                <br>
                 <input type="text" class="form-control input-sm" name="serie2" id="serie2"  maxlength="40">
             
              </div>
               <div class="col-lg-4">
                <label>N. etichette da saltare:</label>
                <br>
                 <input type="text" class="form-control input-sm numberinput" name="numLabel" id="numLabel"  maxlength="40">
            
              </div>
              <div class="col-lg-3"><a class="btn btn-success btn-associative"  href="javascript:stampaCoupon()">Stampa Coupon!</a></div>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-default" data-dismiss="modal">Chiudi</button>
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
  <script language="JavaScript" src="../pg_RUS/_js/ab-coupon.js"></script> 
  <!-- InstanceEndEditable --> <!-- InstanceBeginEditable name="extra" --> <!-- InstanceEndEditable --> </acx:if_logon_ok>
<acx:else_logon> gestire il redirect al login </acx:else_logon>
<!-- InstanceEnd --> 