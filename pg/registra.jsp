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
<script language="JavaScript" src="_js/pg-registrazione.js"></script> 
<!-- #EndEditable --> <!-- InstanceBeginEditable name="utenteLogon" -->
<jsp:useBean id="utenteLogon" class="it.acxent.pg.Users" type="it.acxent.pg.Users" scope="session" >
</jsp:useBean>
<!-- InstanceEndEditable --> <!-- InstanceBeginEditable name="Bean" -->
<jsp:useBean id="bean" class="it.acxent.pg.Users" type="it.acxent.pg.Users" scope="request" >
</jsp:useBean>
<jsp:useBean id="list" scope="request" class="it.acxent.util.Vectumerator" type="it.acxent.util.Vectumerator">
</jsp:useBean>
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
          <DIV class=boxedLight align=left><!-- InstanceBeginEditable name="body" -->
		  <FORM action=Registra.abl method=post name=dettaglio id="dettaglio" onSubmit="return controlloRegistrazione();">
		    <p>Se sei gia' un Socio ETS REGALAMI UN SORRISO, vai alla<a href="logonOld.jsp"> pagina di login</a>, altrimenti leggi attentamente quanto segue e registrati.</p>
		    <p>La concessione della <B>password</B> di accesso a questo sito e' subordinata alla <B>presa 
		      visione</B> e alla <B>accettazione</B> di quanto segue: </p>
		    <P>- L'utilizzo della <B>password</B> e' strettamente personale e riservata ai soli soci ETS REGALAMI UN SORRISO,<p>
      - E' esclusivamente consentito condividere immagini che contengano la propria 
      persona ( anche in un contesto d'insieme con altre ).<BR>- L'impiego delle 
      immagini condivise deve essere esclusivamente personale e privato; 
      diversamente si dovra' chiederne anticipatamente autorizzazione al 
      titolare del presente sito.<BR>- Si avverte che l'uso non corretto delle 
      immagini puo' violare l'altrui privacy e 
      pertanto, conseguentemente, portare ad essere vittima di sanzioni, anche 
      di natura penale, in ottemperanza di quanto disposto degli artt. 167,169 e 
      170 del D.Lgs. 196/03.<BR>-Il titolare di questo sito si riserba il 
      diritto di effettuare verifiche, attraverso i propri mezzi informatici, 
      sulle corrette procedure di gestione delle immagini. 
      <P align=center><span class="normal">Accetto
          <input type="checkbox"  <%= bean.getFlgPrivComunicazione()==1?"checked":""%> name="ckFlgPrivComunicazione" >
      <input type="hidden" name="flgPrivComunicazione" value="<%=bean.getFlgPrivComunicazione()%>">
      </span>
      <P>Il Legale Rappresentante di questo sito, Presidente della ETS REGALAMI UN SORRISO, Responsabile del Sistema di 
      Trattamento Dati Sig. Giacomelli Piero utilizzera' i dati personali 
      acquisiti solo con modalita' e procedure strettamente necessarie alle 
      finalita' per le quali sono stati raccolti. Per taluni servizi vengono 
      utilizzate societa' e/o addetti da noi autorizzate; quali titolari 
      autonomi che svolgono per ns. conto compiti di natura 
      tecnico-organizzativa, consulenziale nonche' informativa nell'ambito delle 
      finalita' richiamate.
      <P>Il titolare del trattamento e': <STRONG>ETS REGALAMI UN SORRISO</STRONG> Presidente  
      Giacomelli Piero
      <P>L'elenco di tali soggetti e' disponibile, costantemente aggiornato, 
      presso gli uffici della ns. Sede in Via Botticelli, 27 59100 Prato (PO) 
      dove e' possibile rivolgersi per qualsiasi informazione e/o comunicazione.
      <P>In particolare ai sensi degli artt. 7,8,10 e 13 del D,Lgs 196/03, Lei 
      ha il diritto di conoscere quali sono i Suoi dati in ns. possesso e come 
      vengono utilizzati; ha inoltre il diritto di integrare, rettificare o 
      concellare, chiedere il blocco ed eventualmente opporsi al loro 
      trattamento.
      <P align=center><span class="normal">Accetto
          <input type="checkbox"  <%= bean.getFlgPrivTrattamento()==1?"checked":""%> name="ckFlgPrivTrattamento" >
          <input type="hidden" name="flgPrivTrattamento" value="<%=bean.getFlgPrivTrattamento()%>">
      </span>
      <P>
      <HR width="100%">

      <P>ATTENZIONE:<BR>
      
      IL SERVER FOTOGRAFICO E LA CONDIVISIONE DELLE FOTO E' ESCLUSIVAMENTE DESTINATO AI SOCI<br>
      DELLA ETS REGALAMI UN SORRISO<br><br>
      CON QUESTA PROCEDURA SI DIVENTA UN SOCIO ETS REGALAMI UN SORRISO<br>
      ALTRIMENTI NON E' POSSIBILE CONDIVIDERE LE FOTO<br>
      <br>
      PER POTER CONDIVIDERE LE FOTO E' NECESSARIO ESSERE SOCI  DELLA ETS <br>
      
      CONDIVIDERE LE FOTO NON VUOL DIRE ACQUISTARE LE FOTO,<br>
      LA ETS REGALAMI UN SORRISO NON VENDE LE FOTO, LE CONDIVIDE SOLO CON I SOCI.<br>
      LE FOTO SONO DI ESCLUSIVA PROPRIETA' DELLA ETS E NON SONO CEDUTE A NESSUN TITOLO.<br>
      <br>
      - Con un contributo liberale di 20 Euro puoi diventare SOCIO della ETS<br>
        avrai il diritto di condividere 1000 foto in 1 anno<br>
      
      - La conferma della registrazione, con Login e password da voi scelti, saranno inviati all'email fornita<BR>
      - Il Login non deve essere la vostra email, la Password non deve avere caratteri grafici o spazzi<br>
      - Siate certi della correttezza della vostra email altrimenti non riceverete mai la nostra risposta<br>
      - Al termine, se tutto e' stato effettuato correttamente, Vi apparira' a video la conferma dei dati inseriti <br>
      - Se i dati non sono corretti scrivete a foto.atletica.immagine@gmail.com <br>
      - Un volta ricevuta la nostra email dovete confermare la registrazione cliccando, 1 sola volta, sull'apposito link <br>
      - L'email deve essere scritta correttamente tutta in minuscolo<BR>
      - Consulta le nostre specifiche sulla <A 
      href="http://www.pierogiacomelli.com/privacy.php">privacy</A><BR>
      - I dati 
      necessari sono scritti in <FONT color=red>rosso</FONT>.
      
      <P>
      <TABLE width="100%">
        <TBODY>
        <TR>
          <TD align=left width="20%"><FONT color=red>Login</FONT>
          <TD align=left width="80%"><INPUT name=login id="login" value="<%=bean.getLogin()%>" size=40 maxLength=60>
        <TR>
		        <TR>
          <TD align=left width="20%"><FONT color=red>Password</FONT>
          <TD align=left width="80%"><INPUT name=pwd id="pwd" value="<%=bean.getPwd()%>" size=40 maxLength=60>
        <TR>
		        <TR>
          <TD align=left width="20%"><FONT color=red>Nome</FONT>
          <TD align=left width="80%"><INPUT name=nome value="<%=bean.getNome()%>" size=40 maxLength=60>
        <TR>
          <TD align=left width="20%"><FONT color=red>Cognome</FONT>
          <TD align=left width="80%"><INPUT name=cognome value="<%=bean.getCognome()%>" size=40 maxLength=60>
        <TR>
          <TD align=left width="20%"><FONT color=red>Email</FONT>
          <TD align=left width="80%"><INPUT name=eMail id="eMail" value="<%=bean.getEMail()%>" size=40 maxLength=60>
        <TR>
          <TD align=left width="20%"><FONT color=red>Citta'</FONT>
          <TD align=left width="80%"><INPUT name=citta value="<%=bean.getCitta()%>" size=40 maxLength=60>
      <TR>
          <TD align=left width="20%"><FONT color=red>Via</FONT>
          <TD align=left width="80%"><INPUT name=indirizzo id="indirizzo" value="<%=bean.getIndirizzo()%>" size=40 maxLength=60> 
            num. 
              <INPUT name=numeroCivico id="numeroCivico" value="<%=bean.getNumeroCivico()%>" size=4 maxLength=10>
        <TR>
          <TD align=left><FONT color=red>Codice Fiscale </FONT>        
          <TD align=left><INPUT name=codFisc id="codFisc" value="<%=bean.getCodFisc()%>" size=40 maxLength=60>        
        <TR>
          <TD align=left width="20%"><FONT color=red>Telefono</FONT>
          <TD align=left width="80%"><INPUT 
name=telefono value="<%=bean.getTelefono()%>" size=40 maxLength=60>
        <TR>
          <TD align=left width="20%"><FONT color=red>Gruppo Sportivo</FONT>
          <TD align=left width="80%"><INPUT name=contatto id="contatto" value="<%=bean.getContatto()%>" size=40 maxLength=60>
        <TR>
          <TD align=left width="20%"><FONT color=red>Motivo della 
            richiesta</FONT>
          <TD align=left width="80%"><INPUT 
        name=nota id="nota" value="<%=bean.getNota()%>" size=40 maxLength=60></TR></TBODY></TABLE>
      <P><input type="submit" name="Submit2" value="Confermo quanto sopra e invio richiesta" class="small"> 
      <input type="hidden" name="id_users" value="<%=bean.getId_users() %>">
      <input name="id_userProfile" type="hidden" id="id_userProfile" value="9">
                          <input type="hidden" name="flgValido" value="<%=bean.getFlgValido()%>">
                          <input type="hidden" name="id_profiloUtente" value="9">
                          <input type="hidden" name="act" value="save">   
                          <input type="hidden" name="cmd" value="asq">
                          <br>
     <font color="#FF0000"><%=msg%></font></span> 
		  </FORM><!-- InstanceEndEditable -->
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
