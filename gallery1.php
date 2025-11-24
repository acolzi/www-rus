<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="Regalami un sorriso">
<meta name="author" content="">
<!-- [favicon] begin -->
<link rel="shortcut icon" type="image/x-icon" href="images/favicon.ico"/>
<link rel="icon" type="image/x-icon" href="images/favicon.ico" />
<!-- [favicon] end -->
<!-- JSP -->
<title>Regalami Un Sorriso ONLUS - Correndo, sognando e... lottando</title>
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
<script src="vendor/jquery/jquery.min.js"></script>
<?php include('_inc_head.php');?> 
</head>

<body>
 <div id="jspHeader" style="margin-bottom: 40px"></div>
 <script>
$( "#jspHeader" ).load( "_inc_header_php.jsp" );
	</script>

  <div class="container my-3">
<?php

// vars
$gallery_path = "/home/sites/regalamiunsorriso/www/mypics";
$www_home = "/home/sites/regalamiunsorriso/www/";
$default_tn = "pics/tn_def.jpg";
$tn_prefix = "tn_";
// end




print "<div class=boxedDark align=center style='min-height:400px'>";
print "<div><a href='javascript:history.back()'>Indietro</a></div>";
if ( $_REQUEST[ 'nomedir' ] == "" ) {
	$realpath = $gallery_path;
} else {
	$realpath = $_REQUEST[ 'nomedir' ];
	$realpath = str_replace( "/mnt/nas12/nas1", "/home/sites/regalamiunsorriso/www", $realpath );
}

if ( stristr( "$realpath", ".." )or!stristr( "$realpath", "$gallery_path" ) ) {

	print( " INDIRIZZO NON TROVATO !!!" );
	exit;
}

$realpath = rawurldecode( $realpath );
$webpath = substr( $realpath, strlen( $www_home ) );
chdir( "$realpath" );

if ( $handle = opendir( '.' ) ) {

	while ( false !== ( $entry = readdir( $handle ) ) ) {

		if ( $entry != "." && $entry != ".." ) {
			if ( is_dir( $entry ) ) {
				$dirs[] = $entry;
			} else {
				if ( strtolower( substr( $entry, 0, 3 ) ) != $tn_prefix && ( strtolower( substr( $entry, -3 ) ) == "jpg" || strtolower( substr( $entry, -4 ) ) == "jpeg" ) ) {
					$files[] = $entry;
				}
			}
		}
	}
	closedir( $handle );
}


if ( count( $dirs ) != 0 ) {
	sort( $dirs );
	$index = 0;
	print "<table width=100%><tr>";
	foreach ( $dirs as $dir ) {
		print "<td width=25% align=center>";
		if ( $dir[ 0 ] != '_' )
			print "<a href=gallery1.php?nomedir=" . rawurlencode( realpath( $dir ) ) . "><img src=pics/dir.png /><br />$dir</a></td>";
		$index++;
		if ( $index % 4 == 0 ) {
			echo "</tr><tr>";
		}

	}

	print "</table>&nbsp;<p>";
}


if ( count( $files ) != 0 ) {

	sort( $files );
	$index = 0;
	print "<table width=100%><tr>";



	if ( file_exists( $realpath . "/slideshow.px" ) ) {
		print "<td align=center>";
		print "<a href=javascript:NewWindow('" . $webpath . "/slideshow.html','Order','660','500','yes')>" .
		"<img src=/pics/slideshow.jpg></a><BR>";
		$index++;
	}

	foreach ( $files as $file ) {

		$thumb = $webpath . "/" . $tn_prefix . "" . $file;
		$rthumb = $realpath . "/" . $tn_prefix . "" . $file;
		$picture = $webpath . "/" . $file;

		print "<td align=center>";

		if ( file_exists( $rthumb ) == false ) {

			$thumb_notfound = true;

			if ( $force_tn == true ) {

				$thumb = $picture;

			} else {

				$thumb = $default_tn;

			}

		}

		# list($wsize, $hsize, $imgtype, $imgattr) = getimagesize($file);
		$picture_orig = $picture;
		$picture = rawurlencode( $picture );
		print "<a href=$picture_orig>" .
		"<img border=1 src='" . $thumb . "'></a><br><iframe src=\"pg/Foto.abl?foto=_home_sites_regalamiunsorriso_www__$picture_orig\" scrolling=\"no\" width=\"150\" height=\"25\" frameborder=\"0\"></iframe>" .
		"</td>";

		$index++;
		if ( $index % 3 == 0 ) {
			echo "</tr><tr>";
		}
	}


	print "</table>&nbsp;<p>";

}



?>

</div>
<!-- Bootstrap core JavaScript -->

<script src="vendor/popper/popper.min.js"></script>
<script src="addons/datepicker/js/bootstrap-datepicker.min.js"></script>
<script src="addons/datepicker/locales/bootstrap-datepicker.it.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<div id="jspFooter" style="margin-bottom: 40px"></div>
 <script>
$( "#jspFooter" ).load( "_inc_footer.jsp" );
	</script>
	</body>
</html>