<?php

$config = false;
if ($config) {
    echo phpinfo();

    exit;
}

$display_errors = true;
if ($display_errors) {
	ini_set('display_errors', 1);
	ini_set('display_startup_errors', 1);
	error_reporting(E_ALL);
}

$host = "192.168.1.41:8815";
$database = "webadmin";
$username = "webadmin";
$password = "SuP9r*S3cr3t";

try {
    // Create connection
    $connection = mysqli_connect($host, $username, $password, $database);

    // Check connection
    /* if (! $connection) {
        die("Connection failed: " . mysqli_connect_error());
    } */
    echo "Connected successfully";

    mysqli_close($connection);
} catch(Exception $e) {
    echo "Connection failed: " . $e->getMessage() . ' / ' . $host;
}