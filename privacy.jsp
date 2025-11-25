<!DOCTYPE html><jsp:useBean id="lang" class="java.lang.String" type="java.lang.String" scope="session" ></jsp:useBean>
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
<title>Regalami Un Sorriso ETS - Correndo, sognando e... lottando</title>
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
<!-- InstanceBeginEditable name="main" -->
<jsp:include page="_inc_header.jsp"  flush="true" >
<jsp:param name="menuAttivo" value="privacy"/>
</jsp:include>
<div class="container my-3">
  <div class="row">
    <div class="col-lg-12 my-4">
      <h1 class="my-3">INFORMATIVA PER IL TRATTAMENTO DEI DATI PERSONALI  AI SENSI DELL’ART. 13 D.LGS. 30.6.2003 N. 196 (IN SEGUITO, “CODICE PRIVACY”) E DELL’ART. 13 REGOLAMENTO UE N. 2016/679 (IN SEGUITO, “GDPR”) </h1>
      <div class="row">
        <div class="col-lg-12 col-xs-12">
          <div>
            <div>
              <p><strong>ETS REGALAMI UN SORRISO </strong>con Sede legale in <strong>Via Botticelli  n° 29</strong> - <strong>Prato (PO)</strong>, C.F.<strong> 92076170486</strong> (in seguito, <strong>Titolare</strong>), in qualità di titolare del trattamento, La informa ai sensi dellart. 13 D.Lgs. 30.6.2003 n. 196 (in seguito, <strong>Codice</strong> <strong>Privacy</strong>) e dellart. 13 Regolamento UE n. 2016/679 (in seguito, <strong>GDPR</strong>) che i<strong> </strong>Suoi dati saranno trattati con le modalità e per le finalità seguenti</p>
              <p><strong>1.Oggetto del Trattamento</strong> </p>
              <p>Il Titolare tratta i dati personali, identificativi (ad esempio, nome, cognome, ragione sociale, indirizzo, telefono, e-mail, riferimenti bancari e di pagamento)– in seguito, <strong>dati personali</strong> o anche <strong>dati</strong>, da Lei comunicati in occasione di accordi/contratti per i servizi erogati dal Titolare.<br>
              </p>
              <p><strong>2.Finalità del trattamento</strong> <br>
                </p>
              <p>I Suoi dati personali sono trattati:</p>
              <p> <strong><em>A) Anche senza il Suo consenso espresso (art. 24 lett. a), b), c) Codice Privacy e art. 6 lett. b), e) GDPR), per le seguenti <u>Finalità di Servizio</u>:</em></strong></p>
              <p><em><strong>- concludere i contratti per i servizi del Titolare;</strong></em></p>
              <p><em><strong>- adempiere agli obblighi precontrattuali, contrattuali e fiscali derivanti da rapporti con Lei in essere;</strong></em></p>
              <p><em><strong> - adempiere agli obblighi previsti dalla legge, da un regolamento, dalla normativa comunitaria o da un ordine dellAutorità (come ad esempio in materia di antiriciclaggio);</strong></em></p>
              <p><em><strong> - esercitare i diritti del Titolare, ad esempio il diritto di difesa in giudizio;</strong></em><strong></strong><br>
</p>
              <p><strong><em>B)  Solo previo Suo specifico e distinto consenso (artt. 23 e 130 Codice Privacy e art. 7 GDPR), per le seguenti <u>Finalità di Marketing</u>:<br>
                </em></strong></p>
              <p><em><strong>- inviarLe via e-mail, posta e/o sms e/o contatti telefonici, newsletter, comunicazioni commerciali e/o materiale pubblicitario su prodotti o servizi offerti dal Titolare e rilevazione del grado di soddisfazione sulla qualità dei servizi;</strong></em></p>
              <p><em><strong> - inviarLe via e-mail, posta e/o sms e/o contatti telefonici comunicazioni commerciali e/o promozionali di soggetti terzi (ad esempio, business partner, compagnie assicurative, altre società della Ets). Le segnaliamo che se è già nostro utente o socio, potremo inviarLe comunicazioni   commerciali relative a servizi e prodotti del Titolare analoghi a quelli di cui ha già usufruito, salvo Suo dissenso (art. 130 c.4 Codice Privacy)</strong></em><br>
                </p>
              <p><strong>3.Modalità di trattamento</strong> <br>
              </p>
              <p>Il trattamento dei Suoi dati personali è realizzato per mezzo delle operazioni indicate allart. 4 Codice Privacy e allart. 4 n. 2) GDPR e precisamente: raccolta, registrazione, organizzazione, conservazione, consultazione, elaborazione, modificazione, selezione, estrazione, raffronto, utilizzo, interconnessione, blocco, comunicazione, cancellazione e distruzione dei dati. I Suoi dati personali sono sottoposti a trattamento sia cartaceo che elettronico e/o automatizzato.<br>
                Il Titolare tratterà i dati personali per il tempo necessario per adempiere alle finalità di cui sopra e comunque per non oltre 10 anni dalla cessazione del rapporto per le Finalità di Servizio e per non oltre 2 anni dalla raccolta dei dati per le Finalità di Marketing.<br>
              </p>
              <p><strong>4.Accesso ai dati</strong></p>
              <p>I Suoi dati potranno essere resi accessibili per le finalità di cui allart. 2.A) e 2.B):<br>
                - a  dipendenti  e  collaboratori  del  Titolare  o ad altre  società  nella loro qualità di incaricati e/o responsabili interni del trattamento e/o amministratori di sistema;</p>
              <p>- a società terze o altri soggetti (a titolo indicativo, istituti di credito, studi professionali, consulenti, società di assicurazione per la prestazione di servizi assicurativi, etc.) che svolgono attività in outsourcing per conto del Titolare, nella loro qualità di responsabili esterni del trattamento. <br>
                </p>
              <p><strong>5.Comunicazione dei dati</strong></p>
              <p>Senza la necessità di un espresso consenso (ex art. 24 lett. a), b), d) Codice Privacy e art. 6 lett. b) e c) GDPR), il Titolare potrà comunicare i Suoi dati per le finalità di cui allart. 2.A) a Organismi di vigilanza (quali IVASS), Autorità giudiziarie, a società di assicurazione per la prestazione di servizi assicurativi, nonché a quei soggetti ai quali la comunicazione sia obbligatoria per legge per lespletamento delle finalità dette. Detti soggetti tratteranno i dati nella loro qualità di autonomi titolari del trattamento.<br>
                I Suoi dati non saranno diffusi.<br>
                </p>
              <p><strong>6.Trasferimento dati</strong></p>
              <p>I dati personali sono conservati su server ubicati allinterno dellUnione Europea. Resta in ogni caso inteso che il Titolare, ove si rendesse necessario, avrà facoltà di spostare i server anche extra-UE. In tal caso, il Titolare assicura sin dora che il trasferimento dei dati extra-UE avverrà in conformità alle disposizioni di legge applicabili, previa stipula delle clausole contrattuali standard previste dalla Commissione Europea.<br>
                </p>
              <p><strong>7.Natura del conferimento dei dati e conseguenze del rifiuto di rispondere</strong></p>
              <p>Il conferimento dei dati per le finalità di cui allart. 2.A) è obbligatorio. In loro assenza, non potremo garantirLe i Servizi dellart. 2.A).<br>
                Il conferimento dei dati per le finalità di cui allart. 2.B) è invece facoltativo. Può quindi decidere di non conferire alcun dato o di negare successivamente la possibilità di trattare dati già forniti: in tal caso, non potrà ricevere newsletter, comunicazioni commerciali e materiale pubblicitario inerenti ai Servizi offerti dal Titolare. Continuerà comunque ad avere diritto ai Servizi di cui allart. 2.A).<br>
                </p>
              <p><strong>8.Diritti dellinteressato</strong></p>
              <p>Nella Sua qualità di interessato, ha i diritti di cui allart. 7 Codice Privacy e art. 15 GDPR e precisamente i diritti di:<br>
- ottenere la conferma dell'esistenza o meno di dati personali che La riguardano, anche se non ancora registrati, e la loro comunicazione in forma intelligibile;<br>
              </p>
              <p>- ottenere l'indicazione: a) dell'origine dei dati personali; b) delle finalità e modalità del trattamento; c) della logica applicata in caso di trattamento effettuato con l'ausilio di strumenti elettronici; d) degli estremi identificativi del titolare, dei responsabili e del rappresentante<br>
                 designato ai sensi dell'art. 5, comma 2 Codice Privacy e art. 3, comma 1, GDPR; e) dei soggetti o delle categorie di soggetti ai quali i dati personali possono essere comunicati o che possono venirne a conoscenza in qualità di rappresentante designato nel territorio dello Stato, di responsabili o incaricati;</p>
              <p>- ottenere: a) l'aggiornamento, la rettificazione ovvero, quando vi ha interesse, l'integrazione dei dati; b) la cancellazione, la trasformazione in forma anonima o il blocco dei dati trattati in violazione di legge, compresi quelli di cui non è necessaria la conservazione in relazione agli scopi per i quali i dati sono stati raccolti o successivamente trattati;<br>
- l'attestazione che le operazioni di cui alle lettere a) e b) sono state portate a conoscenza, anche per quanto riguarda il loro contenuto, di coloro ai quali i dati sono stati comunicati o diffusi, eccettuato il caso in cui tale adempimento si rivela impossibile o comporta un impiego di mezzi manifestamente sproporzionato rispetto al diritto tutelato;</p>
              <p>- opporsi, in tutto o in parte: a) per motivi legittimi al trattamento dei dati personali che La riguardano, ancorché pertinenti allo scopo della raccolta; b) al trattamento di dati personali che La riguardano a fini di invio di materiale pubblicitario o di vendita diretta o per il compimento di ricerche di mercato o di comunicazione commerciale, mediante luso di sistemi automatizzati di chiamata senza lintervento di un operatore mediante e-mail e/o mediante modalità di marketing tradizionali mediante telefono e/o posta cartacea. Si fa presente che il diritto di opposizione dellinteressato, esposto al precedente punto b), per finalità di marketing diretto mediante modalità automatizzate si estende a quelle tradizionali e che comunque resta salva la possibilità per linteressato di esercitare il diritto di opposizione anche solo in parte. Pertanto, linteressato può decidere di ricevere solo comunicazioni mediante modalità tradizionali ovvero solo comunicazioni automatizzate oppure nessuna delle due tipologie di comunicazione.</p>
              <p>Ove applicabili, ha altresì i diritti di cui agli artt. 16-21 GDPR (Diritto di rettifica, diritto alloblio, diritto di limitazione di trattamento, diritto alla portabilità dei dati, diritto di opposizione), nonché il diritto di reclamo allAutorità Garante.<br>
                </p>
              <p><strong>9.Modalità di esercizio dei diritti</strong></p>
              <p>Potrà in qualsiasi momento esercitare i diritti inviando:<br>
- una raccomandata a.r. alla nostra Sede operativa, oppure</p>
              <p>- una e-mail PEC al nostro indirizzo.<br>
                </p>
              <p><strong>10.Titolare, responsabile e incaricati</strong><br>
                </p>
              <p>Il Titolare del trattamento è <strong>ETS REGALAMI UN SORRISO </strong>con Sede legale in <strong>Via Botticelli n° 29</strong> – <strong>59100 Prato (PO), </strong>mentre il Responsabile del Trattamento è il Sig.<strong> Piero Giacomelli.</strong><br>
                Lelenco aggiornato dei responsabili e degli incaricati al trattamento è custodito presso la sede legale del Titolare del trattamento.</p>
              <p></p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- /.container--> <!-- InstanceEndEditable -->

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
