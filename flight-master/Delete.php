<?php 
	// eliminar usuarios 
	Flight::route('DELETE /del/usuario', function () {
		$cedula = Flight::request()->data->cedula;
    $sentencia = Flight::db()->prepare("CALL PROCEDURE_ELIMINAR_USUARIO('$cedula')");
		$sentencia->execute();
		$datos=$sentencia->fetchAll();
		Flight::json($cedula);
  });

  	// eliminar producto 
	Flight::route('DELETE /del/producto', function () {
		$codigo = Flight::request()->data->codigo;
    $sentencia = Flight::db()->prepare("CALL PROCEDURE_ELIMINAR_PRODUCTO('$cedula')");
		$sentencia->execute();
		$datos=$sentencia->fetchAll();
		Flight::json($cedula);
  });
?>