<html>
<head>
<title>Test apertura test a comando</title>
</head>
<body>

<?php

function SendMessage($numero_test) {
	$url = "https://fcm.googleapis.com/fcm/send";
	$token = <android token>;
	$serverKey = <Firebase Server Key>;
	$title = "Let's do Test";
	$body = "Il test $numero_test è pronto per essere eseguito";
	$notification = array("title" =>$title , "body" => $body, "sound" => "default", "badge" => "1", "data" => $numero_test);
	$arrayToSend = array("to" => $token, "notification" => $notification,"priority"=>"high");
	$json = json_encode($arrayToSend);
	$headers = array();
	$headers[] = "Content-Type: application/json";
	$headers[] = "Authorization: key=". $serverKey;
	$ch = curl_init();
	curl_setopt($ch, CURLOPT_URL, $url);
	curl_setopt($ch, CURLOPT_CUSTOMREQUEST,"POST");
	curl_setopt($ch, CURLOPT_POSTFIELDS, $json);
	curl_setopt($ch, CURLOPT_HTTPHEADER,$headers);
	//Send the request
	$response = curl_exec($ch);
	//Close request
	if ($response === FALSE) {
	die("FCM Send Error: " . curl_error($ch));
	}
	curl_close($ch);
	print "Messaggio inviato";
}

	
?>
<h1>Let's do Test - avvio test da remoto</h1>
<p><a href="<?php echo $_SERVER["PHP_SELF"]; ?>?opentest=1">Carica test 1</a></p>
<p><a href="<?php echo $_SERVER["PHP_SELF"]; ?>?opentest=2">Carica test 2</a></p>

<?php

	if (IsSet($_GET["opentest"])) {
		SendMessage($_GET["opentest"]);
	}

?>

</body>
</html>