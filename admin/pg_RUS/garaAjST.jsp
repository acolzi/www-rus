<!-- InstanceBegin template="/Templates/3ajaxSearchText.dwt" codeOutsideHTMLIsLocked="false" --><!DOCTYPE html>
<link rel="shortcut icon" href=".../admin/_logo/favicon.ico" />
<script language="JavaScript" src="../_V3/_js/ajaxTextBoxSearch.js"></script>
<script language="JavaScript" src="../_V3/_js/functions.js"></script>
<%@ taglib uri="/WEB-INF/acxent.tld" prefix="acx" %>
<%@ page language="java" import="it.acxent.jsp.*" %>
<jsp:useBean id="RI" class="it.acxent.util.ReturnItem" type="it.acxent.util.ReturnItem" scope="request" ></jsp:useBean>
<jsp:useBean id="list" scope="request" class="it.acxent.util.Vectumerator" type="it.acxent.util.Vectumerator"></jsp:useBean>
<input name="<%=RI.getDivList()%>_tnr" id="<%=RI.getDivList()%>_tnr" type="hidden" value="<%=list.getTotNumberFetchedRecord()%>">
<!-- InstanceBeginEditable name="bean" --><jsp:useBean id="CR" class="it.acxent.pg.GaraCR" type="it.acxent.pg.GaraCR" scope="request" ></jsp:useBean><!-- InstanceEndEditable --><acx:if_logon_ok>
<div id="stRow"><!-- InstanceBeginEditable name="list" --> <acx:whilevec  rowbeanclass="it.acxent.pg.Gara"  vectumerator="list"> <%RI.setRiValues("");
RI.addRiValues(rowBean.getId_gara());
RI.addRiValues(rowBean.getDescrizioneGaraCompleta());
%><%=Ab.inputAjSearchDiv(list.getIndex(),RI.getSelectedKey(),RI.getDivList(),list.getIndex()+"-"+ rowBean.getDescrizioneGaraCompleta())%>
</acx:whilevec><!-- InstanceEndEditable --></div>
</acx:if_logon_ok>
<acx:else_logon><jsp:include page="../_V3/_inc/_ajstElseLogon.jsp" flush="true" /></acx:else_logon><!-- InstanceEnd -->