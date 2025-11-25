<!-- _inc_cookie.jsp -->
<%@ taglib uri="/WEB-INF/acxent.tld" prefix="acx" %>
<%@page contentType="text/html; charset=UTF-8" %>
<jsp:useBean id="lang" class="java.lang.String" type="java.lang.String" scope="session" >
</jsp:useBean>
<!-- Begin Cookie Consent plugin by Silktide - http://silktide.com/cookieconsent -->
<acx:if wherecondition='<%=lang.equalsIgnoreCase("en")%>'>
	
	<script type="text/javascript">
    window.cookieconsent_options = {
        "message": "This website or the third-party tools used here make use of cookies necessary for its operation and useful for the purposes described in the cookie policy. To learn more or refuse consent to all or some cookies, please refer to the cookie policy. By closing this banner, scrolling this page, clicking on a link, or continuing to browse otherwise, you consent to the use of cookies.",
        "dismiss": "Accept",
        "learnMore": "Cookie Policy",
        "link": "https://www.regalamiunsorriso.it/privacy-<%=lang%>.html",
        "theme": "dark-bottom"
    };
</script>

	
	</acx:if>
	<acx:else>
		<script type="text/javascript">
    window.cookieconsent_options = {"message":"Questo sito o gli strumenti terzi da questo utilizzati si avvalgono di cookie necessari al funzionamento ed utili alle finalità illustrate nella cookie policy. Se vuoi saperne di più o negare il consenso a tutti o ad alcuni cookie, consulta la cookie policy. Chiudendo questo banner, scorrendo questa pagina, cliccando su un link o proseguendo la navigazione in altra maniera, acconsenti all'uso dei cookie.","dismiss":"Accetto","learnMore":"Cookie Policy","link":"https://www.regalamiunsorriso.it/privacy-<%=lang%>.html","theme":"dark-bottom"};
</script>
</acx:else>
<script type="text/javascript" src="js/cookieconsent.min.js"></script>
<!-- End Cookie Consent plugin -->