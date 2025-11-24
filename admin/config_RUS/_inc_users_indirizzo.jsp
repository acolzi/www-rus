<%@ taglib uri="/WEB-INF/acxent.tld" prefix="acx" %>
<%@ page language="java" import="it.acxent.jsp.*" %>
<%-- DICHIARAZIONE BEAN --%>
<jsp:useBean id="nf" scope="request" type="java.text.NumberFormat" >
</jsp:useBean>
<jsp:useBean id="df" class="it.acxent.util.SimpleDateFormat" scope="request" type="it.acxent.util.SimpleDateFormat" >
</jsp:useBean>
<jsp:useBean id="bean" class="it.acxent.pg.Users" type="it.acxent.pg.Users" scope="request" >
</jsp:useBean>
<%-- FINE DICHIARAZIONE BEAN --%>

<acx:if wherecondition="<%=bean.getDBState()==0%>">
  <h1>Per inserire gli allegati devi prima salvare il record principale</h1>
</acx:if>
<acx:else>
  <div class="row  hidden-print">
    <div class="col-lg-12">
      <div class="box box-dettaglio">
        <div class="box-body">
          <div class="row">
            <div class="col-lg-3 col-xs-6">
              <label for="txtRicerca">Ragione Sociale:</label>
              <br>
              <input type="text" class="form-control  input-sm" id="" name="nominativo"   maxlength="60" value="<acx:inputTextFormat><%= bean.getNominativo() %></acx:inputTextFormat>">
            </div>
            <div class="col-lg-3 col-xs-6">
              <label for="txtRicerca">Indirizzo:</label>
              <br>
              <input type="text" class="form-control  input-sm" id="" name="indirizzo"   maxlength="60" value="<acx:inputTextFormat><%= bean.getIndirizzo() %></acx:inputTextFormat>">
            
            </div>
            <div class="col-lg-1 col-xs-6">
              <label for="txtRicerca">Nr.:</label>
              <br>
             
              <input type="text" class="form-control  input-sm" id="cap" name="numeroCivico"   maxlength="10" value="<%= bean.getNumeroCivico() %>">
            </div>
            <div class="col-lg-2 col-xs-6">
              <label for="txtRicerca">Citt&agrave;:</label>
              <br>
              <input type="text" class="form-control  input-sm" id="citta" name="citta"   maxlength="60" value="<%= bean.getCitta() %>">
            </div>
             <div class="col-lg-2 col-xs-6">
              <label for="txtRicerca">Cap:</label>
              <br>
             
              <input type="text" class="form-control  input-sm" id="cap" name="cap"   maxlength="10" value="<%= bean.getCap() %>">
            </div>
             <div class="col-lg-1 col-xs-6">
              <label for="txtRicerca">Provincia:</label>
              <br>
              <input type="text" class="form-control  input-sm" id="provincia" name="provincia"   maxlength="60" value="<%= bean.getProvincia() %>">
            
            </div>
          </div>
          <div class="row">
           
            
            <div class="col-lg-3 col-xs-6">
              <label for="txtRicerca">Telefono:</label>
              <br>
              <input type="text" class="form-control  input-sm" id="telefono" name="telefono"   maxlength="60" value="<%= bean.getTelefono() %>">
            </div>
            <div class="col-lg-3 col-xs-6">
              <label for="txtRicerca">Fax:</label>
              <br>
              <input type="text" class="form-control  input-sm" id="fax" name="fax"   maxlength="60" value="<%= bean.getFax() %>">
            </div>
         
            <div class="col-lg-3 col-xs-6">
              <label for="txtRicerca">Codice Fiscale:</label>
              <br>
              <input type="text" class="form-control  input-sm" id="codFisc" name="codFisc"   maxlength="16" value="<%= bean.getCodFisc() %>">
            </div>
            <div class="col-lg-3 col-xs-6">
              <label for="txtRicerca">Societ&agrave; di Appartenenza  :</label>
              <br>
              <input type="text" class="form-control  input-sm" id="contatto" name="contatto"   maxlength="30" value="<%= bean.getContatto() %>">
            </div>
          </div>
          <div class="row">
            <div class="col-lg-3 col-xs-6">
              <label for="txtRicerca">Data Scadenza:</label>
              <br>
              <input type="text" class="form-control  input-sm datemask" id="dataScadenza" name="dataScadenza"   maxlength="30" value="<%= df.format(bean.getDataScadenza()) %>">
            </div>
            <div class="col-lg-1 col-xs-6">
              <label for="txtRicerca">Tot foto Vis.:</label>
              <br>
              <input type="text" class="form-control  input-sm" id="nFotoVisual" name="nFotoVisual"   maxlength="6" value="<%= bean.getNFotoVisual() %>">
             
            </div>
                  <div class="col-lg-2 col-xs-6">
              <label for="txtRicerca">Vis. ultimo g. ( <%=df.format(bean.getDataVisual())%> ):</label>
              <br>
             
              <input type="text" class="form-control  input-sm" id="nFotoVisualOggi" name="nFotoVisualOggi"   maxlength="6" value="<%= bean.getNFotoVisualOggi() %>">
            </div>
              <div class="col-lg-1 col-xs-6">
              <label for="txtRicerca">Mail ragg. Max:</label>
              <br>
             
              <input type="checkbox" class="minimal"  <%= bean.getFlgMailFotoMax()==1?"checked":""%> name="ckflgMailFotoMax" id="ckflgMailFotoMax" >
              <input type="hidden" name="flgMailFotoMax" id="flgMailFotoMax" value="<%=bean.getFlgMailFotoMax()%>">
            </div>
             <div class="col-lg-1 col-xs-6">
              <label for="txtRicerca">Mail Scad.:</label>
              <br>
             
              <input type="checkbox" class="minimal"  <%= bean.getFlgMailFotoScadenza()==1?"checked":""%> name="ckflgMailFotoScadenza" id="ckflgMailFotoScadenza" >
              <input type="hidden" name="flgMailFotoScadenza" id="flgMailFotoScadenza" value="<%=bean.getFlgMailFotoScadenza()%>">
            </div>
            <div class="col-lg-2 col-xs-6">
              <label for="txtRicerca">Numero foto Max :</label>
              <br>
              <input type="text" class="form-control  input-sm" id="nFotoMax" name="nFotoMax"   maxlength="6" value="<%= bean.getNFotoMax() %>">
            </div>
       
       
            <div class="col-lg-2 col-xs-6">
              <label for="txtRicerca">Scarica Miniature:</label>
              <br>
                <input type="checkbox" class="minimal"  <%= bean.getFlgMiniature()==1?"checked":""%> name="ckflgMiniature" id="ckflgMiniature" >
              <input type="hidden" name="flgMiniature" id="flgMiniature" value="<%=bean.getFlgMiniature()%>">
              
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</acx:else>
