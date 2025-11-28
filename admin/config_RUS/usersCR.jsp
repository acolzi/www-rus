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
  <input name="pageTitle" type="hidden" id="pageTitle" value="Elenco Utenti">
  <jsp:useBean id="list" scope="request" class="it.acxent.util.Vectumerator" type="it.acxent.util.Vectumerator">
  </jsp:useBean>
  <!--  pagine di dettaglio --> 
  <!--  pagine di ricerca -->
  <jsp:useBean id="CR" class="it.acxent.pg.UsersCR" type="it.acxent.pg.UsersCR" scope="request" >
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
          <li class="active">Elenco Utenti</li>
          <!-- InstanceEndEditable -->
        </ol>
      </div>
      <div class="col-lg-3 lastUpdInfo"><!-- InstanceBeginEditable name="lastupdate" --> <!-- InstanceEndEditable --></div>
    </div>
    <div class="box box-header">
      <div class="box-body">
        <div class="row">
          <div class="col-lg-8"><!-- InstanceBeginEditable name="toolbar" --><a class="btn btn-app btn-app-sm" href="javascript:newCommand()"> <i class="fa fa-file-o" title="Nuovo Record"></i>Nuovo</a> <a class="btn btn-app btn-app-sm" href="javascript:Ab.printW()"> <i class="fa fa-print" title="Stampa Pagina"></i>Stampa</a><a class="btn btn-app btn-app-sm " href="javascript:report()"> <i class="fa fa-bar-chart" title="Report"></i>Report </a>
            <acx:if wherecondition="<%=utenteLogon.getId_users()==1%>"><a class="btn btn-app btn-app-sm " href="javascript:initCommand()"> <i class="fa fa-cog" title="Init"></i>init </a><a class="btn btn-app btn-app-sm " href="javascript:updatePwd()"> <i class="fa fa-user" title="Aggiorna Pwd"></i>Aggiorna Pwd </a> <a class="btn btn-app btn-app-sm " href="javascript:editOne()"> <i class="fa fa-user-secret" title="Aggiorna Pwd"></i>Edit Super Admin</a></acx:if>
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
      <input name="pageType" type="hidden" id="pageType" value="R">
      <input name="currentTab" type="hidden" id="currentTab" value="<%= CR.getCurrentTab() %>">
      <input name="currentFocus" type="hidden" id="currentFocus" value="<%= CR.getCurrentFocus() %>">
      <!-- ricerca -->
      <input type="hidden" name="actionPage" id="actionPage" value="../config/Users.abl">
      <input name="id_users" type="hidden" id="id_users">
      <div class="row  hidden-print">
        <div class="col-xs-12">
          <div class="box box-ricerca">
            <div class="box-body">
              <div class="row">
                <div class="col-xs-4">
                  <label for="searchTxt">Ricerca</label>
                  <input defaultFocus="focus" type="text" class="form-control  input-sm" id="searchTxt" name="searchTxt" placeholder="nominativo" value="<%=CR.getSearchTxt() %>">
                </div>
                <div class="col-xs-2">
                  <label for="id_userProfile">Profilo Utente</label>
                  <select name="id_userProfile" id="id_userProfile" onChange="searching()" class="form-control select2" style="width: 100%;">
                    <acx:optionvec  boundcolumn="id_userProfile" desccolumn="descrizione" vectumerator="listaProfiliUtente" value="<%=CR.getId_userProfile()%>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</acx:optionvec>
                  </select>
                </div>
                <div class="col-xs-2">
                  <label for="flgValido">Attivo:</label>
                  <select name="flgValido" id="flgValido"  <%=Ab.jsCrS()%> onChange="javascript:searching()" class="form-control select2" style="width: 100%;">
                    <option value=""  <%=CR.getFlgValido().equals("")?"selected":""%> >--- Tutti ---</option>
                    <option value="N"  <%=CR.getFlgValido().equals("N")?"selected":""%> >Non Attivi</option>
                    <option value="S" <%=CR.getFlgValido().equals("S")?"selected":""%> >Attivi</option>
                  </select>
                </div>
                <div class="col-xs-2">
                  <label for="flgValido">Scaduto:</label>
                  <select name="flgScaduto" id="flgScaduto"  onChange="javascript:searching()" class="form-control select2" style="width: 100%;">
                    <option value="-1"  <%=CR.getFlgScaduto()<0?"selected":""%> >--- Tutti ---</option>
                    <option value="0"  <%=CR.getFlgScaduto()==0?"selected":""%> >Non Scaduti</option>
                    <option value="1" <%=CR.getFlgScaduto()==1?"selected":""%> >Scaduti</option>
                  </select>
                </div>
                <div class="col-xs-2"> <a class="btn-search btn btn-app btn-app-sm pull-right " href="javascript:searching()"> <i class="fa fa-search" title="Cerca"></i>Cerca </a> </div>
              </div>
              <div class="row">
                <div class="col-xs-12">
                  <label for="flgValido">Modello x coda Messaggi:</label>
                  <br>
                  <select name="id_templateMsg" class="form-control  input-sm" id="id_templateMsg"  style="width:200px;    display: initial;">
                    <acx:optionvec  boundcolumn="id_templateMsg" desccolumn="descrizioneCompleta" vectumerator="listaTemplateMsg" >&nbsp;</acx:optionvec>
                  </select>
                  &nbsp; <a class="btn btn-app btn-app-sm" href="javascript:creaCodaMsg();" > <i class="fa fa-cogs"title="Crea coda messaggi relativo al template scelto in base ai criteri di ricerca"></i>Crea coda messaggi </a></div>
              </div>
            </div>
          </div>
        </div>
      </div>
      </div>
      <!-- dati -->
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
                  <tr >
                    <th >&nbsp;</th>
                    <th >Val.</th>
                    <th >Op.</th>
                    <th  >News</th>
                    <th  >Mailing List</th>
                    <th > Utente </th>
                    <th >Login</th>
                    <th >Password</th>
                    <th >Email</th>
                    <th>Profilo</th>
                    <th>Data Scadenza</th>
                    <th>FotoVis/Max</th>
                  </tr>
                </thead>
                <acx:whilevec  rowbeanclass="it.acxent.pg.Users"  vectumerator="list">
                  <tr>
                    <td class="comandi text-center"><div class="inline text-center hidden-print"><a href="javascript:modifyCommand(<%=rowBean.getId_users()%>);"><i class="fa fa-edit fa-2x" title="Modifica Record"></i></a> <a href="javascript:deleteCommandCR(<%=rowBean.getId_users()%>,'<%= rowBean.getLastUpdTmstString() %>');"><i class="fa fa-trash-o fa-2x" title="Cancella Record"></i></a></div></td>
                    <td data-title="Val." class="text-center"><acx:if wherecondition='<%=rowBean.getFlgValido().equals("S")%>'><i class="fa fa-check" title="Utente Valido"></i></acx:if></td>
                    <td data-title="Op." class="text-center"><acx:if wherecondition='<%=rowBean.getFlgOperatore()==1%>'><i class="fa fa-check" title="Operatore"></i></acx:if></td>
                    <td data-title="News" class="text-center"><acx:if wherecondition='<%=rowBean.getFlgNews()==1%>'><i class="fa fa-check" title="Ricezione News abilitata"></i></acx:if></td>
                    <td data-title="Mailing List" class="text-center"><acx:if wherecondition='<%=rowBean.getFlgMl()==1%>'><i class="fa fa-check" title="Mailing List abilitata"></i></acx:if></td>
                    <td data-title="Utente" ><%= rowBean.getId_users() %> - <%= rowBean.getCognome() %> <%= rowBean.getNome() %></td>
                    <td data-title="Login" ><%= rowBean.getLogin() %></td>
                    <td data-title="Password" ><acx:if wherecondition="<%=rowBean.isSocialAccount()%>"><span class="text-green text-bold"><%=rowBean.getSocialIdType()%></span></acx:if><acx:else><acx:if wherecondition='<%=utenteLogon.getId_userProfile()==1 %>'><%= rowBean.getPwdPlain() %></acx:if>
                      <acx:else>****</acx:else></acx:else></td>
                    <td data-title="Email"><a href="mailto:<%=rowBean.getEMail()%>"><%= rowBean.getEMail() %></a></td>
                    <td data-title="Profilo" ><%= rowBean.getUserProfile().getDescrizione() %></td>
                    <td data-title="Data Scadenza" ><acx:if wherecondition="<%=rowBean.isDaRinnovare(false)%>"><a href="javascript:rinnovaAnnoCR(<%=rowBean.getId_users()%>)"><i class="fa fa-ban"  title="Rinnova per 1 anno 1000 foto"  style="color: darkred">1</i></a> <a href="javascript:rinnovaAnno3CR(<%=rowBean.getId_users()%>)"><i class="fa fa-ban" title="Rinnova per 3 anni 3000 foto" style="color:chocolate">3</i></a></acx:if>
                      <acx:else><i class="fa fa-check" style="color:darkgreen"></i></acx:else>
                      <%=df.format( rowBean.getDataScadenza()) %></td>
                    <td data-title="FotoVis/Max" ><%= rowBean.getNFotoVisual() %>/<%= rowBean.getNFotoMax() %></td>
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
  <script language="JavaScript" src="../config/_js/acxent-usersCommon.js"></script> 
  <script language="JavaScript" src="../config_RUS/_js/acxent-usersApp.js"></script> 
  <!-- InstanceEndEditable --> <!-- InstanceBeginEditable name="extra" --> <!-- InstanceEndEditable --> </acx:if_logon_ok>
<acx:else_logon> gestire il redirect al login </acx:else_logon>
<!-- InstanceEnd -->