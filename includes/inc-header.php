<head>
<meta http-equiv="content-type" content="application/xhtml+xml; charset=utf-8" />

<!-- www.googlerank.it, ONLUS, foto, podismo, forum, atletica, piero giacomelli, pacemaker -->

<META NAME="TITLE" CONTENT="ONLUS REGALAMI UN SORRISO">
<META NAME="AUTHOR" CONTENT="piero@pierogiacomelli.com">
<META NAME="OWNER" CONTENT="foto.atletica.immagine@gmail.com">
<META NAME="SUBJECT" CONTENT="podismo, foto, fotografia, atletica">
<META NAME="RATING" CONTENT="general">
<META NAME="DESCRIPTION" CONTENT="ARCHIVIO FOTOGRAFICO DIGITALE, PHOTO WEB SERVER, ONLUS REGALAMI UN SORRISO, ATLETICA IMMAGINE, PIERO GIACOMELLI, FOTO PODISMO, FOTO SPORT,SPORT E SOLIDARIETA?  ">
<META NAME="ABSTRACT" CONTENT="ARCHIVIO FOTOGRAFICO DIGITALE, PHOTO WEB SERVER, ONLUS REGALAMI UN SORRISO, ATLETICA IMMAGINE">
<META NAME="KEYWORDS" CONTENT="ONLUS, foto, fotografia, regalami un sorriso, podismo, forum, atletica, piero giacomelli, pacemaker">
<META NAME="REVISIT-AFTER" CONTENT="10 DAYS">
<META NAME="GENERATOR" CONTENT="www.googlerank.it">
<META NAME="LANGUAGE" CONTENT="IT">
<META NAME="COPYRIGHT" CONTENT="atletica immagine">
<META NAME="ROBOTS" CONTENT="All">

<!--
<META NAME="description" CONTENT="ARCHIVIO FOTOGRAFICO DIGITALE, PHOTO WEB SERVER, ONLUS REGALAMI UN SORRISO, ATLETICA IMMAGINE">
<META NAME="keywords" CONTENT="ONLUS, foto, fotografia, regalami un sorriso, podismo, forum, atletica, piero giacomelli, pacemaker">
-->

<meta name="verify-v1" content="ICYRStN5317ctwUnjw7j5abeY4O6PQQ9SBTJHJUNu2k=" />

<title>Archivio Fotografico - Regalami un sorriso ONLUS - Forum - Riviste</title>

<link rel="stylesheet" type="text/css" href="css/gmarco.css"  title="Tierra Verde stylesheet" />
<link rel="stylesheet" type="text/css" href="css/fedele.css" />

<script type="text/javascript">

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

</script>


<script language="JavaScript" type="text/javascript">
<!--  
// prelevato ed illustrato su http://www.web-link.it
var message = new Array();
// Set your messages you want typed into the title bar below.
// To add more messages, just add more elements to the array.
message[0] = "Photo Web Server";
message[1] = "O N L U S";
message[2] = "REGALAMI UN SORRISO";
message[3] = "Forum";
message[4] = "Atletica Immagine";
message[5] = "www.pierogiacomelli.com";

// Set the number of repetitions (how many times a given message is typed out
// before moving onto the next message).
var reps = 1;
var speed = 200;// Set the overall typing speed (larger number = slower action).
var hold = 8 // set the length of time to display the whole phrase before retyping (larger number = longer)

// DO NOT EDIT BELOW THIS LINE.
var p = message.length;
var q = 0;
var r = 0;
var C = 0;
var mC = 0;
var s = 0;
var sT = null;

if (reps < 1) {
reps = 1;
}
function setMessage() {
typing = message[mC];
q = typing.length;
r = q + hold;
typeMessage();
}
function typeMessage() {
if (s > r) {
s = 0;
}
if (s > q) {
document.title = '|- '+ typing +' - - -';
}
else {
document.title = '|- '+ typing.substr(0,s)+' - - -';
}
if (C < (r * reps)) {
sT = setTimeout("typeMessage()", speed);
C++;
s++;
}
else {
C = 0;
s = 0;
mC++;
if(mC > p - 1) {mC = 0;}
sT = null;
setMessage();
   }
}
setMessage();
//  End -->
</script>

<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="//cookie.ablia.net/_js_cookie/jquery.browserLanguage.js"></script>
<script type="text/javascript" src="//cookie.ablia.net/_js_cookie/jquery.cookie.js"></script>
<script type="text/javascript" src="//cookie.ablia.net/_js_cookie/jquery.cookiesdirective.js"></script>
</head>
