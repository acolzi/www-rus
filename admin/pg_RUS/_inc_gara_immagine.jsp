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

<div class="row">
  <input name="totImgNumber" type="hidden" id="totImgNumber" value="3">
  <acx:if wherecondition="<%=bean.getDBState()==0%>">
    <h1>Per inserire le immagini devi prima salvare il record</h1>
  </acx:if>
  <acx:else>
    <acx:for begin="1" end="1" varname="i">
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
  </acx:else>
</div>
<script language="JavaScript" src="../pg/_js/ab-tipoGara-immagine.js"></script> 
