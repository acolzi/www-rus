<%@ taglib uri="/WEB-INF/acxent.tld" prefix="acx" %>
<%@ page language="java" import="it.acxent.jsp.*" %>
<%-- DICHIARAZIONE BEAN --%>
<jsp:useBean id="nf" scope="request" type="java.text.NumberFormat" >
</jsp:useBean>
<jsp:useBean id="df" class="it.acxent.util.SimpleDateFormat" scope="request" type="it.acxent.util.SimpleDateFormat" >
</jsp:useBean>
<jsp:useBean id="bean" class="it.acxent.pg.Gara" type="it.acxent.pg.Gara" scope="request" >
</jsp:useBean>

<%-- FINE DICHIARAZIONE BEAN --%>

<acx:if wherecondition="<%=bean.getDBState()==0%>">
  <h1>Prima salvare il record principale</h1>
</acx:if>
<acx:else>
  <div class="row  hidden-print">
    <div class="col-lg-12">
      <div class="box box-dettaglio">
        <div class="box-body">
          <div class="row">
            <div class="col-lg-3">
              <label for="descrizione">File da Importare:</label>
              <br>
              <div class="loadFile">
                <label>
                <input name="btn-upload_file_1" type="file" id="btn-upload_file_1" size="40" maxlength="200" onChange="Ab.saveFile(0,1)">
                <input type="hidden" id="fileNameOnServer_1" name="fileNameOnServer_1">
                <div id="uploadFileRes_1">CARICA IL FILE</div>
              </div>
              </label>
            </div>
              <div class="col-lg-3 col-xs-6"><br>
             <acx:if wherecondition="<%=bean.isImportFileExist()%>"> <a href="../csv/<%=bean.getId_gara()%>.csv" target="_blank">File CSV import </a></acx:if>
             <acx:else>File import file indicizzazione Pisa</acx:else>
              	
              </div>
            <div class="col-lg-3 col-xs-6">
              <label for="txtRicerca"></label>
              <a href="javascript:salvaFileCsv()" class="btn btn-success btn-associative">SALVA FILE IMPORT PUNTI FOTO </a></div>
               <acx:if wherecondition="<%=bean.isImportFileExist()%>"> 
            <div class="col-lg-3 col-xs-6"> <a href="javascript:indexCsvPisa()" class="btn btn-success btn-associative">INDICIZZA  FOTO</a></div></acx:if>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- generazione coupon --><!-- stampa serie --></acx:else>
