<?php 
	// Obtener informacion de usuarios 
	Flight::route('GET /getUsuario/@id', function ($id) {
		$sql = "CALL PROCEDURE_LISTAR_USUARIO('$id')";
    	$sentencia = Flight::db() ->prepare($sql);
		$sentencia->execute();
		$datos=$sentencia->fetchAll();
		Flight::json($datos);
  });
?>