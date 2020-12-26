<?php

// подгрузить error.html в случае ошибки.
if (!isset($_POST['username']) || empty($_POST['username'])) {
	require("private/error.html");
	exit();
}

// setup parameters.
$url = 'http://localhost:3090/register';
$ipport = $_SERVER['REMOTE_ADDR'] . ":" . $_SERVER['REMOTE_PORT'];
$query = http_build_query(array('ipport' => $ipport, 'username' => $_POST['username']));

$options = array(
	'http' => array(
		'header'  => "Content-type: application/x-www-form-urlencoded\r\n",
		'method'  => 'POST',
		'content' => $query
	)
);

// send request.
$context = stream_context_create($options);
$result  = @file_get_contents($url, false, $context);
if ($result === FALSE) {
	require("private/backenderror.html");
	exit();
}

// parse response.
$_response = parse_str($result, $response);
if ($response["status"] !== "success") {
	require("private/denied.html");
	exit();
}
$empid = $response["id"];

// load html from private directory, and replace %empid% with our actual employee id.
$html = file_get_contents("private/download.html");
$html = str_replace("%empid%", $empid, $html);

// simply echo it.
echo $html;
?>