<!DOCTYPE html>
<jsp:useBean id="lang" class="java.lang.String" type="java.lang.String" scope="session" >
</jsp:useBean><%@page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/acxent.tld" prefix="acx" %>
<%@ taglib uri="/WEB-INF/art.tld" prefix="art" %>
<%@ taglib uri="/WEB-INF/pg.tld" prefix="pg" %>
<%@ page language="java" import="it.acxent.jsp.Ab" %>
<%@ taglib uri="/WEB-INF/cc.tld" prefix="cc" %>
<html lang="<%=lang%>"><!-- InstanceBegin template="/Templates/rus.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<jsp:include page="_inc_lang.jsp"  flush="true"  />

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<!-- [favicon] begin -->
<link rel="shortcut icon" type="image/x-icon" href="images/favicon.ico"/>
<link rel="icon" type="image/x-icon" href="images/favicon.ico" />
<!-- [favicon] end -->
<!-- JSP -->
<jsp:useBean id="_listaLangAtt" class="it.acxent.util.Vectumerator" type="it.acxent.util.Vectumerator" scope="session">
</jsp:useBean>
<jsp:useBean id="utenteLogon" class="it.acxent.anag.Users" type="it.acxent.anag.Users" scope="session" >
</jsp:useBean>
<jsp:useBean id="msg" class="java.lang.String" type="java.lang.String" scope="request" >
</jsp:useBean>
<jsp:useBean id="df" class="it.acxent.util.SimpleDateFormat" scope="request" type="it.acxent.util.SimpleDateFormat">
</jsp:useBean>
<jsp:useBean id="cart" scope="session" type=   "it.acxent.cart.Cart" class="it.acxent.cart.Cart" >
</jsp:useBean>
<jsp:useBean id="cartStatus" scope="request" type="it.acxent.cart.CartStatus" class="it.acxent.cart.CartStatus" >
</jsp:useBean>
<jsp:useBean id="CR" scope="request" type="it.acxent.pg.FotoCR" class="it.acxent.pg.FotoCR" >
</jsp:useBean>
<cc:attivita/>
<jsp:useBean id="attivita" class="it.acxent.cc.Attivita" type="it.acxent.cc.Attivita" scope="session">
</jsp:useBean>
<!-- InstanceBeginEditable name="Bean" -->
<%@ taglib uri="/WEB-INF/news.tld" prefix="news" %>
<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="doctitle" -->
<title><acx:lang>Regalami Un Sorriso ETS - Correndo, sognando e... lottando - Cookies</acx:lang></title>
<!-- InstanceEndEditable -->

<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- FontAwesome Icons -->
<link rel="stylesheet" href="css/font-awesome.min.css">
<!-- Roboto Font -->
<link href="https://fonts.googleapis.com/css?family=Roboto:300,300i,400,400i,700,700i" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="css/custom-style.css" rel="stylesheet">
<!-- Css Datepicker -->
<link href="addons/datepicker/css/bootstrap-datepicker.standalone.min.css" rel="stylesheet">
<link  rel="stylesheet"  href='admin/_V4/_css/ajaxLoading.css'>
<!-- InstanceBeginEditable name="head" -->
<!-- InstanceEndEditable -->
<jsp:include page="_inc_cookie.jsp" flush="true" />
<jsp:include page="_inc_head.jsp" flush="true" />
</head>
<body>
<!-- Page Content -->
<!-- InstanceBeginEditable name="main" --><jsp:include page="_inc_header.jsp"  flush="true" >
  	<jsp:param name="menuAttivo" value="privacy"/>
</jsp:include>
<div class="container my-3">
  <div class="row">
    <div class="col-lg-12 my-4">
      <h1 class="my-3">COOKIE POLICY REGARDING PERSONAL DATA PROTECTION PURSUANT TO ART. 13 LEGISLATIVE DECREE NO. 196/2003</h1>
      <div class="row">
        <div class="col-lg-12 col-xs-12">
          <div>
            <div>
              <p>In compliance with the provisions of Articles 13 and 122 of Legislative Decree 30 June 2003, as well as with the General Provision of the Data Protection Authority dated 8 May 2014, users of the websites referenced by this document are hereby informed about the types of cookies used and the purposes pursued with the information acquired, also providing indications on how to select/deselect individual cookies.</p>
              <h2>WHAT COOKIES ARE AND WHAT THEY ARE USED FOR</h2>
              <p>A "cookie" is a small text file created by certain websites on the user’s computer when they access a particular site, in order to store and transport information. Cookies are sent by a web server (which is the computer where the visited website is running) to the user's browser (Internet Explorer, Mozilla Firefox, Google Chrome, etc.) and stored on the user’s computer; they are then sent back to the website upon subsequent visits.<br>
                Certain operations could not be performed without the use of cookies, which are therefore technically necessary in some cases. In other instances, the website uses cookies to facilitate and streamline navigation or to allow users to use specifically requested services.<br>
                Cookies may remain in the system for extended periods and may also contain a unique identification code. This allows sites that use them to track the navigation of the user within the site itself, for statistical or advertising purposes, that is, to create a customized profile for the user based on the pages visited and to show and/or send targeted advertising (so-called Behavioural Advertising).</p>
              <h2>WHICH COOKIES ARE USED AND FOR WHAT PURPOSES</h2>
              <p>The websites mentioned here use various types of technical cookies, but not profiling cookies.<br>
                The Controller, following the guidelines provided by the Data Protection Authority in the general provision of 8 May 2014, provides below the specific categories of cookies used, their purpose, and the consequence of their deselection:
             <table class="table">
  <thead class="thead-light">
  <tr>
                  <th>TYPE</th>
                  <th>PURPOSE</th>
                  <th>STORAGE TIME</th>
                  <th>CONSEQUENCE OF DESELECTION</th>
                </tr>
                </thead>
                <tr>
                  <td>Technical Cookies</td>
                  <td>Site management and enabling regular browsing and use</td>
                  <td>Browsing session</td>
                  <td>It would not be possible to continue browsing as these are strictly necessary cookies, so their deactivation is not possible</td>
                </tr>
                <tr>
                  <td>Analytics Cookies</td>
                  <td>Collect aggregated information on user navigation to optimize the browsing experience and services themselves.</td>
                  <td>2 years</td>
                  <td>The Controller would no longer be able to acquire aggregated information</td>
                </tr>
                <tr>
                  <td>Session Cookies</td>
                  <td>Session cookies of the framework used</td>
                  <td>Duration of the session (voluntary application closure) or browser closure</td>
                  <td>It would not be possible to allow secure and efficient site exploration</td>
                </tr>
              </table>
              <h2>THIRD-PARTY COOKIES</h2>
              <p>The referenced websites also operate third-party cookies, i.e., cookies created by a website other than the one the user is currently visiting.<br>
              As per the Data Protection Authority’s provision of 8 May 2014, the Controller is required to provide updated links to the privacy policies and consent forms of third parties with whom specific agreements have been entered for the installation of cookies via its websites.
              Third-party cookies are anonymous.<br>
              The use of anonymous third-party cookies is provided for; these cookies collect and record, in an anonymous form, information about the pages of each site visited, but do not allow the visitor to be identified, and are not combined with other information in any way. These data are used exclusively to track and examine website usage, to compile statistics based on information collected in aggregated and anonymous form.<br>
              In particular, users are informed that the web analysis service releasing cookies used by the Controller is "Google Analytics," as described below.<br>
              Google Analytics is a web analytics service provided by Google, Inc. ("Google") which uses "cookies" deposited on the user’s computer to allow the website to analyze how users use it. The information generated by the cookie about the user's use of the website (including the IP address) will be transmitted to and stored by Google on servers in the United States. Google will use this information for the purpose of tracking and examining site usage, compiling reports on website activity, and providing other services related to website activity and internet usage. Google may also transfer this information to third parties where required by law or where such third parties process the information on Google's behalf. Google will not associate the user's IP address with any other data held by Google. The user may, at any time, refuse to use cookies by selecting the appropriate settings on their browser.<br>
              For Google’s privacy policy regarding the Google Analytics service and to provide consent for the use of these cookies, please refer to the website: <a href="http://www.google.com/intl/en/analytics/privacyoverview.html">http://www.google.com/intl/en/analytics/privacyoverview.html</a>.<br>
              <p>Users are further informed that another service present on these sites that releases third-party cookies is Google Maps. The interactive maps provided by Google Maps allow users navigating the website to receive detailed information about the company’s location. Google Maps uses various cookies; the following links provide Google's combined privacy policy, including details about the cookies Google Maps may install on the user's computer or mobile device:</p>
              <p> <a href="http://www.google.si/policies/technologies/cookies/">http://www.google.si/policies/technologies/cookies/</a> <br>
                or<br>
                <a href="http://www.google.co.uk/intl/en-GB/policies/">http://www.google.co.uk/intl/en-GB/policies/</a></p>
              <p>Finally, users are informed that the website may embed videos from YouTube. These videos, once viewed, set third-party cookies on the user's computer or mobile device, belonging to the YouTube domain. The purpose of these cookies is described in Google's privacy policy available at the following link: <a href="https://www.google.it/intl/it/policies/technologies/cookies/">https://www.google.it/intl/it/policies/technologies/cookies/</a>.<br>
                Disabling these cookies will suspend the functions offered by these third parties.</p>
              <h2>SOCIAL BUTTONS</h2>
              <p>The website may feature special "buttons" (called social buttons/widgets) that display the icons of social networks (such as Facebook, etc.) and of other websites.<br>
                These buttons allow users browsing the site to interact directly with the social networks and other websites depicted, with a single "click".<br>
                In such cases, the social network and other websites acquire data relating to the user's visit, while the Controller will not share any navigation information or data acquired through its website with the social networks or other websites accessible via the social buttons/widgets.</p>
              <h2>DATA PROCESSING METHODS</h2>
              <p>Data processing is carried out by specially appointed internal personnel using computer and telematic tools. Data are stored in electronic archives, fully compliant with the minimum security measures established by law.</p>
              <h2>COMMUNICATION AND DISCLOSURE</h2>
              <p>The collected data will not be disclosed or disseminated.<br>
                Communication to third parties, other than the Controller, both internal and external to the structure, and those appointed for processing pursuant to Articles 29 and 30 of Legislative Decree No. 196/2003 and subsequent amendments, is foreseen only where necessary for the purposes described above, to third parties (such as IT supply and assistance companies) involved in the correct and regular achievement of the described purposes. In any case, processing by third parties will take place lawfully and in compliance with current legal provisions.</p>
              <h2>DATA SUBJECT’S RIGHTS</h2>
              <p>The data subject may exercise their rights as provided for by Articles 7, 8, 9, and 10 of Legislative Decree 30 June 2003, No. 196, by contacting the Data Controller. In particular, under Article 7, the data subject may obtain confirmation of the existence or absence of personal data concerning them, even if not yet recorded, and their communication in intelligible form.<br>
                The data subject is entitled to obtain the following: a) the origin of the personal data; b) the purposes and methods of processing; c) the logic applied in case of processing carried out with electronic instruments; d) the identification details of the controller, processors, and designated representative pursuant to Article 5, paragraph 2; e) the parties or categories of parties to whom the personal data may be communicated or who may become aware of them as designated representatives in the State, processors, or appointees. The data subject has the right to obtain: a) the updating, rectification, or, where interested, integration of data; b) the erasure, anonymisation or blocking of data processed unlawfully, including those which need not be kept for the purposes for which the data were collected or subsequently processed; c) certification that the operations as per letters a) and b) have been notified, also as regards their content, to those to whom the data were communicated or disseminated, except where this proves impossible or involves a manifestly disproportionate effort compared to the right being protected. The data subject has the right to object, in whole or in part: a) for legitimate reasons, to the processing of personal data concerning them, even if pertinent to the purpose of collection; b) to the processing of personal data concerning them for the sending of advertising materials or direct selling or for carrying out market research or commercial communication.</p>
              <h2>DATA CONTROLLER AND PROCESSOR</h2>
              <p>The Controller is the President of ETS REGALAMI UN SORRISO <strong>Piero Giacomelli</strong>, Via Torquato Tasso, 23/C 59100 Prato PO<br>
                An up-to-date list of data processors, appointed by the Controller pursuant to Article 29 of Legislative Decree 196/2003, is available at the registered office of the Controller.</p>
              <h2>RETENTION PERIODS</h2>
              <p>Data are retained for the period indicated in the above table in this document, and in any case until the data subject explicitly exercises their right to object.</p>
              <h2>COOKIE SELECTION AND ACTIVATION</h2>
              <p>By accessing the sites and moving beyond the initial banner containing the brief policy, the user has given their express consent to the use of the technical cookies expressly indicated in this document.<br>
                The selection/deselection of individual cookies can be freely carried out via the user’s browser (by selecting the settings menu, clicking on internet options, opening the privacy tab, and choosing the desired cookie blocking level).</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- /.container -->
<!-- InstanceEndEditable -->

<!-- Footer -->
 <jsp:include page="_inc_footer.jsp" flush="true" />

<script>
	$('#datepicker-sport').datepicker({
    language: "it"
});
	$('#datepicker-eventi').datepicker({
    language: "it"
});
		
	</script>
	<!-- InstanceBeginEditable name="lastStuff" -->
<!-- InstanceEndEditable -->
<div class="modal-loading"></div>
</body>
<!-- InstanceEnd --></html>
