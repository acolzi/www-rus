<!-- inc_footer.jsp -->
<%@page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/acxent.tld" prefix="acx" %>
<%@ taglib uri="/WEB-INF/art.tld" prefix="art" %>

<jsp:useBean id="utenteLogon" class="it.acxent.anag.Users" type="it.acxent.anag.Users" scope="session" >
</jsp:useBean>
<jsp:useBean id="msg" class="java.lang.String" type="java.lang.String" scope="request" >
</jsp:useBean>
<jsp:useBean id="cart" scope="session" type=   "it.acxent.cart.Cart" class="it.acxent.cart.Cart" >
</jsp:useBean>
<jsp:useBean id="cartStatus" scope="request" type="it.acxent.cart.CartStatus" class="it.acxent.cart.CartStatus" >
</jsp:useBean>
<jsp:useBean id="lang" class="java.lang.String" type="java.lang.String" scope="session" >
</jsp:useBean>

   <!-- sweet alert -->
<link rel="stylesheet" type="text/css" href="js/sweetalert/sweetalert.css">
<script src="js/sweetalert/sweetalert.min.js"></script>
<%String menuAttivo = request.getParameter("menuAttivo");%>
<footer>
  <div class="container py-3">
    <div class="row">
      
      <div class="col-lg-3 col-md-6">
        <h4><acx:lang>Contatti</acx:lang></h4>
        <p>ETS Regalami un sorriso<br>
          Via Torquato Tasso, 23/C<br>
          59100 Prato PO<br>
          CF 92076170486<br>
        <a href="mailto:foto@pierogiacomelli.com">foto@pierogiacomelli.com</a><br>
        <a href="mailto:foto.atletica.immagine@gmail.com">foto.atletica.immagine@gmail.com</a><br>
        <a href="mailto:regalamiunsorriso@pec.pierogiacomelli.com">regalamiunsorriso@pec.pierogiacomelli.com</a>        <br>
        <acx:lang>Solo</acx:lang> <i class="fa fa-whatsapp fa-2x" aria-hidden="true" title="WhatsApp" style="color:#25e47b"></i>: 348 7258209 
        </p>
      </div>
      <div class="col-lg-3 col-md-6">
        <h4><acx:lang>Informazioni</acx:lang></h4>
        <ul class="list-unstyled">
          <li><a href="associazione-<%=lang%>.html"><acx:lang>Associazione</acx:lang></a></li>
			<li><a href="privacy-<%=lang%>.html"><acx:lang>Privacy</acx:lang></a></li>
       <li><a href="cookies-<%=lang%>.html"><acx:lang>Cookies</acx:lang></a></li>
        </ul>
      </div>
    </div>
  </div>
  <hr>

  <p class="text-center text-secondary"><small>Copyright</small></p>
  <p class="triangle"><a href="#top"><i class="fa fa-arrow-up" aria-hidden="true"></i></a></p>
</footer>
<script src="_js/noTastoDx.js"></script> 
