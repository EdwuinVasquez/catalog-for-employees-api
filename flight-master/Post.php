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

  // envia un nuevo producto
	Flight::route('POST /pos/producto/base', function () {
    $codigo = Flight::request()->data->codigo;
    $nombre = Flight::request()->data->nombre;
    $img = Flight::request()->data->img;
    $iva = Flight::request()->data->iva;
    $descuento = Flight::request()->data->descuento;
    $precio = Flight::request()->data->precio;
    $detalles = Flight::request()->data->detalles;
    $disponible = Flight::request()->data->disponible;
    $estado = Flight::request()->data->estado;
    $categoria = Flight::request()->data->categoria;
    $sentencia = Flight::db()->prepare("CALL PROCEDURE_INGRESAR_USUARIO('$codigo', '$nombre', '$img', '$iva', '$descuento', '$precio', '$detalles', '$disponible', '$estado', '$categoria')");
		$sentencia->execute();
		$datos=$sentencia->fetchAll();
		Flight::json($datos);
  });
?>
