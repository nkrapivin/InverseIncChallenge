<?php

if (!isset($_POST['time']) || empty($_POST['time'])) {
	echo "time failed";
	exit();
}

if (!isset($_POST['employeeid']) || empty($_POST['employeeid'])) {
	echo "employeeid failed";
	exit();
}

$time = $_POST['time'];
$employeeid = $_POST['employeeid'];

$url = 'http://localhost:3090/updatetime';
$query = http_build_query(array('time' => $time, 'employeeid' => $employeeid));

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
	echo "Backend Report failed.";
	exit();
}

echo "Report ok.";
?>