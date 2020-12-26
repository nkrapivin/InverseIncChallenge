<?php
// setup parameters.
$url = 'http://localhost:3090/leaderboard';
$options = array(
	'http' => array(
		'header'  => "Content-type: text/plain\r\n",
		'method'  => 'POST',
		'content' => 'request'
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
$response = json_decode($result, TRUE);
$arr = $response['employees'];
$count = count($arr);

$ret = '';

for ($tr=0; $tr<$count; $tr++) {
	$empd = $arr[$tr];
	// [unknown] told me about ETX.
	$ret .= <<<ETX
<tr>
    <td>{$empd['id']}</td>
    <td>{$empd['best_time']}</td>
</tr>
ETX;
}

// load html from private directory, and set table.
$html = file_get_contents("private/leaderboard.html");
$html = str_replace("%table%", $ret, $html);

// simply echo it.
echo $html;
?>