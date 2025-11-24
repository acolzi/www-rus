<!DOCTYPE html><jsp:useBean id="lang" class="java.lang.String" type="java.lang.String" scope="session" >
<html>

<head>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.js"></script>

<link rel="stylesheet" type="text/css" href="css-flipbook/flipbook.style.css">
<link rel="stylesheet" type="text/css" href="css-flipbook/font-awesome.css">

<script src="js-flipbook/flipbook.min.js"></script>

<script type="text/javascript">

    $(document).ready(function () {
        $("#container").flipBook({
            pdfUrl:"pdf/test.pdf",
        });

    })
</script>

</head>

<body>
<div id="container">
    <p><acx:lang>Real 3D Flipbook has lightbox feature - book can be displayed in the same page with lightbox effect.</acx:lang></p>
    <p><acx:lang>Click on a book cover to start reading.</acx:lang></p>
    <img src="images/book2/thumb1.jpg" />
</div>

</body>

</html>
