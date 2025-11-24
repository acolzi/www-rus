<table width=100% align=left>
<tr valign=top align=left>
<td width=70>
<div id="sideBar">
	<div id="masterdiv">

	<div class="menutitle" onclick="SwitchMenu('sub1')">Foto</div>
	<span class="submenu" id="sub1">
		&nbsp;&nbsp; - <a href="index.php">Home Page</a><br>
		&nbsp;&nbsp; - <a href="gallery.php">Foto fino 2011</a><br>
		&nbsp;&nbsp; - <a href="gallery2.php">Foto </a><br>
		&nbsp;&nbsp; - <a href="privacy.php">Privacy</a><br>
		&nbsp;&nbsp; - <a href="considerazioni.php">Avvertenze</a><br>
		&nbsp;&nbsp; - <a href="form.php">Password</a><br>
	</span>

	<div class="menutitle" onclick="SwitchMenu('sub2')">Riviste</div>
	<span class="submenu" id="sub2">
		&nbsp;&nbsp; - <a href="riv-atletica.php">Atl. Img</a><br>
		&nbsp;&nbsp; - <a href="riv-spiridon.php">Spiridon</a><br>
	</span>

	<div class="menutitle" onclick="SwitchMenu('sub3')">Forum</div>
	<span class="submenu" id="sub3">
		&nbsp;&nbsp; - <a href="http://bb.pierogiacomelli.com/viewforum.php?f=2">News</a><br>
		&nbsp;&nbsp; - <a href="http://bb.pierogiacomelli.com">Forum</a><br>
	</span>
	
	<div class="menutitle" onclick="SwitchMenu('sub4')">Varie</div>
	<span class="submenu" id="sub4">
                &nbsp;&nbsp; - <a href="http://files.pierogiacomelli.com/">Files</a><br>
                &nbsp;&nbsp; - <a href="http://video.pierogiacomelli.com/">Slideshow</a><br>
		  &nbsp;&nbsp; - <a href="http://www.pierogiacomelli.com/awstats/awstats.pl">Statistiche</a><br>
        	  &nbsp;&nbsp; - <a href="graphs.html">Grafici</a><br>
		  &nbsp;&nbsp; - <a href="links.php">Links</a><br>
	</span>

	</div>

       &nbsp;<a href="http://bb.pierogiacomelli.com/viewtopic.php?f=19&t=9260" title="Effettua una donazione" target="_blank" >
       <img src="../pics/donapaypal.jpg" width="146" height="118" alt="Donazione" /></a>


<p>


<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- Sidebar sito -->
<ins class="adsbygoogle"
     style="display:block"
     data-ad-client="ca-pub-1616750795635234"
     data-ad-slot="7933741205"
     data-ad-format="auto"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>


<p><b>&nbsp;&nbsp;Sponsors:</b><br>
<?php 

### Funzione di random degli sponsors ###

	$www_home="/home/web/www.pierogiacomelli.com/www/";
	$filespath="/home/web/www.pierogiacomelli.com/www/sponsors";
	$descfile="/home/web/www.pierogiacomelli.com/www/sponsors/links.txt";

	chdir("$filespath");
	
	if ($handle = opendir('.')) {
		while (false !== ($entry = readdir($handle))) {
		if (!is_dir($entry) && $entry != "$descfile" && ( substr($entry, -3) == "jpg" || substr($entry, -3) == "gif" || substr($entry, -3) == "png" ))  {
				$sponsors[] = $entry;
			}
		}
	closedir($handle);
	}
	
	# Read a desc. file if any
	if (file_exists($descfile)) {
		$fp = fopen ("$descfile", "r");
		while ($data = fgetcsv ($fp, 1000, ";")) {
			$desc[$data[0]] = $data[1];
		}
	}
	
	if (count($sponsors) != 0){ 
		print "<p>";
		srand((float)microtime() * 1000000);
		shuffle($sponsors);
		while (list($key, $sponsor) = each($sponsors)) {
			print 	"&nbsp;&nbsp;&nbsp;&nbsp;<a href=$desc[$sponsor]><img width=120 border=0 src=http://www.pierogiacomelli.com/sponsors/$sponsor></a><p>";
		}
	}


#### End 
?>

</div>
</td><td>
