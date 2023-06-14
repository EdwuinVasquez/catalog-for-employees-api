<?php

require 'flight/Flight.php';

// Register class with constructor parameters
Flight::register('db', 'PDO', array('mysql:host=10.10.10.9;dbname=VENTAEMPLEADOS','VENTAS','$APPRIMO2023'));

require('./Get.php');
require('./Post.php');
require('./Put.php');
require('./Delete.php');

Flight::route('/', function () {
	echo 'hello world!';
});

Flight::start();
