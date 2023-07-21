<?php 
	// Obtener informacion de usuarios 
	Flight::route('GET /getUsuario/@id', function ($id) {
		$sql = "CALL PROCEDURE_LISTAR_USUARIO('$id')";
    	$sentencia = Flight::db() ->prepare($sql);
		$sentencia->execute();
		$datos=$sentencia->fetchAll();
		Flight::json($datos);
  });

  // Obtener informacion de basica producto 
	Flight::route('GET /getProductoBase', function () {
		$sql = "CALL PROCEDURE_LISTAR_PRODUCTOS()";
    	$sentencia = Flight::db() ->prepare($sql);
		$sentencia->execute();
		$datos=$sentencia->fetchAll();
		Flight::json($datos);
  });

  // Obtener informacion de venta
	Flight::route('GET /getVenta/@id', function ($id) {
		$sql = "CALL PROCEDURE_LISTAR_VENTAS('$id')";
    	$sentencia = Flight::db() ->prepare($sql);
		$sentencia->execute();
		$datos=$sentencia->fetchAll();
		Flight::json($datos);
  });
?>