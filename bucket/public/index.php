<?php

$debug = true;
if ($debug) {
	ini_set('display_errors', 1);
	ini_set('display_startup_errors', 1);
	error_reporting(E_ALL);
}

require_once dirname(__DIR__, 1).'/vendor/autoload.php';

// Define router
$root = explode('/', $_SERVER['REQUEST_URI'])[1] ?? '';

if ($root == 'api') {
    $_SERVER['REQUEST_URI'] = substr($_SERVER['REQUEST_URI'], 4);
    $_SERVER['REQUEST_URI'] = empty($_SERVER['REQUEST_URI']) ? '/' : $_SERVER['REQUEST_URI'];

    include_once dirname(__DIR__, 1).'/routes/api.php';
}

include_once dirname(__DIR__, 1).'/routes/web.php';