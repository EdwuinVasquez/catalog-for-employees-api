<?php 
	// Obtener informacion de usuarios 
  Flight::route('GET /usuarios/@id', function ($id) {
		$sql = "CALL PROCEDURE_LISTAR_USUARIO('?')";
    $sentencia = Flight::db() ->prepare($sql);
		$sentencia->bindParam(1,$cedula);
		$sentencia->execute();
		$datos=$sentencia->fetchAll();
		Flight::json($datos);
  });
?>