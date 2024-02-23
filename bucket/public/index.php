<?php

<<<<<<< Updated upstream
=======
$config = true;
if ($config) {
    echo phpinfo();

    exit;
}

>>>>>>> Stashed changes
$display_errors = true;
if ($display_errors) {
	ini_set('display_errors', 1);
	ini_set('display_startup_errors', 1);
	error_reporting(E_ALL);
}

require_once dirname(__DIR__, 1).'/vendor/autoload.php';

<<<<<<< Updated upstream
use App\Request;
use App\Response;

$request = new Request;
$response = new Response;

if ($request->method == 'get' && $request->route == '/router/test') {
    echo '<pre>'; print_r($request); echo '</pre>';

    exit;
}

if ($request->method == 'post') {
    $response->json($request);

    exit;
}

$response->json(['message' => 'no resource']);
=======
/* try {
    $connection = new PDO("mysql:host=$host;dbname=$database", $username, $password);

    // set the PDO error mode to exception
    $connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    echo "Connected successfully";

} catch(PDOException $e) {
    echo "Connection failed: " . $e->getMessage();
} */
>>>>>>> Stashed changes
