<%@ taglib uri="/WEB-INF/acxent.tld" prefix="acx" %>
<%@ page language="java" import="it.acxent.jsp.*" %>
<%-- DICHIARAZIONE BEAN --%>
<jsp:useBean id="nf" scope="request" type="java.text.NumberFormat" >
</jsp:useBean>
<jsp:useBean id="df" class="it.acxent.util.SimpleDateFormat" scope="request" type="it.acxent.util.SimpleDateFormat" >
</jsp:useBean>
<jsp:useBean id="bean" class="it.acxent.pg.Gara" type="it.acxent.pg.Gara" scope="request" >
</jsp:useBean>
<jsp:useBean id="puntoFoto" class="it.acxent.pg.PuntoFoto" type="it.acxent.pg.PuntoFoto" scope="request" >
</jsp:useBean>
<%-- FINE DICHIARAZIONE BEAN --%>

<input type="hidden" id="id_puntoFoto" readonly name="id_puntoFoto" maxlength="" size="4" value="<%=puntoFoto.getId_puntoFoto()%>">
    <input name="id_puntoFotoIdx" type="hidden" id="id_puntoFotoIdx">
<acx:if wherecondition="<%=bean.getDBState()==0%>">
  <h1>Prima salvare il record principale</h1>
</acx:if>
<acx:else>
  <div class="row">
    <div class="col-lg-3 col-xs-12">
      <label for="descrizione">Descrizione:</label>
      <br>
      <input name="descrizionePuntoFoto" type="text" class="form-control input-sm" id="descrizionePuntoFoto" value="<%= puntoFoto.getDescrizionePuntoFoto() %>" maxlength="60">
    </div>
    <div class="col-lg-3 col-xs-12">
     
        <label for="descrizione">Path Relativo:</label>
        <br>
        <input name="pathRelativoFoto" type="text" class="form-control input-sm" id="pathRelativoFoto" value="<%=puntoFoto.getPathRelativoFoto()%>" maxlength="60">
    
    </div>
    <div class="col-lg-3 col-xs-12 col-inline">
      <div class="col-lg-12 col-md-12 col-sm-12">
        <label for="descrizione">Categoria - Nuova Categoria:</label>
      </div>
      <div class="col-lg-6 col-md-7 col-sm-7 col-left">
        <select name="tipoPuntoFoto" id="tipoPuntoFoto" class="form-control input-sm select2">
          <acx:optionvec  boundcolumn="tipoPuntoFoto" desccolumn="tipoPuntoFoto" vectumerator="listaTipiPuntoFoto" value="<%=puntoFoto.getTipoPuntoFoto()%>">&nbsp;&nbsp;&nbsp;</acx:optionvec>
        </select>
      </div> 
      <div class="col-lg-4 col-md-5 col-sm-5 form-inline">-
        <input class="form-control  input-sm" name="tipoPuntoFotoNew" type="text" id="tipoPuntoFotoNew" value="<%= puntoFoto.getTipoPuntoFotoNew() %>" size="10" maxlength="60" nextFocus="addPuntoFoto">
      </div>
    </div>
	  
	  <div class="col-lg-1 col-xs-6">
              <label for="txtRicerca">Tipo Indicizz.:</label>
              <br>
		    <select  defaultFocus="focus" class="form-control input-sm select2" name="flgIndexOk" id="flgIndexOk">
                    <acx:optionflg boundcolumn="flgIndexOk" valuelist="0,2" bean="puntoFoto">&nbsp;</acx:optionflg>
                  </select>
		  
          
            </div>
    <div class="col-lg-1 col-xs-6"> <a class="btn btn-success btn-associative" id="addPuntoFoto" href="javascript:addPuntoFoto();">Aggiungi/Aggiorna Punto Foto</a> </div>
  </div>
	<div class="row"><div class="col-lg-12" ><br></div></div>
  <div class="row">
    <div class="col-lg-12" id="no-more-tables">
      <table class="table table-bordered table-hover table-striped dataTable table-condensed">
        <thead>
          <tr>
            <th>&nbsp;</th>
            <th>Descrizione</th>
          
            <th>Path Relativo</th>
              <th>Categoria</th>
              <th>Indicizzazione</th>
          </tr>
        </thead>
        <acx:whilevec rowbeanclass="it.acxent.pg.PuntoFoto" vectumerator="listaPuntoFoto">
          <tr <%=rowBean.getId_puntoFoto()==puntoFoto.getId_puntoFoto()?"class='success'":""%>>
            <td class="comandi" align="center" style="min-width: 240px"><div class="inline text-center hidden-print"> <a href="javascript:modPuntoFoto(<%=rowBean.getId_puntoFoto()%>);"><i class="fa fa-edit fa-2x" title="Modifica Record"></i></a> <a href="javascript:delPuntoFoto(<%=rowBean.getId_puntoFoto()%>);"><i class="fa fa-trash-o fa-2x" title="Cancella Record"></i></a>&nbsp;&nbsp;<a href="javascript:javascript:indexFoto(<%=rowBean.getId_puntoFoto()%>)"><i class="fa fa-film  fa-2x" style="color: black" title="Indicizza Foto / Carica Foto"></i></a>&nbsp;&nbsp;<a href="javascript:javascript:noIndexFoto(<%=rowBean.getId_puntoFoto()%>)"><i class="fa fa-ban fa-2x" style="color: black" title="Azzera Indicizzazione"></i></a> <a href="javascript:javascript:previewFoto(<%=rowBean.getId_puntoFoto()%>)"><i class="fa fa-cubes fa-2x" style="color: darkcyan" title="Crea Preview Foto"></i></a><a href="javascript:javascript:resetPreview(<%=rowBean.getId_puntoFoto()%>)"><i class="fa fa-cubes fa-2x" style="color: darkred" title="Reset invio e Preview Foto"></i></a><a href="javascript:javascript:callOcr(<%=rowBean.getId_puntoFoto()%>)"><i class="fa fa-gears fa-2x" style="color: darkorange" title="Chiama trova Pettorali Tramite OCR"></i></a></div></td>
            <td data-title="Descrizione"><%= rowBean.getDescrizionePuntoFoto() %></td>
             <td data-title="Path Relativo"><%= rowBean.getPathRelativoFoto() %></td>
              <td data-title="Categoria"><%= rowBean.getTipoPuntoFoto() %></td>
              <td data-title="Categoria"><%= rowBean.getIndexOk() %></td>
          
          </tr>
        </acx:whilevec>
      </table>
    </div>
  </div>
</acx:else>
