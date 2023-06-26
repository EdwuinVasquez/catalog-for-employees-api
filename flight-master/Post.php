<?php 
	// envia un nuevo registro
	Flight::route('POST /pos/usuario/registro', function () {
    $cedula = Flight::request()->data->cedula;
    $nombre = Flight::request()->data->nombre;
    $rol = Flight::request()->data->rol;
    $clave = Flight::request()->data->clave;
    $pregunta = Flight::request()->data->pregunta;
    $respuesta = Flight::request()->data->respuesta;
    $activado = Flight::request()->data->activado;
    $verificado = Flight::request()->data->verificado;
    $contacto = Flight::request()->data->contacto;
    $sentencia = Flight::db()->prepare("CALL PROCEDURE_INGRESAR_USUARIO('$cedula', '$nombre', '$rol', '$clave', '$pregunta', '$respuesta', '$activado', '$verificado', '$contacto')");
		$sentencia->execute();
		$datos=$sentencia->fetchAll();
		Flight::json($datos);
  });
?>