//ver. 08/02/2007

var webApp="";
var locale="IT";

var loaded = 0;
/*var ns4=0;
var ie4=0;
var brow=0;
var browser=navigator.appName;
//window.toolbar=false;
//alert('Browser:'+navigator.appName);

ns4=(browser=='Netscape')?1:0;
ie4=(browser.search(/microsoft/i)!=-1)?2:0;

//ns4 = (document.layers) ? 1 : 0;
//ie4 = (document.all) ? 1 : 0;

ver4 = (ns4 || ie4) ? 1 : 0;
ns4==1?brow=2:brow=1;
*/

//**************** DETECT BROWSER **************************************************



//CS1.1

var exclude=1;
var agt=navigator.userAgent.toLowerCase();
var win=0;var mac=0;var lin=1;
if(agt.indexOf('win')!=-1){win=1;lin=0;}
if(agt.indexOf('mac')!=-1){mac=1;lin=0;}
var lnx=0;if(lin){lnx=1;}
var ice=0;
var ie=0;var ie4=0;var ie5=0;var ie6=0;var com=0;var dcm;
var op5=0;var op6=0;var op7=0;
var ns4=0;var ns6=0;var ns7=0;var mz7=0;var kde=0;var saf=0;
if(typeof navigator.vendor!="undefined" && navigator.vendor=="KDE"){
	var thisKDE=agt;
	var splitKDE=thisKDE.split("konqueror/");
	var aKDE=splitKDE[1].split("; ");
	var KDEn=parseFloat(aKDE[0]);
	if(KDEn>=2.2){
		kde=1;
		ns6=1;
		exclude=0;
		}
	}
else if(agt.indexOf('webtv')!=-1){exclude=1;}
else if(typeof window.opera!="undefined"){
	exclude=0;
	if(/opera[\/ ][5]/.test(agt)){op5=1;}
	if(/opera[\/ ][6]/.test(agt)){op6=1;}
	if(/opera[\/ ][7-9]/.test(agt)){op7=1;}
	}
else if(typeof document.all!="undefined"&&!kde){
	exclude=0;
	ie=1;
	if(typeof document.getElementById!="undefined"){
		ie5=1;
		if(agt.indexOf("msie 6")!=-1){
			ie6=1;
			dcm=document.compatMode;
			if(dcm!="BackCompat"){com=1;}
			}
		}
	else{ie4=1;}
	}
else if(typeof document.getElementById!="undefined"){
	exclude=0;
	if(agt.indexOf("netscape/6")!=-1||agt.indexOf("netscape6")!=-1){ns6=1;}
	else if(agt.indexOf("netscape/7")!=-1||agt.indexOf("netscape7")!=-1){ns6=1;ns7=1;}
	else if(agt.indexOf("gecko")!=-1){ns6=1;mz7=1;}
	if(agt.indexOf("safari")!=-1 || (typeof document.childNodes!="undefined" && typeof document.all=="undefined" && typeof navigator.taintEnabled=="undefined")){mz7=0;ns6=1;saf=1;}
	}
else if((agt.indexOf('mozilla')!=-1)&&(parseInt(navigator.appVersion)>=4)){
	exclude=0;
	ns4=1;
	if(typeof navigator.mimeTypes['*']=="undefined"){
		exclude=1;
		ns4=0;
		}
	}
if(agt.indexOf('escape')!=-1){exclude=1;ns4=0;}
if(typeof navigator.__ice_version!="undefined"){exclude=1;ie4=0;}


//alert("ns44 "+ns4 +" ie5 "+ie5+" mozz "+mz7);
//********************************************************
//********************************************************


//********************************************************
//********************************************************
//  S   T   A   R   T  
//********************************************************
//********************************************************
//********************************************************
var ggWinSW;
function startApp() {

	windowWidth="800";
	windowHeigth="600";
	windowTitle="Time_Report";
	startPage="menu/Menu.abl";
	ggWinSW = window.open(startPage, windowTitle,"width="+windowWidth+",height="+windowHeigth+",status=yes,resizable=yes,top=0,left=0,scrollbars=yes");
	//debug
	//ggWinSW = window.open();

	ggWinSW.opener = self;
	//window.close();
}

//********************************************************
//********************************************************
//  P  R  I  N  T    
//********************************************************
//********************************************************
//********************************************************
function printW()
{
	window.print();
	return true;

}
//////////////////////////////////////////////////////////
/// controlli salvataggi e cancellazione//////////////////
/////////////////////////////////////////////////////////
function confirmDelete()
{
	return confirm("I dati saranno cancellati. Vuoi continuare?")
	
}
/////////////////////////////////////////////////////
// gestione preve e next nelle liste con paginazione
/////////////////////////////////////////////////////
  
//caso maschere di ricerca
function prevPage()
{
	
	var f = document.ricerca;
	f.action=f.actionPage.value;
	f.cmd.value="search";
	f.pageNumber.value=f.pageNumber.value-1;
	f.target="" ;
	
	f.submit();
}

function nextPage()
{	
	var f = document.ricerca;
	f.action=f.actionPage.value;
	f.cmd.value="search";
	f.pageNumber.value=eval(f.pageNumber.value)+1;
	f.target="" ;
	
	//alert(f.pageNumber.value);
	f.submit();
}

function goPage(l_pageNumber)
{

        var f = document.ricerca;
        f.action=f.actionPage.value;
        f.cmd.value="search";
        f.pageNumber.value=l_pageNumber;
        f.target="" ;

        f.submit();
}

function goPage()
{
        goPageMod(document.ricerca);
}

function goPage2()
{
        goPageMod2(document.ricerca);
}

function goPageS()
{
        //per le pagine di tipo simple
        goPageMod(document.dettaglio);
}

function goPageMod(f)
{
        //var f = document.ricerca;
        if(parseFloat(f.pageNumberGo.value)<= parseFloat(f.totPageNumber.value))
        {
                f.action=f.actionPage.value;
                f.cmd.value="search";
                f.pageNumber.value=f.pageNumberGo.value;
                f.target="" ;

                f.submit();
        }
        else
        alert('Errore!!');

}
function goPageMod2(f)
{
        //var f = document.ricerca;
        if(parseFloat(f.pageNumberGo2.value)<= parseFloat(f.totPageNumber.value))
        {
                f.action=f.actionPage.value;
                f.cmd.value="search";
                f.pageNumber.value=f.pageNumberGo2.value;
                f.target="" ;

                f.submit();
        }
        else
        alert('Errore!!');
}


//caso finestre secondarie di ricerca

function prevPageSW()
{
	
	var f = document.ricerca;
	f.act.value="sw";
	prevPage();
}

function nextPageSW()
{
	
	var f = document.ricerca;
	f.act.value="sw";
	nextPage();
}
function goPageSW(l_pageNumber)
{
	
	var f = document.ricerca;
	f.action=f.actionPage.value;
	f.act.value="sw";
	goPage(l_pageNumber);
}

//caso maschere di dettaglio per liste secondarie
function prevPageDetail(searchType)
{
	var f = document.dettaglio;
	f.action=f.actionPage.value;
	f.cmd.value="md";
	f.act.value=searchType;
	f.pageNumber.value=f.pageNumber.value-1;
	f.submit();
}

function nextPageDetail(searchType)
{
	var f = document.dettaglio;
	f.action=f.actionPage.value;
	f.cmd.value="md";
	f.act.value=searchType;
	f.pageNumber.value=eval(f.pageNumber.value)+1;
	f.submit();
}
function goPageDetail(l_pageNumber)
{
	var f = document.dettaglio;
	f.action=f.actionPage.value;
	f.cmd.value="md";
	f.pageNumber.value=l_pageNumber;
	//alert(f.pageNumber.value);
	f.submit();
}
//////////////////////////////////////////////////////////
/// gestione layers ///////////////////7//////////////////
/////////////////////////////////////////////////////////
function bkgMenu(menuName,color) {
      if (ns4 || mz7) {
 	     	screenWidth = window.innerWidth;
 		document.layers[menuName].background = color;
      } else {
		screenWidth = document.body.clientWidth;
      		document.all[menuName].style.background = color;
  
    }

}
///////////////////////////////////////////////
///////////////////////////////////////////////
function popUp(menuName,left,top) {
///////////////////////////////////////////////
///////////////////////////////////////////////
toleft =typeof left;
totop =typeof top;
      if (ns4==1) {
      screenWidth = window.innerWidth;
      if (left!=0 && toleft  != "undefined")
      {
      //	document.layers[menuName].left = left;
      }
      if(top!=0 && totop != "undefined")
      {
       //document.layers[menuName].top = top;
      }
 

     // alert(document.layers[menuName].visibility );
      document.layers[menuName].visibility = "show";
      //alert(document.layers[menuName].visibility );

      } else {
      screenWidth = document.body.clientWidth;
      if(left!=0 && toleft  != "undefined")
      {//alert('l='+left);
       document.getElementById(menuName).style.pixelLeft = left;
      }
      if(top!=0 && totop != "undefined")
      {//alert('pio2');
       document.getElementById(menuName).style.pixelTop = top;
      }
	
      document.getElementById(menuName).style.visibility = "visible";

 
    }
	//registrazione di current tab
	  if ((ct=findObj('currentTab'))!=null)
   	  {
	  		ct.value=menuName;
			//alert(menuName);
	  }
	
}
      
function popDown(menuName) 
{
	if (ns4 ) {
		document.layers[menuName].visibility = "hide";
	} else {
		//alert("down"+document.getElementById(menuName).style.visibility);
		document.getElementById(menuName).style.visibility = "hidden";
	}
}

function motionListener(){

      if (ns4 || mz7) {
	      window.captureEvents(Event.MOUSEMOVE);
      	window.onmousemove = grabXY;
	} else {
	document.onmousemove = grabXY;
	}
}

function grabXY(ev){
 
     if (ns4 || mz7) {
	coordx=ev.pageX;
      	coordy=ev.pageY
	} else {
	coordx=event.clientX;
      	coordy=event.clientY;
	}
}
      
function openWin(URL){
        aWindow=window.open(URL,"listwindow", "resizable=yes,scrollbars=yes,status=0,width=200,height=100");
}

function newWindow(mypage, myname, w, h, scroll) {
	var winl = (screen.width - w) / 2;
	var wint = (screen.height - h) / 2;
	winprops = 'height='+h+',width='+w+',top='+wint+',left='+winl+',scrollbars='+scroll+',resizable';
	//alert (mypage+" "+myname+" "+ winprops);
	win = window.open(mypage, myname, winprops);
	
if (parseInt(navigator.appVersion) >= 4) 
	{ 
		win.window.focus();
	}
}


motionListener();

/////////////////////////////////////////7
/////////////////////////////////////////7
function leftCenter(menuName)
/////////////////////////////////////////7
/////////////////////////////////////////7
{
left=0;

if (ns4 || mz7) {
 
      screenWidth = window.innerWidth;
	//alert('ns mnuname'+menuName);
      layerWidth=parseInt(document.layers[menuName].clip.width);

	//alert('dopowidth');
    
      } else {
	
      screenWidth = document.body.clientWidth;
	layerWidth=parseInt(document.getElementById(menuName).style.width);
    }

//	alert('lw='+layerWidth);
//	alert(screenWidth);

//	alert('left='+left);
      left=(screenWidth -layerWidth)/2;
      if (left<=0)
      {
      	//alert('left;'+left);
      	left=1;
      }
	return left;


}

//////////////////////////////////////////////////////////
/// swap image ///////////////////////////////////////////
/////////////////////////////////////////////////////////
function MM_preloadImages() 
{ //v3.0

  var d=document; 
  if(d.images)
  {
    if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; 
    for(i=0; i<a.length; i++)
      if (a[i].indexOf("#")!=0)
      {
        d.MM_p[j]=new Image;
	//alert('loading:'+a[i]);
        d.MM_p[j++].src=a[i];
      }
  }
}

function swapImgRestore() 
{ //v3.0
  var i,x,a=document.sr;
  for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) 
  x.src=x.oSrc;
}



function swapImage() 
{ //v3.0
  var i,j=0,x,a=swapImage.arguments;
  document.sr=new Array;
  for(i=0;i<(a.length-2);i+=3)
	{
	   if ((x=findObj(a[i]))!=null)
   		{
		  
			 document.sr[j++]=x;
			 if(!x.oSrc)
			   x.oSrc=x.src;
			 x.src=a[i+2];
	   }
	}
}


//motionListener();

//////////////////////////////////////////////////////////
/// valida form //////////////////////////////////////////
/////////////////////////////////////////////////////////

function findObj(n, d) 
{ //v3.0
  var p,i,x;
  if(!d) 
    d=document;
  if((p=n.indexOf("?"))>0&&parent.frames.length)
  {
    d=parent.frames[n.substring(p+1)].document;
    n=n.substring(0,p);
  }
  
  if(!(x=d[n])&&d.all) 
    x=d.all[n]; 
  for (i=0;!x&&i<d.forms.length;i++) 
    x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) 
    x=findObj(n,d.layers[i].document); 
  return x;
}
function validateForm2() { //v3.0
	//R per required
	//isNum per numerico
	//isNum>x per numerico maggiore di x
	//isNum<x per numerico minore di x
	//isEmail per indirizzo email
	//inRange1:10 per ..
	//3 stringhe
	//1: nome del field
	//2: se '' visualizza il nome del field, altrimenti questo campo
	//3: R/N+''/isNum/isEmail/inRangea:b
//
//esempi
//	validateForm2('nomeform,'textfield','','R','textfield2','','NisNum','textfield3','','NisEmail','textfield4','','RinRange2:10')
//
  var i,p,q,nm,nf,desc,test,testN,num,min,max,errors='',args=validateForm2.arguments;
  nf=args[0];
  //alert('forms'+nf);
  for (i=1; i<(args.length-2); i+=3) 
  { 
  		test=args[i+2]; 
		//val=findObj(args[i]);
		val=document[nf][args[i]];
		
		if(args[i+1]=="")
			desc=val.name;
		else
			desc=args[i+1];
			
    	if (val) { nm=val.name; if ((val=val.value)!="") 
		{
      		if (test.indexOf('isEmail')!=-1) 
			{ 
				p=val.indexOf('@');
        		if (p<1 || p==(val.length-1)) errors+='- '+desc+' non è un indirizzo valido.\n';
      		} 
			else if (test!='R') 
			{ 
				//alert(val);
				if(locale=="IT")
				{
					
					val=val.replace(/[.]/,'');
					val=val.replace(/[.]/,'');
					val=val.replace(/[.]/,'');
					val=val.replace(/[.]/,'');
					val=val.replace(',','.');
					//tolgo gli zeri finali
					var dotIdx=val.indexOf('.');
					//alert("dotidx0"+dotIdx);
					if(dotIdx!=-1)
					{
						var j=val.length-1;
					/*	while(val.charAt(i)!='.' && val.charAt(i)=='0' ) NON FUNZIONA.. forse perche' usavo i invece di j!!*/
						while(val.charAt(j)!='.' )
						{
						//alert("j="+j+" val charat(j):"+val.charAt(j));
							if(val.charAt(j)=='0')
							{
								val=val.substr(0,j);
								j--;
							}
							else j=dotIdx;
						}
						if(val.charAt(val.length-1)=='.')
							val=val.substr(0,val.length-1);
					}
				}
				else if(locale=="US" || locale=="UK")
				{
					val=val.replace(/[,]/,'');
					val=val.replace(/[,]/,'');
					val=val.replace(/[,]/,'');
					val=val.replace(/[,]/,'');
					val=val.replace('.',',');
					//tolgo gli zeri finali
					var dotIdx=val.indexOf(',');
					if(dotIdx!=-1){
						var j=val.length-1;
						while(val.charAt(j)!=',')
						{
							if(val.charAt(j)=='0')
							{
								val=val.substr(0,j);
								j--;
							}
							else
							 j=dotIdx;
						}
						if(val.charAt(val.length-1)==',')
							val=val.substr(0,val.length-1);
					}					
					//alert("US:"+val);
				}
				
			
				//da correggere il caso 33,40 Non mi accetta lo 0 finale!!!'

				num = parseFloat(val);
				//alert('num:'+num);
				
        //		if (val!=''+num && val!=''+num +'0'&& val!=''+num +'00'&& val!=''+num +'000' ) errors+='- '+desc+' non è numerico.\n';
				if (val!=''+num) errors+='- '+desc+' non è numerico.\n';
				if(test.search(/[><]/) != -1 )
				{
					if (test.charAt(0) == 'R')
					{
						testN=test.substring(7,test.length);
					}
					else
					{
						testN=test.substring(6,test.length);
					}
					//alert('test:'+test+' tn: '+testN+" num: "+num +" pftn: "+parseFloat(testN));
					if(test.indexOf('>') !=-1 && num <= parseFloat(testN)) errors+='- '+desc+' è <= '+testN+'.\n';
					if(test.indexOf('<') !=-1 && num >= parseFloat(testN)) errors+='- '+desc+' è >= '+testN+'.\n';
				}
        		if (test.indexOf('inRange') != -1) 
				{ 
					p=test.indexOf(':');
          			min=test.substring(8,p); 
					max=test.substring(p+1);
          			if (num<min || max<num) errors+='- '+desc+' deve essere un numero tra '+min+' e '+max+'.\n';
    			} 
			} 
		} 
		else if (test.charAt(0) == 'R') errors += '- '+desc+' è obbligatorio.\n'; }
  } 
  if (errors) alert('Il form contiene i seguenti errori:\n'+errors);
  return (errors == '');
  

}


function validateForm() { //v3.0 23/07/2002
	//R per required
	//isNum per numerico
	//isNum>x per numerico maggiore di x
	//isNum<x per numerico minore di x
	//isEmail per indirizzo email
	//inRange1:10 per ..
	//3 stringhe
	//1: nome del field
	//2: se '' visualizza il nome del field, altrimenti questo campo
	//3: R/N+''/isNum/isEmail/inRangea:b
//
//esempi
//	validateForm('textfield','','R','textfield2','','NisNum','textfield3','','NisEmail','textfield4','','RinRange2:10')
//
  var i,p,q,nm,desc,test,testN,num,min,max,errors='',args=validateForm.arguments;
  for (i=0; i<(args.length-2); i+=3) 
  { 
  		test=args[i+2]; 
		val=findObj(args[i]);
		if(args[i+1]=="")
			desc=val.name;
		else
			desc=args[i+1];
			
    	if (val) { nm=val.name; if ((val=val.value)!="") 
		{
      		if (test.indexOf('isEmail')!=-1) 
			{ 
				p=val.indexOf('@');
        		if (p<1 || p==(val.length-1)) errors+='- '+desc+' non è un indirizzo valido.\n';
      		} 
			else if (test!='R') 
			{ 
				//alert(val);
				if(locale=="IT")
				{
					
					val=val.replace(/[.]/,'');
					val=val.replace(/[.]/,'');
					val=val.replace(/[.]/,'');
					val=val.replace(/[.]/,'');
					val=val.replace(',','.');
					//tolgo gli zeri finali
					var dotIdx=val.indexOf('.');
					//alert("dotidx0"+dotIdx);
					if(dotIdx!=-1)
					{
						var j=val.length-1;
					/*	while(val.charAt(i)!='.' && val.charAt(i)=='0' ) NON FUNZIONA.. forse perche' usavo i invece di j!!*/
						while(val.charAt(j)!='.' )
						{
						//alert("j="+j+" val charat(j):"+val.charAt(j));
							if(val.charAt(j)=='0')
							{
								val=val.substr(0,j);
								j--;
							}
							else j=dotIdx;
						}
						if(val.charAt(val.length-1)=='.')
							val=val.substr(0,val.length-1);
					}
				}
				else if(locale=="US" || locale=="UK")
				{
					val=val.replace(/[,]/,'');
					val=val.replace(/[,]/,'');
					val=val.replace(/[,]/,'');
					val=val.replace(/[,]/,'');
					val=val.replace('.',',');
					//tolgo gli zeri finali
					var dotIdx=val.indexOf(',');
					if(dotIdx!=-1){
						var j=val.length-1;
						while(val.charAt(j)!=',')
						{
							if(val.charAt(j)=='0')
							{
								val=val.substr(0,j);
								j--;
							}
							else
							 j=dotIdx;
						}
						if(val.charAt(val.length-1)==',')
							val=val.substr(0,val.length-1);
					}					
					//alert("US:"+val);
				}
				
			
				//da correggere il caso 33,40 Non mi accetta lo 0 finale!!!'

				num = parseFloat(val);
				//alert('num:'+num);
				
        //		if (val!=''+num && val!=''+num +'0'&& val!=''+num +'00'&& val!=''+num +'000' ) errors+='- '+desc+' non è numerico.\n';
				if (val!=''+num) errors+='- '+desc+' non è numerico.\n';
				if(test.search(/[><]/) != -1 )
				{
					if (test.charAt(0) == 'R')
					{
						testN=test.substring(7,test.length);
					}
					else
					{
						testN=test.substring(6,test.length);
					}
					//alert('test:'+test+' tn: '+testN+" num: "+num +" pftn: "+parseFloat(testN));
					if(test.indexOf('>') !=-1 && num <= parseFloat(testN)) errors+='- '+desc+' è <= '+testN+'.\n';
					if(test.indexOf('<') !=-1 && num >= parseFloat(testN)) errors+='- '+desc+' è >= '+testN+'.\n';
				}
        		if (test.indexOf('inRange') != -1) 
				{ 
					p=test.indexOf(':');
          			min=test.substring(8,p); 
					max=test.substring(p+1);
          			if (num<min || max<num) errors+='- '+desc+' deve essere un numero tra '+min+' e '+max+'.\n';
    			} 
			} 
		} 
		else if (test.charAt(0) == 'R') errors += '- '+desc+' è obbligatorio.\n'; }
  } 
  if (errors) alert('Il form contiene i seguenti errori:\n'+errors);
  return (errors == '');
  
}
//ckAll per combobox
function checkAll(f,ckAll)
   {
      for (var i=0;i<f.elements.length;i++)
      {
         var e = f.elements[i];
         if (e.name != ckAll)
            e.checked = f[ckAll].checked;
      }
   }

//funzioni di menu   
function callSvlt(theSvlt)
{	var f = document.menu;
	if (theSvlt.charAt(0)=="/")
	{	//path assoluto
		theSvlt=webApp+theSvlt;
	}
	f.action=theSvlt+".Svlt";
	f.cmd.value="search";
	f.submit();
}

function callAbl(theSvlt,theFrame,theCmd,theAct)
{
	
	
	var f = document.menu;
	//default
	var cmd="search";
	var act="";
	if(theCmd!=null)
		cmd=theCmd;
	if(theAct!=null)
		act=theAct;
	if (theSvlt.charAt(0)=="/")
	{//path assoluto
		theSvlt=webApp+theSvlt;
	}
	if(theFrame==null || !theFrame )
	{
		f.action=theSvlt+".abl";
		f.cmd.value=cmd;
		f.act.value=act;
		f.submit();
	}
	else
	{
		//preparo il location
		var loc=theSvlt+".abl";
		if(cmd!="" || act != "")
			loc=loc+"?";
		if(cmd!="")
			loc=loc+"cmd="+cmd;
		if(act!="")
			loc=loc+"&act="+act;
			//alert('loc='+loc);
		if(ns4 || mz7)
		{
			window.parent.frames[1].location.href=loc;
		}
		else
		{
			var theBody=document.parentWindow.top.frames[theFrame];
			//alert(theSvlt+".abl");
			theBody.location.href=loc;
		}
	}
}

 function closeWindow()
{
	if(confirm("Vuoi chiudere la finestra? (il record NON sarà aggiornato)"))
	window.close();
}
 function showTab(l_layer)
{
	//la funzione hideAll deve essere definita!!!
	hideAll();
	popUp(l_layer);
}


function getVal(field)
{
	
	var val=findObj(field);
	if (val)
		val=val.value;
	else
		val="";
	return val;
}
function clrField(modulo,id,desc)
{
	var f = document[modulo];
	f[id].value="";
	f[desc].value="";
	
	
}
