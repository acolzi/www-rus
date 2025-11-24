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
  <input name="pageTitle" type="hidden" id="pageTitle" value="Dettaglio Utente">
  <!--  pagine di dettaglio -->
  <jsp:useBean id="bean" class="it.acxent.pg.Users" type="it.acxent.pg.Users" scope="request" >
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
      <div class="col-lg-8">
        <ol class="breadcrumb">
          <!-- InstanceBeginEditable name="breadcrumb" -->
          <li><a href="javascript:Ab.dashboard()"><i class="fa fa-dashboard"></i> Home</a></li>
          <li ><a href="javascript:Ab.callAbl('/admin/config/Users',null,'back')">Elenco Utenti</a></li>
          <li class="active">Dettaglio Utente</li>
          <!-- InstanceEndEditable -->
        </ol>
      </div>
      <div class="col-lg-4 lastUpdInfo"><!-- InstanceBeginEditable name="lastupdate" --> <%=bean.getLastUpdInfo()%> <!-- InstanceEndEditable --></div>
    </div>
    <div class="box box-header">
      <div class="box-body">
        <div class="row">
          <div class="col-lg-8"><!-- InstanceBeginEditable name="toolbar" --> <a class="btn btn-app btn-app-sm" href="javascript:newCommand()"> <i class="fa fa-file-o" title="Nuovo Record"></i>Nuovo</a><a class="btn btn-app btn-app-sm" href="javascript:saveCommand()"> <i class="fa fa-floppy-o" title="Salva Record"></i>Salva</a><a class="btn btn-app btn-app-sm" href="javascript:Ab.printW()"> <i class="fa fa-print" title="Stampa"></i>Stampa</a><acx:if wherecondition="<%=bean.isDaRinnovare(false)%>"><a class="btn btn-app btn-app-sm" href="javascript:rinnova25()"> <i class="fa fa-magic" title="Rinnova 1 anno 25 foto"></i>Rinnova 25 foto</a><a class="btn btn-app btn-app-sm" href="javascript:rinnovaAnno()"> <i class="fa fa-magic" title="Rinnova 1 anno 1000 foto"></i>Rinnova 1 anno</a><a class="btn btn-app btn-app-sm" href="javascript:rinnovaAnno3()"> <i class="fa fa-magic" title="Rinnova 3 anni 3000 foto"></i>Rinnova 3 anni</a></acx:if><a class="btn btn-app btn-app-sm" href="javascript:deleteCommand()"> <i class="fa  fa-trash-o" title="Cancella Record"></i>Elimina</a> <!-- InstanceEndEditable --></div>
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
      <input type="hidden" name="actionPage" id="actionPage" value="../config/Users.abl">
      <input name="pageType" type="hidden" id="pageType" value="D">
      <input name="lastUpdTmst" id="lastUpdTmst" type="hidden" value="<%= bean.getLastUpdTmstString() %>">
      <input name="currentTab" type="hidden" id="currentTab" value="<%= bean.getCurrentTab() %>">
      <input name="currentFocus" type="hidden" id="currentFocus" value="<%= bean.getCurrentFocus() %>">
      <!-- dettaglio -->
      <div class="row">
        <div class="col-lg-12">
          <div class="box box-dettaglio">
            <div class="box-body">
              <div class="row">
                <div class="col-lg-3 col-xs-6">
                  <label for="txtRicerca">Codice:</label>
                  <br>
                  <span class="bluette"> </span> <%= bean.getId_users() %>
                  <input name="id_users" type="hidden" id="id_users" value="<%= bean.getId_users() %>">
                  </a></div>
                <div class="col-lg-1 col-xs-6">
                  <label for="txtRicerca">Valido:</label>
                  <br>
                  <input type="checkbox" class="minimal"  <%= bean.getFlgValido().equals("S")?"checked":""%> name="ckflgValido" id="ckflgValido" >
                  <input name="flgValido" type="hidden" id="flgValido" value="<%= bean.getFlgValido()%>">
                </div>
                <div class="col-lg-1 col-xs-6">
                  <label for="ckflgOperatore">Operatore:</label>
                  <br>
                  <input type="checkbox" class="minimal"  <%= bean.getFlgOperatore()==1?"checked":""%> name="ckflgOperatore" id="ckflgOperatore" >
                  <input name="flgOperatore" type="hidden" id="flgOperatore" value="<%= bean.getFlgOperatore()%>">
                </div>
                <div class="col-lg-1 col-xs-6">
                  <label for="ckflgNews"> Invio News: </label>
                  <br />
                  <input type="checkbox" class="minimal"  <%= bean.getFlgNews()==1?"checked":""%> name="ckflgNews" id="ckflgNews" >
                  <input name="flgNews" type="hidden" id="flgNews" value="<%= bean.getFlgNews()%>">
                </div>
				  <div class="col-lg-1 col-xs-6">
                  <label for="txtRicerca">Mailing list:</label>
                  <br>
                  <input type="checkbox" class="minimal"  <%= bean.getFlgMl()==1?"checked":""%> name="ckflgMl" id="ckflgMl" >
                  <input name="flgMl" id="flgMl" type="hidden" value="<%= bean.getFlgMl()%>">
                </div>
                <div class="col-lg-2 col-xs-6">
                  <label for="txtRicerca">Stile:</label>
                  <select  class="form-control select2" style="width: 100%;" name="style" id="style"  >
                    <acx:optionvec  boundcolumn="toString" desccolumn="toString" vectumerator="listaStili" value="<%=bean.getStyle()%>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</acx:optionvec>
                  </select>
                </div>
                <div class="col-lg-3 col-xs-6">
                  <label for="txtRicerca">Control Code:</label>
                  <input name="controlCode" type="text" class="form-control  input-sm"  id="controlCode" value="<%= bean.getControlCode() %>" size="30" maxlength="">
                </div>
              </div>
              <div class="row">
                <div class="col-lg-3 col-xs-6">
                  <label for="txtRicerca"> Login:</label>
                  <input name="login" type="text" class="form-control  input-sm"  id="login" value="<%= bean.getLogin() %>" size="30" maxlength="">
                </div>
                <div class="col-lg-2 col-xs-6">
                  <label for="txtRicerca">Password:<a href="javascript:cambiaPwdPop()" ><i class="fa fa-key" title="Cambia Password"></i></a></label>
                  <br>
                  <acx:if wherecondition='<%=utenteLogon.getId_userProfile()==1 %>'> <%= bean.getPwdPlain() %> </acx:if>
                  <acx:else>****</acx:else>
                </div>
                <div class="col-lg-2 col-xs-6">
                  <acx:if wherecondition="<%=utenteLogon.getId_users()==1%>">
                    <label for="txtRicerca">Password 2:<a href="javascript:cambiaPwdPop2()" ><i class="fa fa-key" title="Cambia Password2"></i></a> </label>
                    <br>
                    <acx:if wherecondition='<%=utenteLogon.getId_userProfile()==1 %>'> <%= bean.getPwdSuperPlain() %> </acx:if>
                    <acx:else>****</acx:else>
                  </acx:if>
                  <acx:else> &nbsp;</acx:else>
                </div><div class="col-lg-2 col-xs-6">
                  <label for="txtRicerca">Social Id <%=bean.getSocialIdType()%>:</label>
                  <br>
                  <input name="socialId" type="text" class="form-control  input-sm"  id="socialId" value="<%= bean.getSocialId() %>" size="30" maxlength="">
                </div>
                <div class="col-lg-3 col-xs-6">
                  <label for="txtRicerca"> Profilo Utente:</label>
                  <acx:if wherecondition='<%=utenteLogon.getId_userProfile()>1 %>'> <%= bean.getUserProfile().getDescrizione() %></acx:if>
                  <acx:else>
                    <select  class="form-control select2" style="width: 100%;" name="id_userProfile"  >
                      <acx:optionvec  boundcolumn="id_userProfile" desccolumn="descrizione" vectumerator="listaProfiliUtente" value="<%=bean.getId_userProfile()%>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</acx:optionvec>
                    </select>
                  </acx:else>
                </div>
              </div>
              <div class="row">
                <div class="col-lg-3 col-xs-12">
                  <label for="txtRicerca">Nome:</label>
                  <input name="nome" type="text" class="form-control  input-sm"  id="nome" value="<%= bean.getNome() %>" size="30" maxlength="">
                </div>
                <div class="col-lg-3 col-xs-12">
                  <label for="txtRicerca">Cognome:</label>
                  <input name="cognome" type="text" class="form-control  input-sm"  id="cognome" value="<%= bean.getCognome() %>" size="30" maxlength="">
                </div>
                <div class="col-lg-3 col-xs-12">
                  <label for="txtRicerca">E - mail:</label>
                  <input type="text" class="form-control  input-sm" id="eMail" name="eMail" size="30" maxlength="" value="<%= bean.getEMail() %>">
                </div>  <div class="col-lg-3 col-xs-12">
                  <label for="txtRicerca">Ts Invio Mail Recupero:</label>
                  <br>
                  <%= bean.getTsInvioMailRecupero() %> </div>
              </div>
              <div class="row">
                <div class="col-lg-4">
                  <label for="txtRicerca">Cliente/Fornitore:</label>
                  <input readonly name="id_clifor" type="hidden" id="id_clifor" value="<%= bean.getId_clifor() %>" size="3" maxlength="30" />
                  <div class="input-group input-group-sm">
                    <input name="descrizioneClifor" type="text" class="form-control input-sm ajSearchText"  id="descrizioneClifor" value="<acx:inputTextFormat><%= bean.getClifor().getDescrizioneCompleta()%></acx:inputTextFormat>" size="40" maxlength="60"  <%=Ab.jsAjSearchText4("/admin/anag/Clifor.abl?searchTxt=","descrizioneClifor","listaClifor","main.id_clifor,main.descrizioneClifor",3,"elencoIpAbilitati")%> />
                    <span class="input-group-addon "><a href="javascript:Ab.clrField('main','id_clifor','descrizioneClifor');"><i class="fa fa-refresh fa-sm"></i> </a></span> <span class="input-group-addon "><a href="javascript:modifyClifor();"><i class="fa fa-edit"></i></a></span></div>
                  <%=Ab.divAjSearchDiv4("listaClifor")%></div>
                <div class="col-lg-8">
                  <label for="txtRicerca"> Ip Abilitati (divisi da virgola. Se vuoto viene ignorato. Valgono anche parte di un indirizzo IP):</label>
                  <input type="text" class="form-control  input-sm" id="elencoIpAbilitati" name="elencoIpAbilitati" size="30" maxlength="" value="<%= bean.getElencoIpAbilitati() %>">
                </div>
              </div>
              <div class="row tabs">
                <div class="col-lg-12"> 
                  <!-- Custom Tabs -->
                  <div class="nav-tabs-custom">
                    <ul class="nav nav-tabs" id="tabs">
                      <li ><a href="#PERM" data-toggle="tab">Permessi</a></li>
                      <li><a href="#GRPERM" data-toggle="tab">Gruppo Permessi</a></li>
                      <li><a href="#LOG" data-toggle="tab">LOG</a></li>
                      <li><a href="#CLI" data-toggle="tab">Clienti</a></li>
                      <li><a href="#IMG" data-toggle="tab">Immagine Profilo</a></li>
                        <li><a href="#NOTA" data-toggle="tab">Nota</a></li>
                           <li class="active"><a href="#IND" data-toggle="tab">Dati Regalami Un Sorriso</a></li>
                    </ul>
                    <div class="tab-content">
                      <div class="tab-pane" id="PERM">
                        <jsp:include page="../config/_inc_users_permessi.jsp" flush="true" />
                       
                      </div>
                      <!-- /.tab-pane -->
                      <div class="tab-pane" id="GRPERM">
                        <jsp:include page="../config/_inc_users_gruppoPermessi.jsp" flush="true" />
                      </div>
                      <!-- /.tab-pane -->
                      <div class="tab-pane" id="LOG">
                         <jsp:include page="../config/_inc_users_log.jsp" flush="true" />
                      </div>
                      <!-- /.tab-pane -->
                      <div class="tab-pane" id="CLI">
                         <jsp:include page="../config/_inc_users_clienti.jsp" flush="true" />
                      </div>
                      <div class="tab-pane" id="IMG">
                       <jsp:include page="../config/_inc_users_immagine.jsp" flush="true" />
                        
                      </div>
                        <div class="tab-pane" id="NOTA">
                       <jsp:include page="../config/_inc_users_nota.jsp" flush="true" />
                        
                      </div>
                        <div class="tab-pane active" id="IND">
                       <jsp:include page="_inc_users_indirizzo.jsp" flush="true" />
                        
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
      <div id="modalPwd" class="modal fade" role="dialog">
        <div class="modal-dialog"> 
          
          <!-- Modal content-->
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal">&times;</button>
              <h4 class="modal-title">Cambio password</h4>
            </div>
            <div class="modal-body">
              <div class="row">
                <div class="col-lg-12">
                  <div class="form-group has-feedback">
                    <input type="password" class="form-control" placeholder="Vecchia Password" id="oldPwd" name="oldPwd">
                    <span class="glyphicon glyphicon-lock form-control-feedback"></span> </div>
                </div>
                <div class="col-lg-12">
                  <div class="form-group has-feedback">
                    <input type="password" class="form-control" placeholder="Nuova Password" id="newpwd" name="newpwd">
                    <span class="glyphicon glyphicon-lock form-control-feedback"></span> </div>
                </div>
                <div class="col-lg-12">
                  <div class="form-group has-feedback">
                    <input type="password" class="form-control" placeholder="Ripeti Nuova Password" id="newpwd2" name="newpwd2">
                    <span class="glyphicon glyphicon-lock form-control-feedback"></span> </div>
                </div>
              </div>
              <div class="modal-footer">
                <div class="col-lg-3 col-xs-6"> <a class="btn btn-app btn-app-sm" href="javascript:cambiaPwd()"> <i class="fa  fa-key" title="Cambia Password"></i>Cambia Password</a> </div>
                <div class="col-lg-3 col-xs-6">
                  <button type="button" class="btn btn-app btn-app-sm" data-dismiss="modal"><i class="fa  fa-close" title="Close"></i>Close</button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div id="modalPwd2" class="modal fade" role="dialog">
        <div class="modal-dialog"> 
          
          <!-- Modal content-->
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal">&times;</button>
              <h4 class="modal-title">Cambio password Super</h4>
            </div>
            <div class="modal-body">
              <div class="row">
                <div class="col-lg-12">
                  <div class="form-group has-feedback">
                    <input type="password" class="form-control" placeholder="Vecchia Password" id="oldPwdSuper" name="oldPwdSuper">
                    <span class="glyphicon glyphicon-lock form-control-feedback"></span> </div>
                </div>
                <div class="col-lg-12">
                  <div class="form-group has-feedback">
                    <input type="password" class="form-control" placeholder="Nuova Password" id="newpwdSuper" name="newpwdSuper">
                    <span class="glyphicon glyphicon-lock form-control-feedback"></span> </div>
                </div>
                <div class="col-lg-12">
                  <div class="form-group has-feedback">
                    <input type="password" class="form-control" placeholder="Ripeti Nuova Password" id="newpwd2Super" name="newpwd2Super">
                    <span class="glyphicon glyphicon-lock form-control-feedback"></span> </div>
                </div>
              </div>
              <div class="modal-footer">
                <div class="col-lg-3 col-xs-6"> <a class="btn btn-app btn-app-sm" href="javascript:cambiaPwd2()"> <i class="fa  fa-key" title="Cambia Password"></i>Cambia Password</a> </div>
                <div class="col-lg-3 col-xs-6">
                  <button type="button" class="btn btn-app btn-app-sm" data-dismiss="modal"><i class="fa  fa-close" title="Close"></i>Close</button>
                </div>
              </div>
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
  <script language="JavaScript" src="../config/_js/ab-usersCommon.js"></script> 
  <script language="JavaScript" src="../config_RUS/_js/ab-usersApp.js"></script> 
  <!-- InstanceEndEditable --> <!-- InstanceBeginEditable name="extra" --> <!-- InstanceEndEditable --> </acx:if_logon_ok>
<acx:else_logon> gestire il redirect al login </acx:else_logon>  
<!-- InstanceEnd -->