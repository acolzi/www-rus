<!-- _inc_login_facebookSignin.jsp.jsp -->
<%@page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/acxent.tld" prefix="acx" %>
<%@ taglib uri="/WEB-INF/art.tld" prefix="art" %>
<%@ page language="java" import="it.acxent.jsp.*" %>

<jsp:useBean id="attivita" class="it.acxent.cc.Attivita" type="it.acxent.cc.Attivita" scope="session">
</jsp:useBean>
<jsp:useBean id="utenteLogon" class="it.acxent.anag.Users" type="it.acxent.anag.Users" scope="session">
</jsp:useBean>
<jsp:useBean id="msg" class="java.lang.String" type="java.lang.String" scope="request">
</jsp:useBean>
<jsp:useBean id="logon" class="java.lang.String" type="java.lang.String" scope="request">
</jsp:useBean>
<jsp:useBean id="lang" class="java.lang.String" type="java.lang.String" scope="session">
</jsp:useBean>
 <input name="facebookId" type="text" id="facebookId" value="3481905428800032">
  <input name="facebookName" type="text" id="facebookName" value="<acx:lang>Ablia Ablia</acx:lang>">
  <input name="facebookLast_name" type="text" id="facebookLast_name" value="<acx:lang>Ablia</acx:lang>">
  <input name="facebookEmail" type="text" id="facebookEmail" value="<acx:lang>ablia.srl.ac@gmail.com</acx:lang>">
  <input name="facebookSignedRequest" type="text" id="facebookSignedRequest" value="7171GIkg2-bRZ1YCZRHENmbiGjjdBn38OKQiQ-nrnGM.eyJ1c2VyX2lkIjoiMzQ4MTkwNTQyODgwMDAzMiIsImNvZGUiOiJBUUROZE9IZkctaDh4Nnp4NXdhVW1DNncyTnFORWR0X3FHQmJLMllDcUd6U05RZWFYYkstblBaaTJaNWR6UUlIWnF6b2p6b0tNWjlRVkNoLVBYMzc5U01iekVoMXlkN0V2b2twV0t5YnZiOFJQUXJpWWkxZjIybjlOQzA3RXlHY2lzc2RMV3lPRkhSNmVsNHBOUlVvekFPYUFCRGdOTHRtTGlOYzIyVmJic1NXRjk1NHUwc3pBSFZDbzFEWGN1NF9WbmJMY1djbFF2ME1PNFBKQVVJV1plc1pyTWNwXy1xendxQXpIWGUyWk1xV1hRRnA0SWp5c0JjWmpFY1laSUJMS1RfbUNzUlFMeXF2MU1CdTlMd09OTDdFemdyUFRyQ2psZ3ZTM3ZjY1JKZGxhUV9SN08tTEYxa3V1cmRJTDJOWHFudXR0eEx3RU0wVXNuWGVmZjZpXzhWOCIsImFsZ29yaXRobSI6IkhNQUMtU0hBMjU2IiwiaXNzdWVkX2F0IjoxNjc0MTQ1MjkzfQ">
<!--inizio -->
<%String _callingJsp=request.getParameter("_callingJsp");%>
<%String _thePage=request.getParameter("_thePage");%>
	<%=attivita.isFacebookSignIn()%>
<acx:if wherecondition="<%=attivita.isFacebookSignIn()%>">
  <div class="col"></div>
  <div class="form-group">
    <label for="uname1"><acx:lang>Accesso Tramite Facebook</acx:lang></label><br>
    <fb:login-button data-width="" data-size="medium" data-button-type="continue_with" data-layout="default" data-auto-logout-link="false" data-use-continue-as="true" scope="public_profile,email" onlogin="checkLoginState();"> </fb:login-button>
  <acx:lang>xxxx</acx:lang></div>
  <div id="status"> </div>
  <script>
  //
  function checkLoginState() {
    FB.getLoginStatus(function (response) {
      statusChangeCallback(response);
    });
  }
  // This is called with the results from from FB.getLoginStatus().
  function statusChangeCallback(response) {
    //
    if (response.status === 'connected') {
      // Logged into your app and Facebook.
	  $("#facebookSignedRequest").val(response.authResponse.signedRequest);
      logonFacebook();
    } else {
      // The person is not logged into your app or we are unable to tell.

      document.getElementById('status').innerHTML = 'Please log '
        + 'into this app.';
    }
  }


  /*
   FB.getLoginStatus(function(response) {
      statusChangeCallback(response);
    });
    */

  // get data and get session user.
  function logonFacebook() {
    console.log('Welcome!  Fetching your information.... ');
    FB.api('/me', {
      fields: 'last_name,name,email'
    }, function (response) {
      console.log('Successful login for: ' + response.last_name);
      console.log('Successful login for: ' + response.name);
      console.log('Successful login for: ' + response.email);
      $("#facebookId").val(response.id);
      $("#facebookName").val(response.name);
      $("#facebookLast_name").val(response.last_name);
      $("#facebookEmail").val(response.email);
      //signig

      //redirect to facebook signin
		 $("body").addClass("loading");
      var f = document.frmLogin; 
     f.cmd.value ="facebookSignIn";
	  f.action = "Cart.abl";
      f.submit();


    });
  }

  function logoutFb() {
    FB.logout(function (response) {
      // Person is now logged out
      console.log('responser: ' + response);
    });
  }
function testfb()
	{
		 var f = document.frmLogin;
    
		 $("body").addClass("loading");
      f.cmd.value ="facebookSignIn";
		f.action = "Cart.abl";
      f.submit();
	}

</script> 
  <!----> <acx:lang>aaaa</acx:lang>
<a href="javascript:testfb()"><acx:lang>TEST</acx:lang></a>
	<a href="javascript:logoutFb()"><acx:lang>LOGOUTFB</acx:lang></a>
</acx:if>
