<!-- InstanceBegin template="/Templates/4LTEContent.dwt" codeOutsideHTMLIsLocked="false" -->
<%@page contentType="text/html; charset=UTF-8" %>
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
  <input name="pageTitle" type="hidden" id="pageTitle" value="Documenti - ricerca">
  <jsp:useBean id="list" scope="request" class="it.acxent.util.Vectumerator" type="it.acxent.util.Vectumerator">
  </jsp:useBean>
  <jsp:useBean id="CR" class="it.acxent.contab.DocumentoCR" type="it.acxent.contab.DocumentoCR" scope="request" >
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
          <li class="active"> <a href="javascript:Ab.callAbl('/admin/contabConfig/TipoDocumento','list')"> Nuovo documento </a> </li>
          <li class="active">Elenco documenti</li>
          <!-- InstanceEndEditable -->
        </ol>
      </div>
      <div class="col-lg-4 lastUpdInfo"><!-- InstanceBeginEditable name="lastupdate" --><!-- InstanceEndEditable --></div>
    </div>
    <div class="box box-header">
      <div class="box-body">
        <div class="row">
          <div class="col-lg-8"><!-- InstanceBeginEditable name="toolbar" --><a class="btn btn-app btn-app-sm" href="javascript:Ab.callAbl('/admin/contabConfig/TipoDocumento','list')"> <i class="fa fa-file-o" title="Nuovo Record"></i>Nuovo</a><a class="btn btn-app btn-app-sm" href="javascript:Ab.printW()"> <i class="fa fa-print" title="Stampa Pagina"></i>Stampa</a><a class="btn btn-app btn-app-sm " href="javascript:report()"> <i class="fa fa-bar-chart" title="Report"></i>Report </a> <a class="btn btn-app btn-app-sm" href="javascript:stampaDocumentiCR()"> <i class="fa fa-file-pdf-o" title="Stampa Pdf"></i>Stampa Pdf</a>
            <button type="button" class="btn btn-app btn-app-sm" data-toggle="modal" data-target="#modalMail"><i class="fa fa-envelope-o" aria-hidden="true"></i>Email</button>
            <acx:if wherecondition="<%=CR.getId_tipoDocumento()>0 %>" > <a class="btn btn-app btn-app-sm" href="javascript:pregeneraFatture()"> <i class="fa fa-cog" title="Crea Documenti Figli" ></i>Crea Documento Figlio</a></acx:if>
            <a class="btn btn-app btn-app-sm" href="javascript:annullaDocumentiWeb()"> <i class="fa fa-cog" title="ANNULLA DOCUMENTI WEB VECCHI TEST" ></i>ANNULLA DOC VECCHI TEST</a> <!-- InstanceEndEditable --></div>
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
      <input type="hidden" name="actionPage" id="actionPage" value="../contab/Documento.abl">
      <input name="pageType" type="hidden" id="pageType" value="R">
      <input name="currentTab" type="hidden" id="currentTab" value="<%= CR.getCurrentTab() %>">
      <input name="currentFocus" type="hidden" id="currentFocus" value="<%= CR.getCurrentFocus() %>">
      <acx:parm codice="MAIL_INVIO_DOC">
        <input name="eMailInvio" type="hidden" id="eMailInvio" value="<%=parm.getTesto()%>">
      </acx:parm>
      <input type="hidden" name="id_cliforR" id="id_cliforR">
      <input type="hidden" name="qtaR" id="qtaR">
      <input type="hidden" name="id_documentoR" id="id_documentoR">
      <input type="hidden" name="id_tipoDocumentoF" id="id_tipoDocumentoF">
      <input name="id_documento" id="id_documento" type="hidden">
      <acx:parm codice="MAIL_INVIO_DOC">
        <input name="eMailInvio" type="hidden" id="eMailInvio" value="<%=parm.getTesto()%>">
      </acx:parm>
      <input name="testoAgg" type="hidden" id="testoAgg">
      <input type="hidden" name="flgInvioMailM" id="flgInvioMailM">
      <input name="dummy" type="hidden" id="dummy" >
      <div class="row  hidden-print">
        <div class="col-lg-12">
          <div class="box box-ricerca">
            <div class="box-body">
              <div class="row">
                <div class="col-lg-12 col-xs-12">
                  <acx:if wherecondition="<%=CR.isProgConBuchi(CR.getId_esercizio())%>"><br>
                    <div class="alert alert-danger alert-dismissable">ATTENZIONE! PROTOCOLLO Documento CON BUCHI! <%=CR.trovaPrimoBuco(CR.getId_esercizio())%></div>
                  </acx:if>
                </div>
              </div>
              <div class="row">
                <div class="col-lg-2 col-xs-6 col-inline">
                  <div class="col-lg-12">
                    <label for="txtRicerca">Numero Documento:</label>
                  </div>
                  <div class="col-lg-5 col-md-5 col-sm-5 col-xs-5 col-left">
                    <input type="text" class="form-control  input-sm" name="progDocumento"    value="<%= CR.getProgDocumento() %>"   maxlength="10">
                  </div>
                  <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1 col-left"> / </div>
                  <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 col-rigth">
                    <input type="text" class="form-control  input-sm " name="id_esercizio"  value="<%= CR.getId_esercizio() %>"   maxlength="4">
                  </div>
                </div>
                <div class="col-lg-2 col-xs-6">
                  <label for="txtRicerca">Stato:</label>
                  <br>
                  <select  class="form-control input-sm select2" style="width: 100%;" name="flgStato" id="flgStato" onChange="searching()" >
                    <option value="-1" <%=CR.getFlgStato()==-1?"selected":""%>  >--Tutti--</option>
                    <option value="0" <%=CR.getFlgStato()==0?"selected":""%>  ><%=CR.getStato(0)%></option>
                    <option value="1" <%=CR.getFlgStato()==1?"selected":""%>  ><%=CR.getStato(1)%></option>
                  </select>
                </div>
                <div class="col-lg-2 col-xs-6">
                  <label for="txtRicerca">Tipologia Documento:</label>
                  <br>
                  <select  class="form-control input-sm select2" style="width: 100%;" name="flgTipologia" id="flgTipologia"    onChange="searching()"  >
                    <option <%=CR.getFlgTipologia()==-1?"selected":""  %> value = "-1"  >&nbsp;</option>
                    <option <%=CR.getFlgTipologia()==100?"selected":""  %> value = "100"  ><%=CR.getTipologia(100)%></option>
                    <option <%=CR.getFlgTipologia()==0?"selected":""  %> value = "0"  ><%=CR.getTipologia(0)%></option>
                    <option <%=CR.getFlgTipologia()==1?"selected":""  %> value = "1"  ><%=CR.getTipologia(1)%></option>
                    <option <%=CR.getFlgTipologia()==2?"selected":""  %> value = "2"  ><%=CR.getTipologia(2)%></option>
                    <option <%=CR.getFlgTipologia()==3?"selected":""  %> value = "3"  ><%=CR.getTipologia(3)%></option>
                    <option <%=CR.getFlgTipologia()==4?"selected":""  %> value = "4"  ><%=CR.getTipologia(4)%></option>
                    <option <%=CR.getFlgTipologia()==20?"selected":""  %> value = "20"  ><%=CR.getTipologia(20)%></option>
                    <option <%=CR.getFlgTipologia()==99?"selected":""  %> value = "99"  ><%=CR.getTipologia(99)%></option>
                  </select>
                </div>
                <div class="col-lg-3 col-xs-6">
                  <label for="txtRicerca">Tipo Documento:</label>
                  <br>
                  <select  class="form-control input-sm select2" style="width: 100%;" name="id_tipoDocumento" id="id_tipoDocumento" onChange="searching()" >
                    <acx:optionvec  boundcolumn="id_tipoDocumento" desccolumn="descrizioneCompleta" vectumerator="listaTipoDocumento" value="<%=CR.getId_tipoDocumento()%>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</acx:optionvec>
                  </select>
                </div>
                <div class="col-lg-3 col-xs-6">
                  <label for="txtRicerca">Cliente/Fornitore: </label>
                  <br>
                  <acx:inputajax bean="" boundcolumn="id_clifor" action='<%="/admin/anag/Clifor.abl?searchTxt="%>' 
   nchar="0" returndata=""  nextacion="searching()"
   usesubmit="false" usemono="false" javascriptmodify="" javascriptnew="">
                    <div class="input-group input-group-sm">
                      <input name="nominativoDocumento" type="text" class="form-control input-sm ajSearchText"  id="nominativoDocumento" value="<acx:inputTextFormat><%= CR.getClifor().getDescrizioneCompleta()%></acx:inputTextFormat>"  />
                    </div>
                  </acx:inputajax>
                </div>
              </div>
              <div class="row">
                <div class="col-lg-3 col-xs-6">
                  <label for="txtRicerca">Data Documento da:</label>
                  <br>
                  <small>
                  <input name="dataDocumentoDa" type="text" class="form-control  input-sm datemask" id="dataDocumentoDa" value="<%= df.format(CR.getDataDocumentoDa()) %>"   maxlength="10"  <%=Ab.jsDateInput("dataDocumentoA")%> >
                  </small></div>
                <div class="col-lg-3 col-xs-6">
                  <label for="txtRicerca">Data Documento a:</label>
                  <br>
                  <small>
                  <input type="text" class="form-control  input-sm datemask" id="dataDocumentoA" name="dataDocumentoA"  <%=Ab.jsDateInputS()%>   maxlength="10" value="<%= df.format(CR.getDataDocumentoA()) %>">
                  </small></div>
                <div class="col-lg-3 col-xs-6">
                  <label for="txtRicerca">Mod. di Pagamento: </label>
                  <br>
                  <select  class="form-control input-sm select2" style="width: 100%;" name="id_tipoPagamento" id="id_tipoPagamento" >
                    <acx:optionvec  boundcolumn="id_tipoPagamento" desccolumn="descrizione" vectumerator="listaTipoPagamento" value="<%=CR.getId_tipoPagamento()%>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</acx:optionvec>
                  </select>
                </div>
                <div class="col-lg-3 col-xs-6">
                  <label for="txtRicerca">Pagato:</label>
                  <br>
                  <select  class="form-control input-sm select2" style="width: 100%;" name="flgPagata" id="flgPagata" onChange="searching()"  >
                    <option value="-1" <%=CR.getFlgPagata()==-1?"selected":""%>  >Tutti </option>
                    <option value="0" <%=CR.getFlgPagata()==0?"selected":""%>  >No </option>
                    <option value="1" <%=CR.getFlgPagata()==1?"selected":""%>  >Si </option>
                  </select>
                </div>
              </div>
              <div class="row">
                <div class="col-lg-3 col-xs-6">
                  <label for="txtRicerca">Tipo:</label>
                  <br>
                  <acx:inputajax bean="bean" boundcolumn="id_tipo" action='<%="/admin/artConfig/Tipo.abl?flgSoloFoglie=-1&flgAFT=0&searchTxt="%>' 
   nchar="0" nrow="20" returndata=""  nextacion="applicaListino()"
   usesubmit="false" usemono="false" javascriptmodify="" javascriptnew="">
                    <div class="input-group input-group-sm">
                      <input name="descrizioneTipo" type="text" class="form-control input-sm ajSearchText"  id="descrizioneTipo" value="<%= CR.getTipo().getDescrizioneCompleta()%>"  />
                    </div>
                  </acx:inputajax>
                </div>
                <div class="col-lg-3 col-xs-6">
                  <label for="txtRicerca">Articolo:</label>
                  <br>
                  <input name="id_articoloVariante" type="hidden" id="id_articoloVariante" value="<%=CR.getId_articoloVariante()%>"   readonly>
                  <acx:inputajax bean="" boundcolumn="id_articolo" action='<%="/admin/art/Articolo.abl?flgTipoRicerca=2&searchTxt="%>' 
   nchar="0" nrow="40" returndata="id_articolo,id_articoloVariante,,,searchArticolo"  nextacion=""
   usesubmit="false" usemono="false" javascriptmodify="" javascriptnew="">
                    <div class="input-group input-group-sm">
                      <input name="searchArticolo" type="text" class="form-control input-sm ajSearchText"  id="searchArticolo" value="<acx:inputTextFormat><%= CR.getDescrizioneCompletaArticolo()%></acx:inputTextFormat>"  />
                    </div>
                  </acx:inputajax>
                </div>
                <div class="col-lg-3 col-xs-6">
                  <label for="txtRicerca">Seriale:</label>
                  <br>
                  <small>
                  <input name="seriale" type="text" class="form-control  input-sm" id="seriale"  value="<%= CR.getSeriale() %>"     maxlength="30">
                  </small></div>
                <div class="col-lg-3 col-xs-6">
                  <label for="txtRicerca"> Marca: </label>
                  <br>
                  <acx:inputajax bean="" boundcolumn="id_marca" action='<%="/admin/artConfig/Marca.abl?descrizioneS="%>' 
   nchar="0" returndata=""  nextacion=""
   usesubmit="false" usemono="false" javascriptmodify="" javascriptnew="">
                    <div class="input-group input-group-sm">
                      <input name="descrizioneMarca" type="text" class="form-control input-sm ajSearchText"  id="descrizioneMarca" value="<acx:inputTextFormat><%= CR.getMarca().getDescrizione()%></acx:inputTextFormat>"  />
                    </div>
                  </acx:inputajax>
                </div>
              </div>
              <div class="row">
                <div class="col-lg-3 col-xs-6">
                  <label for="txtRicerca">Riferimento :</label>
                  <br>
                  <input type="text" class="form-control  input-sm" id="riferimento" name="riferimento"   maxlength="14" value="<%= CR.getRiferimento( )%>" >
                </div>
                <div class="col-lg-3 col-xs-6">
                  <label for="txtRicerca">Operatore:</label>
                  <br>
                  <select  class="form-control input-sm select2" style="width: 100%;" name="id_users" id="id_users" onChange="searching()">
                    <acx:optionvec boundcolumn="id_users" desccolumn="descrizione" vectumerator="listaOperatori" value="<%=CR.getId_users()%>"> &nbsp;&nbsp;&nbsp; &nbsp;</acx:optionvec>
                  </select>
                </div>
                <div class="col-lg-3 col-xs-6">
                  <label for="txtRicerca">Stato Doc, prelevato:</label>
                  <br>
                  <select  class="form-control input-sm select2" style="width: 100%;" name="flgDocumentoPrelevato" id="flgDocumentoPrelevato" onChange="searching()"  >
                    <option value="-1" <%=CR.getFlgDocumentoPrelevato()==-1?"selected":""%>  >Tutti </option>
                    <option value="0" <%=CR.getFlgDocumentoPrelevato()==0?"selected":""%>  >Aperto </option>
                    <option value="1" <%=CR.getFlgDocumentoPrelevato()==1?"selected":""%>  >Chiuso </option>
                  </select>
                </div>
                <div class="col-lg-3 col-xs-6"> <a class="btn-search btn btn-app btn-app-sm pull-right" href="javascript:searching()"> <i class="fa fa-search" title="Cerca"></i>Cerca </a> </div>
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
            <div class="box-body " id="no-more-tables">
              <table class="table table-bordered table-hover table-striped dataTable table-condensed">
                <thead>
                  <tr>
                    <th>&nbsp;</th>
                    <th>Numero</th>
                    <th>Data</th>
                    <th>Tipo</th>
                    <th>Intestazione</th>
                    <th>Stato</th>
                    <th>Importo</th>
                    <th>Operatore</th>
                    <th>N.colli</th>
                    <th>Doc. Padre</th>
                    <th>Doc. Figlio</th>
                    <th>Pagamenti</th>
                  </tr>
                </thead>
                <acx:whilevec  rowbeanclass="it.acxent.contab.Documento" vectumerator="list">
                  <tr>
                    <td class="comandi text-center"><div class="inline text-center hidden-print"> <a href="javascript:modifyCommand('<%=rowBean.getId_documento()%>');"><i class="fa fa-edit" title="Modifica Record"></i></a> <a href="javascript:deleteCommandCR('<%=rowBean.getId_documento()%>','<%= rowBean.getLastUpdTmstString() %>');"><i class="fa fa-trash-o" title="Cancella Record"></i></a> </div></td>
                    <td data-title="Numero" <%=!rowBean.isPrelevata()?"style='background-color:#00ff00'":""%>><acx:if wherecondition="<%=rowBean.getFlgStato()==0%>"> <i class="fa fa-circle" aria-hidden="true" style="color: yellow;" title="Documento IN BOZZA"></i> </acx:if>
                      <acx:if wherecondition="<%=!rowBean.hasRigheDocumento()%>"> <i class="fa fa-exclamation-triangle" aria-hidden="true" style="color: red;" title="Documento SENZA righe"></i> </acx:if>
                      <acx:if wherecondition="<%=rowBean.getFlgHasDocumentiPrelevabili()==1%>"> <i class="fa fa-circle" aria-hidden="true" style="color: yellow;" title="ATTENZIONE! Ci sono righe prelevabili"></i> </acx:if>
                      <%= rowBean.getNumeroDocumentoCompleto() %>
                      <acx:if wherecondition="<%=rowBean.getId_tipoDocumento()==1%>"><br>
                        <span class="testoPiccolissimo red"><%=rowBean.getEchoScontrino()%></span>
                        <acx:if wherecondition="<%=rowBean.isUnDocumentoFiglioCreato()%>"><span class="testoPiccolissimo green"><%=rowBean.getDocumentiFigliDesc()%></span></acx:if>
                      </acx:if></td>
                    <td data-title="Data"><%= df.format(rowBean.getDataDocumento()) %></td>
                    <td data-title="Tipo"><%= rowBean.getTipoDocumento().getDescrizione() %></td>
                    <td data-title="Intestazione"><acx:if wherecondition='<%=rowBean.getNominativoDocumento().equals("")%>'> <%= rowBean.getClifor().getDescrizioneCompleta() %></acx:if>
                      <acx:else>Nom. <%= rowBean.getNominativoDocumento() %></acx:else>
                      <acx:if wherecondition='<%=!rowBean.getNote().equals("")%>'><a href="javascript:sweetAlert('<%=rowBean.getNote()%>')"> <i class="fa fa-sticky-note-o" aria-hidden="true" title="<%=rowBean.getNote()%>"></i> </a></acx:if>
                      <acx:if wherecondition='<%=!rowBean.getNotaAggiuntiva().equals("")%>'><a href="javascript:sweetAlert('<%=rowBean.getNotaAggiuntiva()%>')"> <i class="fa fa-comment-o aria-hidden="true" title="<%=rowBean.getNotaAggiuntiva()%>"></i> </a></acx:if></td>
                    <td data-title="Stato"><acx:if wherecondition='<%=rowBean.getTipoDocumento().getFlgTipologia()==1||rowBean.getTipoDocumento().getFlgTipologia()==2||rowBean.getId_tipoDocumento()==rowBean.getId_docOrdineWWW()%>'>
                        <acx:if wherecondition='<%=rowBean.getFlgPagata()==1%>'> <i class="fa fa-check" aria-hidden="true" title="DOCUMENTO PAGATO"></i> </acx:if>
                        <acx:else> <a href="javascript:documentoPagato(<%=rowBean.getId_documento()%>)"> <i class="fa fa-check-square-o" aria-hidden="true" title="IMPOSTA DOCUMENTO PAGATO"></i> </a> </acx:else>
                      </acx:if>
                      <%= rowBean.getStatoCompleto() %>
                      <acx:if wherecondition="<%=rowBean.isDocumentoFiglioCreabile() %>" > <a href="javascript:preCreaDocFiglioCR('<%=rowBean.getId_documento()%>')"> <i class="fa fa-file-text-o" aria-hidden="true" title="Crea Doc. Figli"></i> </a> </acx:if></td>
                    <td data-title="Importo"><%= nf.format(rowBean.getTotaleDocumento()) %></td>
                    <td data-title="Operatore"><%=rowBean.getUsers().getDescrizione()%></td>
                    <td data-title="N.colli"><%= nf.format(rowBean.getNColli() )%></td>
                    <td data-title="Doc. Padre"><%= rowBean.getDocumentiPadreDesc() %></td>
                    <td data-title="Pagamenti"><%= rowBean.getDocumentiFiglioDesc() %></td>
                    <td data-title="Doc. Figlio"><a href="javascript:showPayments(<%=rowBean.getId_documento()%>);"> <i class="fa fa-money" aria-hidden="true"></i> </a>
                      <input type="hidden" value="<%= rowBean.getPagamentiHtml() %>" id="row_<%=rowBean.getId_documento()%>"></td>
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
      
      <!-- Modal -->
      <div id="modalDocFiglio" class="modal fade" role="dialog">
        <div class="modal-dialog"> 
          
          <!-- Modal content-->
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal">&times;</button>
              <h4 class="modal-title">xxx</h4>
            </div>
            <div class="modal-body"> yyy </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
          </div>
        </div>
      </div>
      
      <!-- Modal pagamenti -->
      <div id="modalPagamenti" class="modal fade" role="dialog">
        <div class="modal-dialog"> 
          
          <!-- Modal content-->
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal">&times;</button>
              <h4 class="modal-title">Lista pagamenti</h4>
            </div>
            <div class="modal-body"> </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
          </div>
        </div>
      </div>
      <div id="modalMail" class="modal fade" role="dialog">
        <div class="modal-dialog"> 
          
          <!-- Modal content-->
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal">&times;</button>
              <h4 class="modal-title">Invio Documenti via Email in base ai criteri selezionati</h4>
            </div>
            <div class="modal-body">
              <div class="row">
                <div class="col-lg-6"> <strong>Testo Aggiuntivo:</strong> <br>
                  <textArea   class="form-control input-sm" name="testoAggD" id="testoAggD" rows="5" cols="25"></textarea>
                </div>
                <div class="col-lg-6">
                  <label>Altro indirizzo email </label>
                  <acx:parm codice="MAIL_INVIO_DOC">
                    <input name="eMailInvioDiv"  class="form-control input-sm" type="text" id="eMailInvioDiv" value="<%=parm.getTesto()%>">
                  </acx:parm>
                  <br>
                  <a class="btn btn-app btn-app-sm" href="javascript:mailCommandExtCR()"> <i class="fa  fa-envelope-o" title="INVIA ad altra email"></i>INVIA ad altra email</a> </div>
              </div>
            </div>
            <div class="modal-footer">
              <div class="col-lg-6">
                <label>Invia fatture anche se gia' inviate: </label>
                <input type="checkbox" class="minimal"  name="ckflgInvioMailDiv" id="ckflgInvioMailDiv" >
                <input name="flgInvioMailDiv" type="hidden" id="flgInvioMailDiv" value="">
              </div>
              <div class="col-lg-3 col-xs-6"> <a class="btn btn-app btn-app-sm" href="javascript:mailCommandCliForCR()"> <i class="fa  fa-envelope-o" title="INVIA ad Email Intestatari"></i>INVIA ad Email Intestatari</a> </div>
              <div class="col-lg-3 col-xs-6">
                <button type="button" class="btn btn-app btn-app-sm" data-dismiss="modal"><i class="fa  fa-close" title="Close"></i>Close</button>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="dummyCreaDoc"> </div>
      <!-- InstanceEndEditable -->
    </form>
  </section>
  <!-- SCRIPT DI RESET --> 
  <script language="JavaScript" src="../_V4/_js/_reset.js"></script> 
  <!-- InstanceBeginEditable name="js-pagina" --> 
  <!-- SCRIPT PERSONALIZZATI DELLA PAGINA --> 
  <script language="JavaScript" src="../contab/_js/ab-documento.js"></script> 
  <script language="JavaScript" src="../contab/_js/ab-documentiFigli.js"></script> 
  <!-- InstanceEndEditable --> <!-- InstanceBeginEditable name="extra" --> <!-- InstanceEndEditable --> </acx:if_logon_ok>
<acx:else_logon> gestire il redirect al login </acx:else_logon>
<!-- InstanceEnd -->