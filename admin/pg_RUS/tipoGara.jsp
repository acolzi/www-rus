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
  <input name="pageTitle" type="hidden" id="pageTitle" value="Tipo Gara">
  <jsp:useBean id="tipoGaraPadre" scope="request" class="it.acxent.pg.TipoGara" type="it.acxent.pg.TipoGara" >
  </jsp:useBean>
  <jsp:useBean id="bean" scope="request" class="it.acxent.pg.TipoGara" type="it.acxent.pg.TipoGara" >
  </jsp:useBean>
  <jsp:useBean id="listaPadri" scope="request" class="it.acxent.util.Vectumerator" type="it.acxent.util.Vectumerator" >
  </jsp:useBean>
  <jsp:useBean id="list" scope="request" class="it.acxent.util.Vectumerator" type="it.acxent.util.Vectumerator" >
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
          <li class="active">Tipo Gara</li>
          <!-- InstanceEndEditable -->
        </ol>
      </div>
      <div class="col-lg-3 lastUpdInfo"><!-- InstanceBeginEditable name="lastupdate" --> <%=bean.getLastUpdInfo()%> <!-- InstanceEndEditable --></div>
    </div>
    <div class="box box-header">
      <div class="box-body">
        <div class="row">
          <div class="col-lg-8"><!-- InstanceBeginEditable name="toolbar" --><a href="javascript:saveCommand();" class="btn btn-app btn-app-sm"> <i class="fa fa-floppy-o" title="Salva Record"></i>Salva</a> <a href="javascript:ordineAlfabetico()" class="btn btn-app btn-app-sm"><i class="fa fa-cogs" aria-hidden="true"></i>Ripristina ordine alfabetico</a> <a class="btn btn-app btn-app-sm" href="javascript:ricalcolaIndici()"> <i class="fa fa-cog" title="Ricalcola Indici"></i>Ricalcola Indici</a>
            <%--
          <a class="btn btn-app btn-app-sm" href="javascript:saveCommand()"> <i class="fa fa-floppy-o" title="Salva Record"></i>Salva</a><a class="btn btn-app btn-app-sm" href="javascript:Ab.printW()"> <i class="fa fa-print" title="Stampa"></i>Stampa</a>
          --%>
            <!-- InstanceEndEditable --></div>
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
      <input name="lastUpdTmst" id="lastUpdTmst" type="hidden" value="<%= bean.getLastUpdTmstString() %>">
      <input type="hidden" name="actionPage" id="actionPage" value="../pg_RUS/TipoGara.abl">
      <input name="pageType" type="hidden" id="pageType" value="D">
      <input name="currentTab" type="hidden" id="currentTab" value="<%= bean.getCurrentTab() %>">
      <input name="currentFocus" type="hidden" id="currentFocus" value="<%= bean.getCurrentFocus() %>">
      <input name="id_tipoGara" type="hidden" id="id_tipoGara" value="<%=bean.getId_tipoGara()%>" <%=Ab.jsCr("flgStampaEtichette")%> >
      <div class="row  hidden-print">
        <div class="col-lg-12">
          <div class="box box-dettaglio">
            <div class="box-body">
              <div class="row">
                <div class="col-lg-12"> <a href="javascript:listaTipoGara(0)">Tutti i Tipi</a>
                  <acx:whilevec  rowbeanclass="it.acxent.pg.TipoGara" vectumerator="listaPadri"> -&gt; <a href="javascript:listaTipoGara(<%=rowBean.getId_tipoGara()%>)"><%=rowBean.getDescrizione()%></a></acx:whilevec>
                  -><%=tipoGaraPadre.getDescrizione()%>(<%=tipoGaraPadre.getId_tipoGara()%>)<br>
                </div>
              </div>
              <div class="row">
                <div class="col-lg-5 col-xs-6">
                  <label for="txtRicerca">Tipo Gara Padre:</label>
                  <br>
                  <input name="id_tipoGaraPadre" type="hidden" id="id_tipoGaraPadre" value="<%=tipoGaraPadre.getId_tipoGara()%>" size="2" maxlength="4" class="form-control input-sm">
                  <div class="input-group input-group-sm">
                    <input name="descrizioneTipoGaraPadre" type="text" class="form-control input-sm ajSearchText" id="descrizioneTipoGaraPadre" value="<%= tipoGaraPadre.getDescrizioneCompleta()%>" size="38" maxlength="60" 
                    <%=Ab.jsAjSearchText4("/admin/artConfig/TipoGara.abl?searchTxt=","descrizioneTipoGaraPadre","listaTipi","main.id_tipoGaraPadre,main.descrizioneTipoGaraPadre",2,"")%>/>
                    <span class="input-group-addon"><a href="javascript:Ab.clrField('main','id_tipoGaraPadre','descrizioneTipoGaraPadre')"><i class="fa fa-refresh fa-sm"></i> </a></span><!-- <span class="input-group-addon"><a href="javascript:openSW('/admin/artConfig/TipoGara.abl','main.id_tipoGaraPadre,main.descrizioneTipoGaraPadre',340);"><i class="fa fa-edit fa-sm"></i></a></span>--> </div>
                  <%=Ab.divAjSearchDiv4("listaTipi")%> </div>
              </div>
              <div class="row tabs">
                <div class="col-lg-12"> 
                  <!-- Custom Tabs -->
                  <div class="nav-tabs-custom">
                    <ul class="nav nav-tabs" id="tabs">
                      <li class="active"> <a href="#TIP" data-toggle="tab"> Descrizione </a> </li>
                       <acx:if wherecondition="<%=bean.getDBState()==1%>">
                      <li> <a href="#IMG" data-toggle="tab"> Immagine </a> </li>
						</acx:if>
                    </ul>
                    <div class="tab-content">
                      <div class="tab-pane active" id="TIP">
                        <div class="row">
                          <div class="col-lg-4 col-xs-6">
                            <label for="txtRicerca"> Descrizione :</label>
                            <br>
                            <input name="descrizione"   type="text" class="form-control  input-sm" id="descrizione" value="<acx:inputTextFormat><%= bean.getDescrizione() %></acx:inputTextFormat>"   maxlength="60" defaultFocus="focus">
                          </div>
                          <div class="col-lg-2">
                            <label for="txtRicerca">Ordine:</label>
                            <br>
                            <input name="ordine" type="text" class="form-control  input-sm"  id="ordine" value="<%= bean.getOrdine() %>"   maxlength="5">
                          </div>
                          <div class="col-lg-2 col-xs-6">
                            <label for="txtRicerca">Nascondi:</label>
                            <br>
                            <select  class="form-control input-sm select2" style="width: 100%;" name="flgNascondi" id="flgNascondi"  >
                              >
                              <option value="0" <%=bean.getFlgNascondi()==0?"selected":"" %> >No</option>
                              <option value="1" <%=bean.getFlgNascondi()==1?"selected":"" %> >Si</option>
                            </select>
                          </div>
                        </div>
                        <div class="row"></div>
                      </div>
                      <div class="tab-pane" id="IMG">
                        <jsp:include page="_inc_tipoGara_immagine.jsp" flush="true" />
                   
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-xs-12">
          <div class="box"> 
            <!-- .box-header -->
            <div class="box-header clearfix hidden-print">
              <jsp:include page="../_V4/_inc/_inc_paginazione.jsp" flush="true" />
            </div>
            
            <!-- /.box-header -->
            <div class="box-body " id="no-more-tables" >
              <table class="table table-bordered table-hover table-striped dataTable table-condensed">
                <tr>
                  <th></th>
                  <th>Descrizione</th>
                  <th>Nasc. </th>
                </tr>
                <acx:whilevec rowbeanclass="it.acxent.pg.TipoGara" vectumerator="list">
                  <tr <%=rowBean.getId_tipoGara()==bean.getId_tipoGara()?"class='success'":""%>>
                    <td class="comandi text-center"><div class="inline text-center hidden-print"> <a href="javascript:modifyBean('<%=rowBean.getId_tipoGara()%>');"> <i class="fa fa-edit" title="Modifica Record"></i> </a> <a href="javascript:deleteBean('<%=rowBean.getId_tipoGara()%>','<%= rowBean.getLastUpdTmstString() %>');"> <i class="fa fa-trash-o" title="Cancella Record"></i> </a> </div></td>
                    <td><acx:if wherecondition="<%=rowBean.getFlgFoglia()==1%>"><i class="fa fa-leaf" title="Operatore"> </i></acx:if>
                      <a href="javascript:listaTipoGara(<%=rowBean.getId_tipoGara()%>)"><%= rowBean.getOrdine() %> - (Liv. <%= rowBean.getLivello() %>) <%= rowBean.getDescrizione() %></a></td>
                    <td align="center" ><%= rowBean.getNascondi() %>
                  </tr>
                </acx:whilevec>
              </table>
            </div>
          </div>
          <a href="#">
          <div class="col-lg-3 col-xs-6"> 
            <!-- small box --> 
          </div>
          </a> <a href="#">
          <div class="col-lg-3 col-xs-6"> 
            <!-- small box --> 
          </div>
          </a> </div>
      </div>
      <!-- InstanceEndEditable -->
    </form>
  </section>
  <!-- SCRIPT DI RESET --> 
  <script language="JavaScript" src="../_V4/_js/_reset.js"></script> 
  <!-- InstanceBeginEditable name="js-pagina" --> 
  <!-- SCRIPT PERSONALIZZATI DELLA PAGINA --> 
  <script language="JavaScript" src="../pg_RUS/_js/ab-tipoGara.js"></script> 
  <!-- InstanceEndEditable --> <!-- InstanceBeginEditable name="extra" --> <!-- InstanceEndEditable --> </acx:if_logon_ok>
<acx:else_logon> gestire il redirect al login </acx:else_logon>
<!-- InstanceEnd -->