<?php

function chooseLang($availableLangs)
{
	$pref = array();
	$languages = split(",", $_SERVER['HTTP_ACCEPT_LANGUAGE'] );
	foreach($languages as $lang)
	{
		if (preg_match('/^([a-z]+).*?(?:;q=([0-9.]+))?/i', $lang.';q=1.0', $split))
		{
			$pref[sprintf("%f%d", $split[2], rand(0,9999))] = strtolower($split[1]);
		}
	}
	krsort($pref);
	return array_shift(array_merge(array_intersect($pref, $availableLangs), $availableLangs));
}

$bestlang = chooseLang(array('en','fr','de'));
header ("Location:" . $bestlang . "/index.html");

/*
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
  <title>GeeXboX HomePage</title>
  <link rel="icon" type="images/png" href="img/geexbox-icon.png" />
  <meta http-equiv="Content-language" content="en" />
  <meta http-equiv="Content-type" content="text/html; charset=UTF-8" />
  <meta http-equiv="refresh" content="0; URL=en/index.html" />
</head>
<body>
  <p>If you are not automatically redirected to the GeeXboX homepage, <a href="en/index.html">click here</a>.</p>
</body>
</html>
*/
?>
