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
  <!--  pagine di dettaglio -->
  <jsp:useBean id="bean" class="it.acxent.contab.Documento" type="it.acxent.contab.Documento" scope="request" >
  </jsp:useBean>
  <jsp:useBean id="listaPagamenti" class="it.acxent.util.Vectumerator" type="it.acxent.util.Vectumerator" scope="request" >
  </jsp:useBean>
  <%@ page import="it.acxent.contab.*" %>
  <jsp:useBean id="nf4" scope="request" type="java.text.NumberFormat" >
  </jsp:useBean>
  <jsp:useBean id="bean2" class="it.acxent.contab.RigaDocumento" type="it.acxent.contab.RigaDocumento" scope="request" >
  </jsp:useBean>
  <jsp:useBean id="listaRigheDocumento" scope="request" class="it.acxent.util.Vectumerator" type="it.acxent.util.Vectumerator">
  </jsp:useBean>
  <jsp:useBean id="listaRigheDocumentoPrelevabili" scope="request" class="it.acxent.util.Vectumerator" type="it.acxent.util.Vectumerator">
  </jsp:useBean>
  <jsp:useBean id="listaDocPadri" scope="request" class="it.acxent.util.Vectumerator" type="it.acxent.util.Vectumerator">
  </jsp:useBean>
  <jsp:useBean id="listaDocFigli" scope="request" class="it.acxent.util.Vectumerator" type="it.acxent.util.Vectumerator">
  </jsp:useBean>
  <jsp:useBean id="listaCorri" scope="request" class="it.acxent.util.Vectumerator" type="it.acxent.util.Vectumerator">
  </jsp:useBean>
  <jsp:useBean id="listaAgenti" scope="request" class="it.acxent.util.Vectumerator" type="it.acxent.util.Vectumerator">
  </jsp:useBean>
  
  <!--  pagine di ricerca -->
  <input name="pageTitle" type="hidden" id="pageTitle" value="<%=bean.getTipoDocumento().getDescrizione()%>">
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
          <li><a href="javascript:Ab.callAbl('/admin/contabConfig/TipoDocumento','list')">Nuovo documento</a></li>
          <li><a href="javascript:Ab.callAbl('/admin/contab/Documento',null,null,'back')">Elenco documenti</a> /
            <acx:if wherecondition="<%=bean.getTipoDocumento().getFlgTipologia()==TipoDocumento.TIPOLOGIA_PRENOTAZIONE%>"><a href="javascript:Ab.callAbl('/admin/contab/DocumentoPre','search','back','id=9&pageNumber=1')">Elenco prenotazioni</a> </acx:if>
            <acx:else><a href="javascript:Ab.callAbl('/admin/contab/Documento','search','back','id_tipoDocumento=<%=bean.getId_tipoDocumento()%>&pageNumber=1')">Elenco <%=bean.getTipoDocumento().getCodice()%></a></acx:else>
            - <a href="javascript:Ab.callAbl('/admin/contab/Movimento',null,null,'back')">Movimenti</a></li>
          <li class="active"><%=bean.getTipoDocumento().getDescrizione()%></li>
          <!-- InstanceEndEditable -->
        </ol>
      </div>
      <div class="col-lg-3 lastUpdInfo"><!-- InstanceBeginEditable name="lastupdate" --> <%=bean.getLastUpdInfo()%> <!-- InstanceEndEditable --></div>
    </div>
    <div class="box box-header">
      <div class="box-body">
        <div class="row">
          <div class="col-lg-8"><!-- InstanceBeginEditable name="toolbar" --> <a class="btn btn-app btn-app-sm" href="javascript:newCommandPD()"> <i class="fa fa-file-o" title="Nuovo Record"></i>Nuovo</a><a class="btn btn-app btn-app-sm" href="javascript:saveCommand()"> <i class="fa fa-floppy-o" title="Salva Record"></i>Salva</a>
            <acx:if wherecondition="<%=bean.isDocumentoFiglioCreabile() %>" > <a class="btn btn-app btn-app-sm" href="javascript:creaDocFiglioD()"> <i class="fa fa-cog" title="Crea Documento Figlio" ></i>Crea Documento Figlio</a></acx:if>
            <a class="btn btn-app btn-app-sm" href="javascript:printCommand()"> <i class="fa fa-print" title="Stampa"></i>Stampa</a> <a class="btn btn-app btn-app-sm" href="javascript:labelAccD()"> <i class="fa fa-print" title="Stampa"></i>Stampa Compatibilita'</a> <a class="btn btn-app btn-app-sm" href="javascript:labelD()"> <i class="fa fa-print" title="Stampa"></i>Stampa Cod. barre</a> <a class="btn btn-app btn-app-sm" href="javascript:stampaEtichettePackingList()"> <i class="fa fa-print" title="Stampa"></i>Packing List</a><a class="btn btn-app btn-app-sm" href="javascript:deleteCommand()"> <i class="fa  fa-trash-o" title="Cancella Record"></i>Elimina</a>
            <acx:if wherecondition="<%=bean.isOrdineWww()%>"><a class="btn btn-app btn-app-sm" href="javascript:mailCommandWeb()"> <i class="fa  fa-at" title="Cancella Record"></i>Mail Ordine www </a></acx:if>
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
      <input type="hidden" name="actionPage" id="actionPage" value="../contab/Documento.abl">
      <input name="pageType" type="hidden" id="pageType" value="D">
      <input name="lastUpdTmst" id="lastUpdTmst" type="hidden" value="<%= bean.getLastUpdTmstString() %>">
      <input name="currentTab" type="hidden" id="currentTab" value="<%= bean.getCurrentTab() %>">
      <input name="currentFocus" type="hidden" id="currentFocus" value="<%= bean.getCurrentFocus() %>">
      <input type="hidden" id="dummy"  name="dummy" maxlength="" size="4" >
      <input type="hidden" name="id_cliforR" id="id_cliforR">
      <input type="hidden" name="id_documentoR" id="id_documentoR">
      <input type="hidden" name="id_articoloR" id="id_articoloR">
      <input type="hidden" name="qtaR" id="qtaR">
      <input type="hidden" name="id_rigaDocumentoR" id="id_rigaDocumentoR">
      <input type="hidden" name="id_articoloVarianteRV" id="id_articoloVarianteRV">
      <input type="hidden" name="qtaArticoloVarianteRV" id="qtaArticoloVarianteRV">
      <input type="hidden" name="id_tipoDocumentoF" id="id_tipoDocumentoF">
      <input type="hidden" name="eMail" value="<%=bean.getClifor().getEMail()%>">
      <input type="hidden" id="id_documento"  name="id_documento" maxlength="" size="4" value="<%=bean.getId_documento()%>">
      <input type="hidden" id="id_tipoDocumento"  name="id_tipoDocumento" maxlength="" size="4" value="<%=bean.getId_tipoDocumento()%>">
      <input name="flgClienteFornitore" type="hidden" id="flgClienteFornitore" value="<%=bean.getTipoDocumento().getFlgClienteFornitore()%>">
      <input name="flgTipoStampa" type="hidden" id="flgTipoStampa" value="<%=bean.getTipoDocumento().getFlgTipoStampa()%>">
      <input name="totDocumento" type="hidden" id="totDocumento" value="<%= nf.format(bean.getTotaleDocumento()) %>">
      <acx:parm codice="MAIL_INVIO_DOC">
        <input name="eMailInvio" type="hidden" id="eMailInvio" value="<%=parm.getTesto()%>">
      </acx:parm>
      <input name="flgTipologia" type="hidden" id="flgTipologia" value="<%=bean.getTipoDocumento().getFlgTipologia()%>">
      <input name="tipoCaricoScarico" type="hidden" id="tipoCaricoScarico" value="<%=bean.getTipoCaricoScarico()%>">
      <input name="testoAgg" type="hidden" id="testoAgg">
      <input type="hidden" id="magArrivoDaScegliere" name="magArrivoDaScegliere" maxlength="" size="4" value="<%=bean.getTipoDocumento().getCausaleMagazzino().isMagArrivoDaScegliere()%>">
      <input type="hidden" id="magPartenzaDaScegliere" name="magPartenzaDaScegliere" maxlength="" size="4" value="<%=bean.getTipoDocumento().getCausaleMagazzino().isMagPartenzaDaScegliere()%>">
      
      <!-- dettaglio -->
      <div class="row">
        <div class="col-lg-12">
          <div class="box box-dettaglio">
            <div class="box-body">
             <div class="row">
                <div class="col-lg-12 col-xs-12">
                  <acx:if wherecondition="<%=bean.isProgConBuchi(bean.getId_esercizio())%>"><br>
                    <div class="alert alert-danger alert-dismissable">ATTENZIONE! PROTOCOLLO Documento CON BUCHI! <%=bean.trovaPrimoBuco(bean.getId_esercizio())%></div></acx:if>
                  
                </div>
              </div>
              <div class="row">
                <div class="col-lg-4 col-xs-12 form-inline">
                  <div class="form-group">
                    <label for="descrizione">Numero Documento <font size="-2">(<%= bean.getId_documento() %>-<%= bean.getProgDocumento() %>)</font>:</label>
                    <br>
                    <select name="flgStato" id="flgStato" class="form-control input-sm">
                      <option value="0" <%=bean.getFlgStato()==0?"selected":""%>  ><%=bean.getStato(0)%> </option>
                      <option value="1" <%=bean.getFlgStato()==1?"selected":""%>  ><%=bean.getStato(1)%> </option>
                    </select>
                    <%=bean.getTipoDocumento().getCodice()%>
                    <input type="text" name="progDocumento"  id="progDocumento" value="<%= bean.getProgDocumento() %>" maxlength="4" size="6" class="form-control input-sm">
                    -
                    <input name="progDocumentoAgg" id="progDocumentoAgg"  type="text"   value="<%= bean.getProgDocumentoAgg() %>" size="6" maxlength="6" class="form-control input-sm">
                    /
                    <input name="id_esercizio" id="id_esercizio" readonly type="text" class="form-control input-sm" value="<%= bean.getId_esercizio() %>" maxlength="4" size="4">
                    <%=bean.getFlgStato()%> </div>
                </div>
                <div class="col-lg-2 col-xs-6">
                  <label for="descrizione">Data:</label>
                  <br>
                 
                    <input type="text" class="form-control input-sm datemask" id="dataDocumento" name="dataDocumento"  maxlength="10" value="<%= df.format(bean.getDataDocumento()) %>" >
                   
                </div>
                <div class="col-lg-2 col-xs-6">
                  <acx:if wherecondition="<%=bean.getId_tipoDocumento()==bean.getId_docOrdineWWW()%>">
                    <label for="descrizione">Procedi Con il pag.:</label>
                    <br>
                    <select name="flgProcediPagamento" id="flgProcediPagamento" class="form-control input-sm">
                      <option value="0" <%=bean.getFlgProcediPagamento()==0?"selected":""%>  >No </option>
                      <option value="1" <%=bean.getFlgProcediPagamento()==1?"selected":""%>  >Si </option>
                    </select>
                  </acx:if>
                  <acx:else> &nbsp; </acx:else>
                </div>
                <div class="col-lg-2 col-xs-6">
                  <label>Mag. Partenza:</label>
                  <br>
                  <input type="hidden" id="isMagPartenza" name="isMagPartenza" value="<%=bean.getTipoDocumento().getCausaleMagazzino().isMagPartenza()%>">
                  <acx:if wherecondition="<%= bean.getTipoDocumento().getCausaleMagazzino().isMagPartenzaDaScegliere() %>">
                    <select name="id_magFisicoPartenza" <%=bean.hasRigheDocumento()?"disabled":""%>  id="id_magFisicoPartenza" class="form-control input-sm">
                      <acx:optionvec  boundcolumn="id_magFisico" desccolumn="descrizione" vectumerator="listaMagPartenza" value="<%=bean.getId_magFisicoPartenza()==0?bean.getTipoDocumento().getCausaleMagazzino().getId_magFisicoPartenza():bean.getId_magFisicoPartenza() %>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</acx:optionvec>
                    </select>
                  </acx:if>
                  <acx:else>
                    <input type="hidden" id="id_magFisicoPartenza" name="id_magFisicoPartenza" value="<%=bean.getId_magFisicoPartenza()==0?bean.getTipoDocumento().getCausaleMagazzino().getId_magFisicoPartenza():bean.getId_magFisicoPartenza()  %>" class="form-control input-sm">
                    <b><%=bean.getId_magFisicoPartenza()==0?bean.getTipoDocumento().getCausaleMagazzino().getMagFisicoPartenza().getDescrizioneCompleta():bean.getMagFisicoPartenza().getDescrizioneCompleta()  %></b> </acx:else>
                </div>
                <div class="col-lg-2 col-xs-6">
                  <label>Mag. Arrivo:</label>
                  <br>
                  <input type="hidden" id="isMagArrivo" name="isMagArrivo" value="<%=bean.getTipoDocumento().getCausaleMagazzino().isMagArrivo()%>">
                  <acx:if wherecondition="<%= bean.getTipoDocumento().getCausaleMagazzino().isMagArrivoDaScegliere() %>">
                    <select name="id_magFisicoArrivo" <%=bean.hasRigheDocumento()?"disabled":""%>  id="id_magFisicoArrivo" class="form-control input-sm">
                      <acx:optionvec  boundcolumn="id_magFisico" desccolumn="descrizione" vectumerator="listaMagArrivo" value="<%=bean.getId_magFisicoArrivo()==0?bean.getTipoDocumento().getCausaleMagazzino().getId_magFisicoArrivo():bean.getId_magFisicoArrivo()%>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</acx:optionvec>
                    </select>
                  </acx:if>
                  <acx:else>
                    <input type="hidden" id="id_magFisicoArrivo" name="id_magFisicoArrivo" value="<%=bean.getId_magFisicoArrivo()==0?bean.getTipoDocumento().getCausaleMagazzino().getId_magFisicoArrivo():bean.getId_magFisicoArrivo()  %>" class="form-control input-sm">
                    <b><%=bean.getId_magFisicoArrivo()==0?bean.getTipoDocumento().getCausaleMagazzino().getMagFisicoArrivo().getDescrizioneCompleta():bean.getMagFisicoArrivo().getDescrizioneCompleta()  %></b> </acx:else>
                  <input type="hidden" id="flgTipoMagazzinoFisico" name="flgTipoMagazzinoFisico" value="<%=bean.getTipoDocumento().getCausaleMagazzino().getMagFisicoPartenza().getFlgTipo()==3 || bean.getTipoDocumento().getCausaleMagazzino().getMagFisicoArrivo().getFlgTipo()==3?1:0 %>" class="form-control input-sm">
                </div>
              </div>
              <div class="row">
                <div class="col-lg-4 form-inline">
                  <div class="form-group">
                    <label>Pagata:</label>
                    <br>
                    <acx:if wherecondition="<%=bean.getTipoDocumento().getFlgTipologia()==1%>">
                      <select name="flgPagata" id="flgPagata" class="form-control input-sm">
                        <option value="0" <%=bean.getFlgPagata()==0?"selected":""%>  >No </option>
                        <option value="1" <%=bean.getFlgPagata()==1?"selected":""%>  >Si </option>
                      </select>
                      il
                     
                        <input type="text" class="form-control input-sm datemask" id="dataPagamento" name="dataPagamento"  maxlength="10" value="<%= df.format(bean.getDataPagamento()) %>" >
                       
                    </acx:if>
                    <acx:else>---</acx:else>
                  </div>
                </div>
                <div class="col-lg-2 col-xs-6">
                  <div class="form-group">
                    <label>Stato prelev. doc.:</label>
                    <br>
                    <acx:if wherecondition="<%=bean.getTipoDocumento().getFlgTipoDocumentoPrelevabile()==1%>">
                      <select name="flgDocumentoPrelevato" id="flgDocumentoPrelevato" class="form-control input-sm">
                        <option value="0" <%=bean.getFlgDocumentoPrelevato()==0?"selected":""%>  >Aperto </option>
                        <option value="1" <%=bean.getFlgDocumentoPrelevato()==1?"selected":""%>  >Chiuso </option>
                      </select>
                    </acx:if>
                    <acx:else>---</acx:else>
                  </div>
                </div>
                <div class="col-lg-2 col-xs-6"> &nbsp; </div>
                <div class="col-lg-2 col-xs-6">
                  <label>Stato prenotazione:</label>
                  <br>
                  <acx:if wherecondition="<%=bean.getTipoDocumento().getFlgTipologia()==4%>">
                    <select name="flgStatoPrenotazione" id="flgStatoPrenotazione" class="form-control input-sm">
                      <option value="0" <%=bean.getFlgStatoPrenotazione()==0?"selected":""%>  ><%=bean.getStatoPrenotazione(0)%> </option>
                      <option value="10" <%=bean.getFlgStatoPrenotazione()==10?"selected":""%>  ><%=bean.getStatoPrenotazione(10)%> </option>
                      <option value="20" <%=bean.getFlgStatoPrenotazione()==20?"selected":""%>  ><%=bean.getStatoPrenotazione(20)%> </option>
                      <option value="30" <%=bean.getFlgStatoPrenotazione()==30?"selected":""%>  ><%=bean.getStatoPrenotazione(30)%> </option>
                      <option value="90" <%=bean.getFlgStatoPrenotazione()==90?"selected":""%>  ><%=bean.getStatoPrenotazione(90)%> </option>
                      <option value="100" <%=bean.getFlgStatoPrenotazione()==100?"selected":""%>  ><%=bean.getStatoPrenotazione(100)%> </option>
                    </select>
                  </acx:if>
                  <acx:else>---</acx:else>
                </div>
                <div class="col-lg-2 col-xs-6">
                  <acx:if wherecondition="<%=bean.getId_tipoDocumento()==9 || bean.getId_tipoDocumento()==13 || bean.getId_tipoDocumento()==5%>">
                    <label>Operatore:</label>
                    <br>
                    <select name="id_users" id="id_users" class="form-control input-sm">
                      <acx:optionvec  boundcolumn="id_users" desccolumn="cognomeNome" vectumerator="listaOperatori" value="<%=bean.getId_users()%>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</acx:optionvec>
                    </select>
                  </acx:if>
                </div>
              </div>
              <acx:if wherecondition="<%=bean.getId_tipoDocumento()==bean.getId_docOrdineWWW()%>">
                <div class="row">
                  <div class="col-lg-2 col-xs-6">
                    <label>Stato Ordine Web:</label>
                    <br>
                    <select name="flgStatoOrdineWww" id="flgStatoOrdineWww" class="form-control input-sm">
                      <option value="0" <%=bean.getFlgStatoOrdineWww()==0?"selected":""%>  ><%=bean.getStatoOrdineWww(0)%> </option>
                      <option value="1" <%=bean.getFlgStatoOrdineWww()==1?"selected":""%>  ><%=bean.getStatoOrdineWww(1)%> </option>
                      <option value="2" <%=bean.getFlgStatoOrdineWww()==2?"selected":""%>  ><%=bean.getStatoOrdineWww(2)%> </option>
                      <option value="9" <%=bean.getFlgStatoOrdineWww()==9?"selected":""%>  ><%=bean.getStatoOrdineWww(9)%> </option>
                      <option value="99" <%=bean.getFlgStatoOrdineWww()==99?"selected":""%>  ><%=bean.getStatoOrdineWww(99)%> </option>
                      </option>
                    </select>
                  </div>
                  <div class="col-lg-2 col-xs-6">
                    <label>Transazione CC:</label>
                    <br>
                    <input name="descTransaction"  type="text"  id="descTransaction" value="<%= bean.getDescTransaction() %>" size="10" maxlength="10" class="form-control input-sm">
                  </div>
                  <div class="col-lg-2 col-xs-6">
                    <label>Data Transazione CC:</label>
                    <br>
                    <div class="input-group">
                      <input type="text" class="form-control input-sm datemask" id="dataTransaction" name="dataTransaction"  maxlength="10" value="<%= df.format(bean.getDataTransaction()) %>" >
                      <div class="input-group-addon"> <i class="fa fa-calendar"></i> </div>
                    </div>
                  </div>
                  <div class="col-lg-2 col-xs-6">
                    <label for="descrizione">Richiedi Fattura www:</label>
                    <br>
                    <select name="flgWwwRichiedeFattura" id="flgWwwRichiedeFattura" class="form-control input-sm">
                      <option value="0" <%=bean.getFlgWwwRichiedeFattura()==0?"selected":""%>  >No </option>
                      <option value="1" <%=bean.getFlgWwwRichiedeFattura()==1?"selected":""%>  >Si </option>
                    </select>
                  </div>
                  <div class="col-lg-4 col-xs-12">
                    <label for="descrizione">Link diretto sito ecommerce per il pagamento:</label>
                    <br>
                    <a href="<%=bean.getLinkOrdineWww()%>"><%=bean.getLinkOrdineWww()%></a>
                  </div>
                </div>
              </acx:if>
            
              <acx:if wherecondition="<%=bean.getTipoDocumento().getFlgTipologia()!=99%>">
                <div class="row">
                   <div class="col-lg-6 col-xs-6">
                     <label><%=bean.getTipoDocumento().getClienteFornitore()%>:</label>
                    <br>
                    <acx:inputajax bean="bean" boundcolumn="id_clifor" action='<%="/admin/anag/Clifor.abl?flgCF="+bean.getTipoDocumento().getFlgClienteFornitore()+"&searchTxt="%>' 
   nchar="0" returndata="indirizzoClifor,id_tipoPagamento,banca,iban,,,,telDocumento,cellDocumento,eMailDocumento,,,id_tipoPagamento"  nextacion="applicaListino()"
   usesubmit="false" usemono="false" javascriptmodify="modificaCliente()" javascriptnew="nuovoCliente()">
                      <div class="input-group input-group-sm">
                        <input name="nominativoDocumento" type="text" class="form-control input-sm ajSearchText"  id="nominativoDocumento" value="<acx:inputTextFormat><%= bean.getNominativoDocumento()%></acx:inputTextFormat>"  />
                       </div>
                    </acx:inputajax>
                  </div>
                  
                  <div class="col-lg-6 col-xs-6" style="padding-top: 10px;">
                    <textarea name="indirizzoClifor" cols="60" rows="2" readonly style="background-color:#CCCCCC;border-style:none;font-size:12px;width:100%;" id="indirizzoClifor" class="form-control input-sm"><%= bean.getClifor().getIndirizzoCompleto() %></textarea>
                  </div>
                </div>
              </acx:if>
              <acx:else>
                <input readonly name="id_clifor" type="hidden" id="id_clifor" value="1" size="3" maxlength="30" />
                <div class="row">
                  <div class="col-lg-12">
                    <div class="form-group"> Documento generico: <strong><%=bean.getTipoDocumento().getDescrizione()%></strong> - <%=bean.getId_clifor()%> </div>
                  </div>
                </div>
              </acx:else>
              <acx:if wherecondition='<%=listaDocPadri.hasMoreElements()%>'>
                <div class="row">
                  <div class="col-lg-12">
                    <div class="form-group">
                      <label>Documenti padri correlati:</label>
                      <br>
                      <acx:whilevec   rowbeanclass="it.acxent.contab.Documento" vectumerator="listaDocPadri"> <strong><a href="javascript:Ab.callAbl('/admin/contab/Documento','md',null,'id_documento=<%=rowBean.getId_documento()%>')"><%=rowBean.getNumeroDocumentoCompleto()%></a></strong> </acx:whilevec>
                    </div>
                  </div>
                </div>
              </acx:if>
              <acx:if wherecondition='<%=listaDocFigli.hasMoreElements()%>'>
                <div class="row">
                  <div class="col-lg-12">
                    <div class="form-group">
                      <label>Documenti figlio correlati:</label>
                      <br>
                      <acx:whilevec   rowbeanclass="it.acxent.contab.Documento" vectumerator="listaDocFigli"> <strong><a href="javascript:Ab.callAbl('/admin/contab/Documento','md',null,'id_documento=<%=rowBean.getId_documento()%>')"><%=rowBean.getNumeroDocumentoCompleto()%></a></strong></acx:whilevec>
                    </div>
                  </div>
                </div>
              </acx:if>
              <div class="row tabs">
                <div class="col-lg-12"> 
                  <!-- Custom Tabs -->
                  <div class="nav-tabs-custom">
                    <ul class="nav nav-tabs" id="tabs">
                      <li class="active"><a href="#TESTA" data-toggle="tab">Testata</a></li>
                      <acx:if wherecondition="<%=bean.getTipoDocumento().getFlgAFT()==0%>">
                        <li><a href="#RIGHE" data-toggle="tab">Righe</a></li>
                      </acx:if>
                      <acx:if wherecondition="<%=bean.getTipoDocumento().getFlgAFT()==1%>">
                        <li><a href="#RIGHEF" data-toggle="tab">Righe Filati</a></li>
                      </acx:if>
                      <acx:if wherecondition="<%=bean.getTipoDocumento().getFlgAFT()==2%>">
                        <li><a href="#RIGHET" data-toggle="tab">Righe Tessuti</a></li>
                      </acx:if>
                      <acx:if wherecondition='<%=bean.getTipoCaricoScarico()==0%>'>
                        <li ><a href="#SERIALI" data-toggle="tab">Seriali</a></li>
                      </acx:if>
                      <li><a href="#PIEDE" data-toggle="tab">Piede</a></li>
                      <li ><a href="#RIEP" data-toggle="tab">Riepilogo</a></li>
                      <li><a href="#NOTE" data-toggle="tab">Note</a></li>
                      <acx:if wherecondition="<%=bean.getTipoDocumento().hasDocPrel()%>">
                        <li ><a href="#PREL" data-toggle="tab">Preleva documenti</a></li>
                      </acx:if>
                      <acx:if wherecondition="<%=bean.getTipoDocumento().getFlgAllegato()==1%>">
                        <li><a href="#ALLEGATI" data-toggle="tab">Allegati</a></li>
                      </acx:if>
                      <acx:if wherecondition="<%=bean.getTipoDocumento().getFlgTipologia()==4%>">
                        <li ><a href="#AVVISI" data-toggle="tab">Avvisi</a></li>
                      </acx:if>
                      <li ><a href="#AGE" data-toggle="tab">Agenti</a></li>
                      <li ><a href="#PROG" data-toggle="tab">Progettisti</a></li>
                      <li><a href="#PAG" data-toggle="tab">Pagamenti</a></li>
                      <li><a href="#SCAD" data-toggle="tab">Scadenze</a></li>
                    
                    </ul>
                    <div class="tab-content">
                      <div class="tab-pane active" id="TESTA">
                        <jsp:include page="_inc_documento_testa.jsp" flush="true" />
                      </div>
                      <acx:if wherecondition="<%=bean.getTipoDocumento().getFlgAFT()==0%>">
                        <div class="tab-pane" id="RIGHE">
                          <jsp:include page="_inc_documento_righe.jsp" flush="true" />
                        </div>
                      </acx:if>
                      <acx:if wherecondition="<%=bean.getTipoDocumento().getFlgAFT()==1%>">
                        <div class="tab-pane" id="RIGHEF">
                          <jsp:include page="_inc_documento_righeFilato.jsp" flush="true" />
                        </div>
                      </acx:if>
                      <acx:if wherecondition="<%=bean.getTipoDocumento().getFlgAFT()==2%>">
                        <div class="tab-pane" id="RIGHET">
                          <jsp:include page="_inc_documento_righeTessuto.jsp" flush="true" />
                        </div>
                      </acx:if>
                      <div class="tab-pane " id="SERIALI">  <jsp:include page="_inc_documento_seriali.jsp" flush="true" /> </div>
                      <div class="tab-pane" id="PIEDE">
                        <jsp:include page="_inc_documento_piede.jsp" flush="true" />
                      </div>
                      <div class="tab-pane " id="RIEP">
                        <jsp:include page="_inc_documento_riep.jsp" flush="true" />
                      </div>
                      <div class="tab-pane" id="NOTE">
                        <jsp:include page="_inc_documento_note.jsp" flush="true" />
                      </div>
                      <div class="tab-pane " id="PREL">  <jsp:include page="_inc_documento_prelevamenti.jsp" flush="true" /></div>
                      <div class="tab-pane" id="ALLEGATI"> </div>
                      <div class="tab-pane " id="AVVISI"> 
                       <jsp:include page="_inc_documento_avvisi.jsp" flush="true" /></div>
                      <div class="tab-pane" id="AGE">   <jsp:include page="_inc_documento_agenti.jsp" flush="true" /></div>
                       <div class="tab-pane" id="PROG">   <jsp:include page="_inc_documento_progettisti.jsp" flush="true" /></div>
                      <div class="tab-pane " id="PAG"> </div>
                      <div class="tab-pane " id="SCAD">
                        <jsp:include page="_inc_documento_scadenze.jsp" flush="true" />
                      </div>
                     
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      </div>
      </div>
      <div id="myModal"  class="modal fade" role="dialog"> </div>
      <!-- InstanceEndEditable -->
    </form>
  </section>
  <!-- SCRIPT DI RESET --> 
  <script language="JavaScript" src="../_V4/_js/_reset.js"></script> 
  <!-- InstanceBeginEditable name="js-pagina" --> 
  <!-- SCRIPT PERSONALIZZATI DELLA PAGINA --> 
  <!-- InstanceEndEditable --> <!-- InstanceBeginEditable name="extra" -->
  <jsp:include page="../anag/_inc_cliforE.jsp" flush="true"></jsp:include>
  <script src="../contab/_js/ab-documento.js"></script> 
  <script src="../contab/_js/ab-documentoFilato.js"></script> 
  <script src="../contab/_js/ab-documentoTessuto.js"></script> 
  <script src="../contab/_js/ab-documentiFigli.js"></script> 
  <!-- InstanceEndEditable --> </acx:if_logon_ok>
<acx:else_logon> gestire il redirect al login </acx:else_logon>
<!-- InstanceEnd -->