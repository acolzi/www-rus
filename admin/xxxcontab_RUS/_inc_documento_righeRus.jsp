<%@ taglib uri="/WEB-INF/acxent.tld" prefix="acx" %>
<%@ page language="java" import="it.acxent.jsp.*" %>
<%-- DICHIARAZIONE BEAN --%>
<jsp:useBean id="bean" class="it.acxent.contab.Documento" type="it.acxent.contab.Documento" scope="request" >
</jsp:useBean>
<jsp:useBean id="df" class="it.acxent.util.SimpleDateFormat" scope="request" type="it.acxent.util.SimpleDateFormat" >
</jsp:useBean>
<jsp:useBean id="nf" scope="request" type="java.text.NumberFormat" >
</jsp:useBean>
<jsp:useBean id="nf4" scope="request" type="java.text.NumberFormat" >
</jsp:useBean>
<jsp:useBean id="bean2" class="it.acxent.contab.RigaDocumento" type="it.acxent.contab.RigaDocumento" scope="request" >
</jsp:useBean>
<jsp:useBean id="listaRigheDocumento" scope="request" class="it.acxent.util.Vectumerator" type="it.acxent.util.Vectumerator">
</jsp:useBean>
<jsp:useBean id="CR2" class="it.acxent.contab.RigaDocumentoCR" type="it.acxent.contab.RigaDocumentoCR" scope="request" >
</jsp:useBean>
<%-- FINE DICHIARAZIONE BEAN --%>

<input type="hidden" id="tipoCaricoScarico" name="tipoCaricoScarico" value="<%=bean.getTipoCaricoScarico()%>" >
<input type="hidden" id="flgKg"  name="flgKg" value="<%= bean2.getArticolo().getTipologiaArticolo().getFlgKg() %>" onChange="disAttivaUDM()">
<input type="hidden" id="flgMt"  name="flgMt"  value="<%= bean2.getArticolo().getTipologiaArticolo().getFlgMt() %>" onChange="disAttivaUDM()">
<input type="hidden" id="flgNr"  name="flgNr"  value="<%= bean2.getArticolo().getTipologiaArticolo().getFlgNr() %>" onChange="disAttivaUDM()">
<input type="hidden" id="flgUdmTA"  name="flgUdmTA"value="<%= bean2.getArticolo().getTipologiaArticolo().getFlgUdm() %>" onChange="disAttivaUDM()">
<input type="hidden" id="isCaricoIva"  name="isCaricoIva"  value="<%= bean.isCaricoConIva() %>">
<input name="id_articolo" type="hidden" id="id_articolo" value="<%=bean2.getId_articolo()%>" readonly>
<input name="id_articoloVariante" type="hidden" id="id_articoloVariante" value="<%=bean2.getId_articoloVariante()%>" readonly>
<input name="id_articoloTaglia" type="hidden" id="id_articoloTaglia" value="<%=bean2.getId_articoloTaglia()%>" readonly> <input type="hidden" name="pageNumber_righe" id="pageNumber_righe" value="<%=listaRigheDocumento.getPageNumber()%>">
    <input type="hidden" name="totPageNumber_righe" id="totPageNumber_righe" value="<%=listaRigheDocumento.getTotNumberOfPages()%>">
    <input type="hidden" name="flgRfIncasso" >
    <input name="id_rigaDocumento" type="hidden" value="<%=bean2.getId_rigaDocumento()%>">
    <input type="hidden" name="qtaSlipStampate" id="qtaSlipStampate" value="<%=bean2.getQtaSlipStampate()%>">
<input type="text" id="tipologiaArticolo" class="form-control  input-sm"  name="tipologiaArticolo"  style="outline:none; border:none; height: 0px; padding: 0; margin: 0;" value="<%= bean2.getArticolo().getTipologiaArticolo().getDescrizione() %>" onChange="disAttivaUDM()">
<div class="row">

  <div class="col-lg-6 col-xs-6">
    <label for="txtRicerca">Descrizione:</label>
    <br>
    <input class="form-control  input-sm" type="text"  id="descrizioneRiga"  name="descrizioneRiga"  maxlength="254" size="70" value="<%= bean2.getDescrizioneRiga()%>">
    
    
  </div>
  <div class="col-lg-6 col-xs-6">
    <label for="txtRicerca">Nota Riga:</label>
    <br>
    <input name="notaRigaDocumento" type="text" class="form-control  input-sm" id="notaRigaDocumento" value="<%=bean2.getNotaRigaDocumento()%>" maxlength="60"  >
  </div>
</div>
<div class="row">
  
  <div class="col-lg-2 col-xs-6">
    <label >Quantit&agrave;:</label>
    <br>
    <input name="quantita"  type="text" class="form-control  input-sm numberinput"  id="quantita" value="<%=nf.format( bean2.getQuantita()==0?1:bean2.getQuantita()) %>" maxlength="10"    >
  </div>
  <div class="col-lg-2 col-xs-6">
    <label for="txtRicerca">Imponibile (Euro):</label>
    <br>
    <input name="imponibile"  <%=bean.isCaricoConIva()?"readonly class='readonlyField'":""%> type="text" class="form-control  input-sm numberinput"  id="imponibile" value="<%=nf.format(bean2.getImponibile()) %>" maxlength="10" nextFocus="nuovoArticolo">
  </div>
  <div class="col-lg-2 col-xs-6">
    <label for="txtRicerca">Sconto (%):</label>
    <br>
    <input type="text" class="form-control  input-sm numberinput" id="sconto" name="sconto" maxlength="10" value="<%= nf.format(bean2.getSconto()) %>">
  </div>

  <div class="col-lg-2 col-xs-6">
    <label for="txtRicerca">IVA (%):</label>
    <%=bean2.getId_iva()%><br>
    <select  class="form-control input-sm select2" style="width: 100%;" name="id_iva"  id="id_iva">
      <acx:optionvec  boundcolumn="id_iva" desccolumn="descrizione" vectumerator="listaIva" value="<%=bean2.getId_iva()%>"> &nbsp;&nbsp;&nbsp; &nbsp;</acx:optionvec>
    </select>
  </div>
  
  <div class="col-lg-2 col-xs-6">
  
    <input type="button" value="AGGIUNGI ARTICOLO" class="btn btn-block btn-primary btn-associative" onClick="javascript:addRigaArticolo()" id="nuovoArticolo" >
  </div>
</div>
<br>
<div class="row">
  <div class="col-lg-12">
    <div class="box"> 
      <!-- .box-header -->
      <div class="box-header clearfix hidden-print">
        <div class="row">
          <div class="col-lg-4 col-xs-6">
            <label>Totale Record: ${listaRigheDocumento.getTotNumberOfRecords()}</label>
          </div>
          <div class="col-lg-4 col-xs-6 center-text">
            <acx:prevvec link="javascript:Ab.prevPageDetail('righe');"  vectumerator="listaRigheDocumento"> <i class="fa fa-angle-double-left fa-lg fa-border"></i>	</acx:prevvec>
            <label>Pagina ${listaRigheDocumento.getPageNumber()} di ${listaRigheDocumento.getTotNumberOfPages()}</label>
            <acx:nextvec link="javascript:Ab.nextPageDetail('righe');"  vectumerator="listaRigheDocumento"><i class="fa fa-angle-double-right fa-lg fa-border"></i></acx:nextvec>
          </div>
          <div class="col-lg-4 col-xs-12 right-text">
            <label>Vai a pagina</label>
            <input name="pageNumberGo" id="pageNumberGo" size="4" <%=Ab.jsCrS("goPage('righe')")%> title="Inserisci il numero di pagina e premi invio o 'Procedi'">
            <a href="javascript:Ab.goPageDetail('righe');">Procedi <i class="fa fa-angle-double-right fa-lg fa-border"></i></a> </div>
        </div>
      </div>
      <!-- /.box-header -->
      <div class="box-body " id="no-more-tables">
        <div class="row">
          <div class="col-lg-12 pull-right"> Filtra per:
            <label>
              <input  <%=Ab.jsCr("")%> name="searchRighe" type="text" id="searchRighe" value="<%=CR2.getSearchRighe()%>">
              <a href="javascript:filtraRighe();"> <i class="fa fa-search" aria-hidden="true" title="Filtra righe"></i> </a> </label>
          </div>
        </div>
      
        <table class="table table-bordered table-hover table-striped dataTable table-condensed">
          <thead>
            <tr>
              <th>&nbsp;xxx</th>
              <th>Descrizione</th>
              <th>Impon.</th>
              <th>Imp. con iva</th>
              <th>Q.t&agrave;</th>
              <th>Sc. %</th>
              <th>IVA%</th>
              <th>Tot</th>
              
            </tr>
          </thead>
          <acx:whilevec   rowbeanclass="com.mg.coave.RigaDocumento" vectumerator="listaRigheDocumento">
            <tr>
              <td class="comandi text-center"><div class="inline-comandi text-center hidden-print">
                
                  <acx:if wherecondition="<%=rowBean.getFlgRigaPrelevata()==0%>"> <a href="javascript:modRigaArticolo('<%=rowBean.getId_rigaDocumento()%>');"> <i class="fa fa-edit" title="Modifica Record"></i> </a> <a href="javascript:delRigaArticolo('<%=rowBean.getId_rigaDocumento()%>','<%= rowBean.getLastUpdTmstString() %>');"> <i class="fa fa-trash-o" title="Cancella Record"></i> </a> </acx:if>
                  <acx:if wherecondition="<%=bean.getTipoDocumento().getFlgTipoDocumentoPrelevabile()==1%>">
                    <acx:if wherecondition="<%=rowBean.getFlgRigaPrelevata()==0%>"> <a href="javascript:impostaRigaChiusa(<%=rowBean.getId_rigaDocumento()%>)">
                      <acx:if wherecondition="<%=rowBean.getQuantitaPrelevata()==0%>"> <i class="fa fa-unlock-alt" title="IMPOSTA RIGA CHIUSA"></i> </acx:if>
                      <acx:else> <i class="fa fa-lock" title="RIGA CHIUSA"></i> </acx:else>
                      </a> </acx:if>
                    <acx:else>
                      <acx:if wherecondition="<%=rowBean.getDocumento().getTotDocumentiFiglioRiga(rowBean.getId_rigaDocumento())>0%>"> <i class="fa fa-external-link" title="Riga prelevata."></i> </acx:if>
                      <acx:else> 
                        <!-- TOLTO IL LINK SOLO SE CI SONO DEI FIGLI!! --> 
                        <a href="javascript:impostaRigaAperta(<%=rowBean.getId_rigaDocumento()%>)"> <i class="fa fa-check" title="Riga prelevata. PREMI PER RIAPRIRE LA RIGA"></i> </a> <a href="javascript:impostaRigaAperta(<%=rowBean.getId_rigaDocumento()%>)"></a> </acx:else>
                    </acx:else>
                  </acx:if>
                </div></td>
              <td data-title="Descrizione">
                <acx:if wherecondition="<%=rowBean.getId_documentoPadre()>0%>"> <a href="javascript:apriServizio(<%=rowBean.getId_documentoPadre()%>)"> <i class="fa fa-link fa-2x" aria-hidden="true" title="Riga legata al servizio <%=rowBean.getId_documentoPadre()%>" style="color: #BDC355;"></i> </a> 
              <acx:if wherecondition='<%=rowBean.isServizioAssociato()%>'><a href="javascript:staccaServizio(<%=rowBean.getId_rigaDocumento()%>)">
               <i class="fa fa-eraser fa-2x" style="color:darkred" title="Stacca Servizio  <%=rowBean.getId_documentoPadre()%> dalla Riga Fattura"></i>
               </a></acx:if></acx:if>
                <%= rowBean.getDescrizioneRigaCompleta() %>xx
                <acx:if wherecondition='<%=rowBean.hasNote()%>'> <i class="fa fa-info-circle" aria-hidden="true" title="<%=rowBean.getNotaRigaDocumento()+" "+rowBean.getNotaBarcode()%>"></i> </acx:if>
             
                <acx:if wherecondition="<%=rowBean.getDocumento().getTotDocumentiFiglioRiga(rowBean.getId_rigaDocumento())>0%>"> <a href="javascript:listaFigli(<%= rowBean.getId_rigaDocumento()  %>)"> <i class="fa fa-list" aria-hidden="true" title="Visualizza lista documenti figli" style="color: blue;"></i> </a> </acx:if>
                <acx:if wherecondition="<%=rowBean.hasQtaOrdinata()%>"> <a href="javascript:listaOrdiniPrenotazione(<%= rowBean.getId_rigaDocumento()  %>)"> <i class="fa fa-list" aria-hidden="true" title="Visualizza lista ordini" style="color: red;"></i> </a> </acx:if>
                <acx:if wherecondition="<%=rowBean.getDocumento().getTotDocumentiPrelievoOrdine(rowBean.getId_rigaDocumento())>0%>"> <a href="javascript:listaFigliOrdine(<%= rowBean.getId_rigaDocumento()  %>)"> <i class="fa fa-list-ul" aria-hidden="true" style="color: red;" title="Visualizza lista documenti figli"></i> </a> </acx:if></td>
              <td data-title="Impon." class="text-right"><%= nf.format(rowBean.getImponibile())%></td>
              <td data-title="Imp. con iva"><%= nf.format(rowBean.getImportoCalc())%>
                <acx:if wherecondition='<%=bean.getTipoCaricoScarico()==0%>'> <span style="font-size:9px"> 
                  Pr. Pub.<%= nf.format(rowBean.getArticolo().getPrezzoPubblicoIva()) %> </span> </acx:if>
                <acx:if wherecondition='<%=bean.getTipoCaricoScarico()==1%>'> <span style="font-size:9px"> 
                  Ult. Acq.<%= nf.format(rowBean.getArticolo().getCostoAcquistoConIvaUltimo()) %> </span> </acx:if></td>
              <td data-title="Q.t&agrave;"><%=rowBean.getQuantita()%></td>
              <td data-title="Sc. %"><%= nf.format(rowBean.getSconto())%></td>
              <td data-title="IVA%"><font size="-3"><%= rowBean.getIva().getDescrizione() %></font></td>
              <td data-title="Tot"><font size="-3"><%= nf4.format(rowBean.getTotImportoRigaConSconto())%></font></td>
            
            </tr>
          </acx:whilevec>
        </table>
      </div>
      <div class="box-footer clearfix hidden-print">
        <div class="row">
          <div class="col-lg-4 col-xs-6">
            <label>Totale Record: ${listaRigheDocumento.getTotNumberOfRecords()}</label>
          </div>
          <div class="col-lg-4 col-xs-6 center-text">
            <acx:prevvec link="javascript:Ab.prevPageDetail();"  vectumerator="list"> <a href="javascript:Ab.prevPageDetail()"><i class="fa fa-angle-double-left fa-lg fa-border"></i></a></acx:prevvec>
            <label>Pagina ${listaRigheDocumento.getPageNumber()} di ${listaRigheDocumento.getTotNumberOfPages()}</label>
            <acx:nextvec link="javascript:Ab.nextPageDetail();"  vectumerator="list"><a href="javascript:Ab.nextPageDetail()"><i class="fa fa-angle-double-right fa-lg fa-border"></i></a></acx:nextvec>
          </div>
          <div class="col-lg-4 col-xs-12 right-text">
            <label>Vai a pagina</label>
            <input name="pageNumberGo" id="pageNumberGo" size="4" <%=Ab.jsCrS("goPage()")%> title="Inserisci il numero di pagina e premi invio o 'Procedi'">
            <a href="javascript:Ab.goPageDetail();">Procedi <i class="fa fa-angle-double-right fa-lg fa-border"></i></a> </div>
        </div>
      </div>
    </div>
  </div>
</div>
