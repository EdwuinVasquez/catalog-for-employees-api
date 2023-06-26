<?php
require 'flight/Flight.php';
if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    header('Access-Control-Allow-Origin: *');
    header('Access-Control-Allow-Methods: POST, GET, DELETE, PUT, PATCH, OPTIONS');
    header('Access-Control-Allow-Headers: token, Content-Type');
    header('Access-Control-Max-Age: 1728000');
    header('Content-Length: 0');
    header('Content-Type: text/plain');
    die();
}

header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json');


// Register class with constructor parameters
Flight::register('db', 'PDO', array('mysql:host=10.10.10.9;dbname=VENTAEMPLEADOS','VENTAS','$APPRIMO2023'));

require('./Get.php');
require('./Post.php');
require('./Put.php');
require('./Delete.php');

Flight::route('/', function () {
	echo 'hello world!';
});

// Flight::before('json', function () {
//     header('Access-Control-Allow-Origin: *');
//     header("Access-Control-Allow-Headers: X-API-KEY, Origin, X-Requested-With, Content-Type, Accept, Access-Control-Request-Method");
//     header("Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE");
//     header("Allow: GET, POST, OPTIONS, PUT, DELETE");
// });

Flight::start();