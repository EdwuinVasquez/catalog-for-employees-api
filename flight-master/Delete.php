<?php 
	// eliminar usuarios 
	Flight::route('DELETE /del/usuario/@cedula', function ($cedula) {
    $sentencia = Flight::db()->prepare("CALL PROCEDURE_ELIMINAR_USUARIO('$cedula')");
		$sentencia->execute();
		$datos=$sentencia->fetchAll();
		Flight::json($datos);
  });

  	// eliminar producto 
	Flight::route('DELETE /del/producto/@codigo', function ($codigo) {
    	$sentencia = Flight::db()->prepare("CALL PROCEDURE_ELIMINAR_PRODUCTO('$codigo')");
		$sentencia->execute();
		$datos=$sentencia->fetchAll();
		Flight::json($datos);
  });

  	// eliminar categoiria 
	Flight::route('DELETE /del/categoria/@codigo', function ($codigo) {
    	$sentencia = Flight::db()->prepare("CALL PROCEDURE_ELIMINAR_CATEGORIA('$codigo')");
		$sentencia->execute();
		$datos=$sentencia->fetchAll();
		Flight::json($datos);
  });
?>