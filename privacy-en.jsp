<!DOCTYPE html><jsp:useBean id="lang" class="java.lang.String" type="java.lang.String" scope="session" >
<%@page contentType="text/html; charset=UTF-8" %>
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
<link rel="shortcut icon" type="image/x-icon" href="images/favicon.ico" />
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
<title><acx:lang>Regalami Un Sorriso ETS - Correndo, sognando e... lottando</acx:lang></title>
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
<link rel="stylesheet" href="admin/_V4/_css/ajaxLoading.css">
<!-- InstanceBeginEditable name="head" -->
<!-- InstanceEndEditable -->
	<!-- Begin Cookie Consent plugin by Silktide - http://silktide.com/cookieconsent -->
<script type="text/javascript">
    window.cookieconsent_options = {"message":"Questo sito o gli strumenti terzi da questo utilizzati si avvalgono di cookie necessari al funzionamento ed utili alle finalità illustrate nella cookie policy. Se vuoi saperne di più o negare il consenso a tutti o ad alcuni cookie, consulta la cookie policy. Chiudendo questo banner, scorrendo questa pagina, cliccando su un link o proseguendo la navigazione in altra maniera, acconsenti all'uso dei cookie.","dismiss":"Accetto","learnMore":"Cookie Policy","link":"https://www.regalamiunsorriso.it/privacy.html","theme":"dark-bottom"};
</script>
<script type="text/javascript" src="js/cookieconsent.min.js"></script>
<!-- End Cookie Consent plugin -->
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
      <h1 class="my-3">INFORMATION NOTICE ON THE PROCESSING OF PERSONAL DATA PURSUANT TO ART. 13 LEGISLATIVE DECREE 30.6.2003 N. 196 (HEREINAFTER, "PRIVACY CODE") AND ART. 13 EU REGULATION NO. 2016/679 (HEREINAFTER, "GDPR")</h1>
      <div class="row">
        <div class="col-lg-12 col-xs-12">
          <div>
            <div>
              <p><strong>ETS REGALAMI UN SORRISO</strong> with Registered Office in <strong>Via Botticelli No. 29</strong> - <strong>Prato (PO)</strong>, Tax Code <strong>92076170486</strong> (hereinafter, <strong>Controller</strong>), as the data controller, hereby informs you pursuant to Art. 13 of Legislative Decree 30.6.2003 n. 196 (hereinafter, <strong>Privacy Code</strong>) and Art. 13 EU Regulation No. 2016/679 (hereinafter, <strong>GDPR</strong>) that your data will be processed according to the following methods and for the following purposes.</p>
              <p><strong>1. Subject of Processing</strong></p>
              <p>The Controller processes personal and identification data (for example, name, surname, company name, address, telephone, e-mail, banking and payment details)—hereinafter, <strong>personal data</strong> or simply <strong>data</strong>—provided by you when entering into agreements/contracts for services provided by the Controller.<br>
              </p>
              <p><strong>2. Purpose of Processing</strong> <br>
                </p>
              <p>Your personal data are processed:</p>
              <p> <strong><em>A) Even without your express consent (Art. 24 letters a), b), c) Privacy Code and Art. 6 letters b), e) GDPR), for the following <u>Service Purposes</u>:</em></strong></p>
              <p><em><strong>- conclude contracts for the Controller's services;</strong></em></p>
              <p><em><strong>- comply with pre-contractual, contractual, and tax obligations arising from relationships with you;</strong></em></p>
              <p><em><strong>- comply with obligations provided by law, regulations, EU legislation, or an Authority’s order (for example, anti-money laundering regulations);</strong></em></p>
              <p><em><strong>- exercise the Controller's rights, such as the right of defence in court;</strong></em><strong></strong><br>
</p>
              <p><strong><em>B) Only with your specific and distinct consent (Arts. 23 and 130 Privacy Code and Art. 7 GDPR), for the following <u>Marketing Purposes</u>:<br>
                </em></strong></p>
              <p><em><strong>- send you by e-mail, mail and/or SMS and/or phone calls, newsletters, marketing communications and/or advertising material on products or services offered by the Controller and collect feedback on service quality;</strong></em></p>
              <p><em><strong>- send you by e-mail, mail and/or SMS and/or phone communications, marketing and/or promotional communications from third parties (e.g., business partners, insurance companies, other Ets group companies). Please note that if you are already our user or member, we may send you marketing communications related to Controller services and products similar to those you have already used unless you object (Art. 130 paragraph 4 Privacy Code).</strong></em><br>
                </p>
              <p><strong>3. Processing Methods</strong> <br>
              </p>
              <p>The processing of your personal data is carried out by the operations listed in Art. 4 Privacy Code and Art. 4 No. 2 GDPR: collection, recording, organization, storage, consultation, processing, modification, selection, extraction, comparison, use, interconnection, blocking, communication, erasure and destruction of data. Your personal data are processed both on paper and electronically and/or automatically.<br>
                The Controller will process the personal data for as long as necessary to fulfil the above purposes and, in any case, no longer than 10 years after the end of the relationship for Service Purposes and no longer than 2 years after data collection for Marketing Purposes.<br>
              </p>
              <p><strong>4. Access to Data</strong></p>
              <p>Your data may be made accessible for the purposes under Art. 2.A) and 2.B):<br>
                - to employees and collaborators of the Controller or other companies as processors and/or internal data managers and/or system administrators;</p>
              <p>- to third-party companies or other subjects (for example, credit institutes, professional firms, consultants, insurance companies providing insurance services, etc.) that perform outsourcing activities on behalf of the Controller as external data processors.<br>
                </p>
              <p><strong>5. Data Communication</strong></p>
              <p>Without the need for express consent (ex Art. 24 letters a), b), d) Privacy Code and Art. 6 letters b) and c) GDPR), the Controller may communicate your data for the purposes under Art. 2.A) to supervisory bodies (such as IVASS), judicial authorities, insurance companies providing insurance services, as well as entities to whom communication is mandatory by law for the purposes mentioned. These subjects will process the data as independent controllers.<br>
                Your data will not be disseminated.<br>
                </p>
              <p><strong>6. Data Transfer</strong></p>
              <p>Personal data are stored on servers located within the European Union. It is understood, however, that the Controller, wherever necessary, may move servers outside the EU. In this case, the Controller assures that any data transfer outside the EU will be carried out in accordance with applicable legal provisions, subject to the adoption of standard contractual clauses prescribed by the European Commission.<br>
                </p>
              <p><strong>7. Nature of Data Provision and Consequences of Refusal</strong></p>
              <p>Provision of data for the purposes under Art. 2.A) is mandatory. Without them, we cannot provide the Services under Art. 2.A).<br>
                Provision of data for the purposes under Art. 2.B) is optional. You may decide not to provide your data or later to deny the processing of data already provided: in that case, you will not receive newsletters, marketing communications, and promotional material related to the Controller's Services. You will, however, still be entitled to the Services under Art. 2.A).<br>
                </p>
              <p><strong>8. Data Subject Rights</strong></p>
              <p>As a data subject, you have the rights under Art. 7 Privacy Code and Art. 15 GDPR, specifically the rights to:<br>
- obtain confirmation of the existence or non-existence of personal data concerning you, even if not yet recorded, and comprehend it in an intelligible form;<br>
              </p>
              <p>- obtain information: a) on the source of personal data; b) on processing purposes and methods; c) on the logic applied in case of electronic processing; d) on the identification details of the controller, processors, and designated representative under Art. 5, paragraph 2 Privacy Code and Art. 3, paragraph 1 GDPR; e) on the entities or categories to whom your personal data may be communicated or who may learn of it as a designated representative in the State, as processors, or as persons in charge;</p>
              <p>- obtain: a) updating, rectification, or, where interested, integration of data; b) erasure, anonymization, or blocking of unlawfully processed data, including those not necessary to keep with regard to the purposes for which they were collected or subsequently processed;<br>
- certification that the operations as per letters a) and b) have been brought to the attention, including their content, of those to whom the data was communicated or disseminated, except where impossible or requires clearly disproportionate means compared to the protected right;</p>
              <p>- object, wholly or in part: a) for legitimate reasons, to the processing of your personal data, even if pertinent to the purpose of collection; b) to the processing of personal data for purposes of sending advertising material or direct sales, or for market research or commercial communication by means of automated call systems without operator intervention, by e-mail and/or traditional marketing by telephone and/or postal mail. Please note that the right to object to direct marketing by automated means extends to traditional methods, and that data subjects may exercise their right to object even only in part. Therefore, you may decide to receive communications only by traditional means or only by automated means, or neither.</p>
              <p>Where applicable, you also have the rights under Arts. 16-21 GDPR (Right to Rectification, Right to Erasure, Right to Restriction of Processing, Right to Data Portability, Right to Object), as well as the right to lodge a complaint with the Supervisory Authority.<br>
                </p>
              <p><strong>9. How to Exercise Your Rights</strong></p>
              <p>You may exercise your rights at any time by sending:<br>
- a registered letter with return receipt to our operational office, or</p>
              <p>- a certified e-mail (PEC) to our address.<br>
                </p>
              <p><strong>10. Controller, Processor, and Authorized Persons</strong><br>
                </p>
              <p>The Controller is <strong>ETS REGALAMI UN SORRISO</strong> with its registered office at <strong>Via Botticelli No. 29</strong> – <strong>59100 Prato (PO),</strong> while the Data Processor is Mr. <strong>Piero Giacomelli.</strong><br>
                The up-to-date list of processors and authorized persons is kept at the registered office of the Controller.</p>
              <p></p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- /.container-->
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
	<!-- InstanceBeginEditable name="lastStuff" --> <!-- InstanceEndEditable -->
<div class="modal-loading"></div>
</body>
<!-- InstanceEnd --></html>
