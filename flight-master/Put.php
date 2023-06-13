<?php 
	// Obtener informacion de usuarios 
  Flight::route('GET /usuarios', function () {
    $sentencia = Flight::db() ->prepare("CALL PROCEDURE_LISTAR_USUARIO('')");
		$sentencia->execute();
		$datos=$sentencia->fetchAll();
		Flight::json($datos);
  });
?>