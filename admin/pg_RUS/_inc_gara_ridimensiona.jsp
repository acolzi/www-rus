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

<acx:if wherecondition="<%=bean.getDBState()==0%>">
  <h1>Prima salvare il record principale</h1>
</acx:if>
<acx:else>
  <div class="row">
    <div class="col-lg-4 col-xs-6">
      <label for="txtRicerca">Testo Watermark:</label>
      <br>
      <input type="text" class="form-control  input-sm" id="testoO" name="testoO"   maxlength="60" value="<%= bean.getTestoO() %>">
    </div>
    <div class="col-lg-3 col-xs-6">
      <label for="txtRicerca">Font TTF testo:</label>
      <br>
      <select  class="form-control input-sm select2" style="width: 100%;" name="testoFont" id="testoFont" >
        <acx:optionvec  boundcolumn="ttf" desccolumn="ttfName" vectumerator="listaTtf" value="<%=bean.getTestoFont()%>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</acx:optionvec>
      </select>
    </div>
    <div class="col-lg-3 col-xs-6">
      <label for="testoColore">Colore Font testo 1:</label>
      <br>
      <div class="input-group colorpicker">
        <input type="text" class="form-control input-sm" name="testoColore" id="testoColore" value="<%=bean.getTestoColore()%>" maxlength="7">
        <div class="input-group-addon"> <i></i> </div>
      </div>
    </div>
    <div class="col-lg-2 col-xs-6">
      <label for="txtRicerca">Font size testo:</label>
      <br>
      <input type="text" class="form-control  input-sm" id="testoSize" name="testoSize"   maxlength="4" value="<%= bean.getTestoSize() %>">
    </div>
  </div>
  <div class="row  hidden-print">
    <div class="col-lg-12">
      <div class="box box-dettaglio">
        <div class="box-body">
          <div class="panel panel-default">
            <div class="panel-heading">
              <h1 class="panel-title">Immagini di test</h1>
            </div>
            <div class="panel-body">
              <div class="row">
                <acx:for begin="2" end="3" varname="i">
                  <%int j=i.intValue();%>
                  <!-- thumbnail -->
                  <div class="col-lg-2 text-center loadImage" style="margin: 0; height: 220px;">
                    <label>
                    <input id="btn-upload_${i}" type="file"  onChange="javascript:Ab.saveImage(${bean.get_Id()},${i})" />
                    <div id="img-area-div_${i}"  class="upload_foto"># ${i}
                      <acx:if_img scaledWidth="100" scaledPrefix="100/"> <img src="../../_img/_gara/<%=bean.getImgFileName(j) %>" id="imgNew_${i}" style="width:100px;"> 
                        <script>
					$(document).ready(function() {Ab.showImgBtnArea(${i})});
				</script>
                        <input type="hidden" id="img_vis_${i}" name="img_vis_${i}" value="${i}">
                      </acx:if_img>
                      <acx:else_img> <img src="../_V4/_img/placeHold.gif" width="35" id="imgNew_${i}" style="width:100px;"> </acx:else_img>
                    </div>
                    </label>
                    <br>
                    <div id="btn-area-div_${i}"> <a href="javascript:Ab.deleteImage(${bean.get_Id()},${i})"  class="btn-img">Elimina</a> - <a id="img-zoom_${i}" href="#" onClick="Ab.showImage(${bean.get_Id()},${i})" class="btn-img">Zoom</a> </div>
                  </div>
                  
                  <!-- /thumbnail --> 
                </acx:for>
                <div class="col-lg-2 col-xs-6"> <br>
                  <a class="btn btn-app btn-app-sm" href="javascript:creaRiduzioniTest()"> <i class="fa fa-print" title="Crea foto Test"></i>Crea foto Test</a> </div>
                <div class="col-lg-2 col-xs-6">
                  <label for="txtRicerca">Foto test:</label>
                  <br>
                  <div id="fotoTest"></div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <acx:ifparm codice="ABILITA_WEB" value="true"></acx:ifparm>
</acx:else>
