<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<!-- saved from url=(0039)http://www.pierogiacomelli.com/form.php -->
<HTML xml:lang="en" xmlns="http://www.w3.org/1999/xhtml"><!-- InstanceBegin template="/Templates/PG.dwt" codeOutsideHTMLIsLocked="false" -->
<HEAD>
<%@ taglib uri="/WEB-INF/acxent.tld" prefix="acx" %>
<jsp:useBean id="productInfo" class="java.lang.String" type="java.lang.String" scope="session" ></jsp:useBean>
<jsp:useBean id="msg" class="java.lang.String" type="java.lang.String" scope="request" ></jsp:useBean>
<jsp:useBean id="logon" class="java.lang.String" type="java.lang.String" scope="request" ></jsp:useBean>
<jsp:useBean id="grantMsg" class="java.lang.String" type="java.lang.String" scope="request" ></jsp:useBean>
<jsp:useBean id="df" class="it.acxent.util.SimpleDateFormat" scope="request" type="it.acxent.util.SimpleDateFormat" ></jsp:useBean>
<TITLE>Archivio Fotografico - Forum - Riviste</TITLE>
<!-- ------------------------------------------------------------------------ -->
<META http-equiv=content-type content="application/xhtml+xml; charset=utf-8">
<META 
content="ARCHIVIO FOTOGRAFICO DIGITALE, WEB SERVER E FORUM COLLABORAZIONE ACQUISIZIONE ELABORAZIONE IMMAGINI SENZA SCOPO DI LUCRO PER LA DIFFUSIONE DELLO SPORT " 
name=description>
<META content="IMMAGINI PODISMO ATLETICA FORUM FOGRAFIA DIGITALE SPORT CHAT" 
name=keywords>
<LINK title="Tierra Verde stylesheet" 
href="_pgImg/gmarco.css" type=text/css 
rel=stylesheet>
<SCRIPT type=text/javascript>

/***********************************************
* Switch Menu script- by Martial B of http://getElementById.com/
* Modified by Dynamic Drive for format & NS4/IE4 compatibility
* Visit http://www.dynamicdrive.com/ for full source code
***********************************************/

var persistmenu="yes" //"yes" or "no". Make sure each SPAN content contains an incrementing ID starting at 1 (id="sub1", id="sub2", etc)
var persisttype="sitewide" //enter "sitewide" for menu to persist across site, "local" for this page only

if (document.getElementById){ //DynamicDrive.com change
document.write('<style type="text/css">\n')
document.write('.submenu{display: none;}\n')
document.write('</style>\n')
}

function SwitchMenu(obj){
	if(document.getElementById){
	var el = document.getElementById(obj);
	var ar = document.getElementById("masterdiv").getElementsByTagName("span"); //DynamicDrive.com change
		if(el.style.display != "block"){ //DynamicDrive.com change
			for (var i=0; i<ar.length; i++){
				if (ar[i].className=="submenu") //DynamicDrive.com change
				ar[i].style.display = "none";
			}
			el.style.display = "block";
		}else{
			el.style.display = "none";
		}
	}
}

function get_cookie(Name) { 
var search = Name + "="
var returnvalue = "";
if (document.cookie.length > 0) {
offset = document.cookie.indexOf(search)
if (offset != -1) { 
offset += search.length
end = document.cookie.indexOf(";", offset);
if (end == -1) end = document.cookie.length;
returnvalue=unescape(document.cookie.substring(offset, end))
}
}
return returnvalue;
}

function onloadfunction(){
if (persistmenu=="yes"){
var cookiename=(persisttype=="sitewide")? "switchmenu" : window.location.pathname
var cookievalue=get_cookie(cookiename)
if (cookievalue!="")
document.getElementById(cookievalue).style.display="block"
}
}

function savemenustate(){
var inc=1, blockid=""
while (document.getElementById("sub"+inc)){
if (document.getElementById("sub"+inc).style.display=="block"){
blockid="sub"+inc
break
}
inc++
}
var cookiename=(persisttype=="sitewide")? "switchmenu" : window.location.pathname
var cookievalue=(persisttype=="sitewide")? blockid+";path=/" : blockid
document.cookie=cookiename+"="+cookievalue
}

if (window.addEventListener)
window.addEventListener("load", onloadfunction, false)
else if (window.attachEvent)
window.attachEvent("onload", onloadfunction)
else if (document.getElementById)
window.onload=onloadfunction

if (persistmenu=="yes" && document.getElementById)
window.onunload=savemenustate


function openWin(URL){
        aWindow=window.open(URL,"listwindow", "resizable=yes,scrollbars=yes,status=0,width=200,height=100");
        winprops = 'height='+h+',width='+w+',top='+wint+',left='+winl+',scrollbars='+scroll+',resizable';
}

function NewWindow(mypage, myname, w, h, scroll) {
        var winl = (screen.width - w) / 2;
        var wint = (screen.height - h) / 2;
        winprops = 'height='+h+',width='+w+',top='+wint+',left='+winl+',scrollbars='+scroll+',resizable'
        win = window.open(mypage, myname, winprops)
if (parseInt(navigator.appVersion) >= 4) { win.window.focus(); }
}

</SCRIPT>
<!-- ------------------------------------------------------------------------ -->
<META content="MSHTML 6.00.2900.3020" name=GENERATOR>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="//cookie.ablia.net/_js_cookie/jquery.browserLanguage.js"></script>
<script type="text/javascript" src="//cookie.ablia.net/_js_cookie/jquery.cookie.js"></script>
<script type="text/javascript" src="//cookie.ablia.net/_js_cookie/jquery.cookiesdirective.js"></script>
</HEAD>


<script language="JavaScript" src="_js/functions.js"></script>

<BODY>
<!-- #BeginEditable "Script" -->
<script language="JavaScript" src="Script/pg-logon.js"></script> 
<!-- #EndEditable --> <!-- InstanceBeginEditable name="utenteLogon" -->
<jsp:useBean id="utenteLogon" class="it.acxent.pg.Users" type="it.acxent.pg.Users" scope="session" >
</jsp:useBean>
<!-- InstanceEndEditable --> <!-- InstanceBeginEditable name="Bean" -->

<!-- InstanceEndEditable -->
<DIV id=header align=center><FONT color=white size=5><B>Archivio Fotografico - 
  Forum - Riviste</B></FONT>
  <P></P>
</DIV>
<!-- ------------------------------------------------------------------------ -->
<TABLE width="100%" align=left>
  <TBODY>
    <TR vAlign=top align=left>
      <TD width=70><DIV id=sideBar>
          <DIV id=masterdiv>
            <DIV class=menutitle onClick="SwitchMenu('sub1')">Foto</DIV>
            <SPAN 
      class=submenu id=sub1>&nbsp;&nbsp; - <A 
      href="http://www.pierogiacomelli.com/index.php">Home 
            Page</A><BR>
            &nbsp;&nbsp; - <A 
      href="http://www.pierogiacomelli.com/gallery.php">Foto</A><BR>
            &nbsp;&nbsp; 
            - <A 
      href="http://www.pierogiacomelli.com/gallery-archivio.php">Archivio</A><BR>
            &nbsp;&nbsp; 
            - <A 
      href="http://www.pierogiacomelli.com/privacy.php">Privacy</A><BR>
            &nbsp;&nbsp; 
            - <A 
      href="http://www.pierogiacomelli.com/considerazioni.php">Avvertenze</A><BR>
            &nbsp;&nbsp; 
            - <A 
href="http://www.pierogiacomelli.com/form.php">Password</A><BR>
            </SPAN>
            <DIV class=menutitle onClick="SwitchMenu('sub2')">Riviste</DIV>
            <SPAN 
      class=submenu id=sub2>&nbsp;&nbsp; - <A 
      href="http://www.pierogiacomelli.com/riv-atletica.php">Atl. 
            Img</A><BR>
            &nbsp;&nbsp; - <A 
      href="http://www.pierogiacomelli.com/riv-spiridon.php">Spiridon</A><BR>
            </SPAN>
            <DIV class=menutitle onClick="SwitchMenu('sub3')">Forum</DIV>
            <SPAN 
      class=submenu id=sub3>&nbsp;&nbsp; - <A 
      href="http://www.pierogiacomelli.com/cgi-bin/yabb/YaBB.cgi?board=news">News</A><BR>
            &nbsp;&nbsp; 
            - <A 
      href="http://www.pierogiacomelli.com/cgi-bin/yabb/YaBB.cgi">Forum</A><BR>
            &nbsp;&nbsp; 
            - <A href="http://www.pierogiacomelli.com/chat">Chat</A><BR>
            </SPAN>
            <DIV class=menutitle onClick="SwitchMenu('sub4')">Varie</DIV>
            <SPAN 
      class=submenu id=sub4>&nbsp;&nbsp; - <A 
      href="http://www.pierogiacomelli.com/csv.php">CSV</A><BR>
            &nbsp;&nbsp; - <A 
      href="http://www.pierogiacomelli.com/stats">Statistiche</A><BR>
            &nbsp;&nbsp; 
            - <A 
      href="http://www.pierogiacomelli.com/stats/snmp/localhost_2.html">Utilizzo 
            Banda</A><BR>
            &nbsp;&nbsp; - <A 
      href="http://www.pierogiacomelli.com/files.php">Files</A><BR>
            &nbsp;&nbsp; 
            - <A 
      href="http://www.pierogiacomelli.com/links.php">Links</A><BR>
            </SPAN></DIV>
          <P>
          <P><B>&nbsp;&nbsp;Links consigliati:</B>
          <P>&nbsp;&nbsp;<A title="Download Opera" href="http://www.opera.com/"> <IMG height=15 alt=Opera 
      src="_pgImg/opera94x15.gif" 
      width=94></A>
          <P>&nbsp;&nbsp;<A title="Get Firefox - Web Browsing Redefined" 
      href="http://www.mozilla.org/products/firefox/"> <IMG height=15 
      alt="Get Firefox" 
      src="_pgImg/firefox_pixel.png" 
      width=94 border=0></A>
          <P><B>&nbsp;&nbsp;Sponsors:</B><BR>
          <P>&nbsp;&nbsp;&nbsp;&nbsp;<A 
      href="http://www.pierogiacomelli.com/files.php?nomedir=%2Fusr%2Flocal%2Fwww%2Fdata%2Ffiles%2Fslideshow"><IMG 
      src="_pgImg/slide.jpg" width=120 
      border=0></A>
          <P>&nbsp;&nbsp;&nbsp;&nbsp;<A href="http://www.airf.it/"><IMG 
      src="_pgImg/airf.jpg" width=120 
      border=0></A>
          <P>&nbsp;&nbsp;&nbsp;&nbsp;<A href="http://www.aism.it/"><IMG 
      src="_pgImg/aism.jpg" width=120 
      border=0></A>
          <P>&nbsp;&nbsp;&nbsp;&nbsp;<A href="http://www.avis.prato.it/"><IMG 
      src="_pgImg/avis.png" width=120 
      border=0></A>
          <P>&nbsp;&nbsp;&nbsp;&nbsp;<A 
      href="http://www.pierogiacomelli.com/cgi-bin/yabb/YaBB.cgi"><IMG 
      src="_pgImg/forum.jpg" width=120 
      border=0></A>
          <P>&nbsp;&nbsp;&nbsp;&nbsp;<A 
      href="http://www.pierogiacomelli.com/gallery.php?nomedir=%2Fhdr%2Fmypics%2Fpodismo_atletica"><IMG 
      src="_pgImg/archivio.jpg" width=120 
      border=0></A>
          <P>&nbsp;&nbsp;&nbsp;&nbsp;<A href="http://www.la-bor.it/"><IMG 
      src="_pgImg/labor.jpg" width=120 
      border=0></A>
          <P>&nbsp;&nbsp;&nbsp;&nbsp;<A 
      href="http://www.pierogiacomelli.com/files.php?nomedir=%2Fusr%2Flocal%2Fwww%2Fdata%2Ffiles%2Fclassifiche"><IMG 
      src="_pgImg/classifiche.jpg" 
      width=120 border=0></A>
          <P>&nbsp;&nbsp;&nbsp;&nbsp;<A href="http://www.fulviomassini.it/"><IMG 
      src="_pgImg/massini1.jpg" width=120 
      border=0></A>
          <P>&nbsp;&nbsp;&nbsp;&nbsp;<A href="http://www.retema.net/"><IMG 
      src="_pgImg/retema.jpg" width=120 
      border=0></A>
          <P>&nbsp;&nbsp;&nbsp;&nbsp;<A href="http://www.lions108la.it/"><IMG 
      src="_pgImg/lions001.jpg" width=120 
      border=0></A>
          <P>&nbsp;&nbsp;&nbsp;&nbsp;<A 
      href="http://www.pierogiacomelli.com/riv-atletica.php"><IMG 
      src="_pgImg/atletica.jpg" width=120 
      border=0></A>
          <P>&nbsp;&nbsp;&nbsp;&nbsp;<A href="http://www.amicidifrancesco.it/"><IMG 
      src="_pgImg/adf.jpg" width=120 
      border=0></A>
          <P>&nbsp;&nbsp;&nbsp;&nbsp;<A href="http://www.corridori.net/"><IMG 
      src="_pgImg/corridori.gif" width=120 
      border=0></A>
          <P>&nbsp;&nbsp;&nbsp;&nbsp;<A href="http://www.ail.it/"><IMG 
      src="_pgImg/ail.jpg" width=120 
      border=0></A>
          <P>&nbsp;&nbsp;&nbsp;&nbsp;<A href="http://www.aimac.it/"><IMG 
      src="_pgImg/aimac.jpg" width=120 
      border=0></A>
          <P>&nbsp;&nbsp;&nbsp;&nbsp;<A 
      href="http://www.pierogiacomelli.com/riv-spiridon.php"><IMG 
      src="_pgImg/spiridon.jpg" width=120 
      border=0></A>
          <P>&nbsp;&nbsp;&nbsp;&nbsp;<A 
      href="http://www.mediauisp.it/vivicitta_2007.htm"><IMG 
      src="_pgImg/vivicitta.png" width=120 
      border=0></A>
          <P>&nbsp;&nbsp;&nbsp;&nbsp;<A 
      href="http://www.ecomarathon.it/elba.asp"><IMG 
      src="_pgImg/elba.gif" width=120 
      border=0></A>
          <P>&nbsp;&nbsp;&nbsp;&nbsp;<A href="http://www.pistoia-abetone.com/"><IMG 
      src="_pgImg/pistoia.jpg" width=120 
      border=0></A>
          <P>&nbsp;&nbsp;&nbsp;&nbsp;<A href="http://www.pierogiacomelli.com/"><IMG 
      src="_pgImg/home.jpg" width=120 
      border=0></A>
          <P></P>
        </DIV></TD>
      <TD><!-- ------------------------------------------------------------------------ -->
        <DIV id=bodyText>
          <DIV class=boxedLight align=left><!-- InstanceBeginEditable name="body" --><form method="post" action="Logon.abl" name="logon" onSubmit="if(checkLogonFields()) conferma();else return false;" >
    <input type="hidden" name="cmdIU">
    <input type="hidden" name="actIU">
    <input type="hidden" name="cmd2">
    <input type="hidden" name="act2">
<acx:if_logon_ok>Bentornato <%= utenteLogon.getCognome() %>&nbsp;<%= utenteLogon.getNome() %></acx:if_logon_ok>
<acx:else_logon>
Se sei un utente registrato inserisci il tuo login e la tua password. Altrimenti registrati <a href="Registra.abl" style="font-weight: bold; font-size: 150%">qui
  </a>
<br><br>
<span style="font-weight: bold">ARCHIVIO FOTOGRAFICO ETS REGALAMI UN SORRISO.<br><br> 
SE ANCORA NON SEI REGISTRATO EFFETTUA LA NUOVA REGISTRAZIONE CLICCANDO SU -----> <a href="Registra.abl" style="color:#ED0C0C;">NUOVA REGISTRAZIONE</a></span>
<br><br>
<table border="0" cellpadding="2" cellspacing="2" class="testoNormale" style="HEIGHT: 59px; WIDTH: 227px">
                      <tr>
                        <td align="left" nowrap><strong><font color="#6699FF" face="Tahoma">Utente 
                          :</font></strong> </td>
                        <td align="left"><input maxlength="20" name="login" size="22" style="FONT-FAMILY: Tahoma; FONT-SIZE: 10pt">                        </td>
                      </tr>
                      <tr>
                        <td align="left" nowrap><font color="Black" face="Tahoma"><strong><font color="#6699FF">Password 
                          :</font></strong></font> </td>
                        <td align="left"><input name="pwd" type="password" id="pwd" style="FONT-FAMILY: Tahoma; FONT-SIZE: 10pt" size="22" maxlength="20">                        </td>
                      </tr>
                      <tr>
                        <td align="left" nowrap>&nbsp;</td>
                        <td align="left"><div align="right"><a href="javascript:conferma();"><strong>Conferma</strong></a>&nbsp;<input type="image" border="0" name="imageField" src="../admin/img/submit.gif" width="4" height="4">      </div></td>
                      </tr>
              </table></acx:else_logon>
          </form><%=msg %><!-- InstanceEndEditable -->
            </P>
          </DIV>
        </DIV>
        <!-- ------------------------------------------------------------------------ -->
    </TR>
  </TBODY>
</TABLE>
<DIV id=footer>
  <DIV>Modified: 19-03-2006&nbsp;| Original designer: <A title="Email author" 
href="http://www.oswd.org/email.phtml?user=haran">haran</A>&nbsp;| Current 
    mantainer: <A title=www.ablia.com href="http://www.ablia.com/">Gianmarco - 
    Ablia</A>&nbsp;| Powered by : <A href="http://www.freebsd.org/">FreeBSD</A> </DIV>
</DIV>
<!-- ------------------------------------------------------------------------ -->
<script type="text/javascript" src="//cookie.ablia.net/_js_cookie/pg/_cdReady.js"></script>
</BODY>
<!-- InstanceEnd --></HTML>
