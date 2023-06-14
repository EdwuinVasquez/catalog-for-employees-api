<?php 
	// Obtener informacion de usuarios 
	Flight::route('DELETE /usuario', function () {
		$cedula = Flight::request()->data->cedula;
    $sentencia = Flight::db()->prepare("CALL PROCEDURE_ELIMINAR_USUARIO('$cedula')");
		$sentencia->execute();
		$datos=$sentencia->fetchAll();
		Flight::json($cedula);
  });
?>