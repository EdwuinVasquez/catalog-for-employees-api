<?php 
	// Actualizar estado del usuario
	Flight::route('PUT /mod/usuario/estado', function () {
		$cedula = Flight::request()->data->cedula;
		$estado = Flight::request()->data->estado;
    $sentencia = Flight::db() ->prepare("CALL PROCEDURE_MODIFICAR_ESTADOUSUARIO_USUARIO('$cedula','$estado')");
		$sentencia->execute();
		$datos=$sentencia->fetchAll();
		Flight::json($datos);
  });

	// Actualizar estado de verificacion del usuario
	Flight::route('PUT /mod/usuario/verificado', function () {
		$cedula = Flight::request()->data->cedula;
    $sentencia = Flight::db() ->prepare("CALL PROCEDURE_MODIFICAR_ESTADOVERIFICADO_USUARIO('$cedula')");
		$sentencia->execute();
		$datos=$sentencia->fetchAll();
		Flight::json($datos);
  });

	// Actualizar informacion del usuario
	Flight::route('PUT /mod/usuario/datos', function () {
		$cedula = Flight::request()->data->cedula;
		$nombre = Flight::request()->data->nombre;
		$clave = Flight::request()->data->clave;
		$pregunta = Flight::request()->data->pregunta;
		$respuesta = Flight::request()->data->respuesta;
		$contacto = Flight::request()->data->contacto;
    $sentencia = Flight::db() ->prepare("CALL PROCEDURE_MODIFICAR_USUARIO('$cedula','$nombre','$clave','$pregunta','$respuesta','$contacto')");
		$sentencia->execute();
		$datos=$sentencia->fetchAll();
		Flight::json($datos);
  });

	// Actualizar contraseña del usuario
	Flight::route('PUT /mod/usuario/clave', function () {
		$cedula = Flight::request()->data->cedula;
		$clave = Flight::request()->data->clave;
    $sentencia = Flight::db() ->prepare("CALL PROCEDURE_MODIFICAR_CLAVE_USUARIO('$cedula','$clave')");
		$sentencia->execute();
		$datos=$sentencia->fetchAll();
		Flight::json($datos);
  });

	// Actualizar ultimo ingreso al sistema
	Flight::route('PUT /mod/usuario/login', function () {
		$cedula = Flight::request()->data->cedula;
    $sentencia = Flight::db() ->prepare("CALL PROCEDURE_MODIFICAR_ULTIMOINGRESO_USUARIO('$cedula')");
		$sentencia->execute();
		$datos=$sentencia->fetchAll();
		Flight::json($datos);
  });

  // Actualizar estado del producto
	Flight::route('PUT /mod/producto/estado', function () {
		$codigo = Flight::request()->data->codigo;
		$estado = Flight::request()->data->estado;
    $sentencia = Flight::db() ->prepare("CALL PROCEDURE_MODIFICAR_ESTADOPRODUCTO_PRODUCTO('$codigo','$estado')");
		$sentencia->execute();
		$datos=$sentencia->fetchAll();
		Flight::json($datos);
  });

  // Actualizar disponibilidad del producto
	Flight::route('PUT /mod/producto/disponibilidad', function () {
		$codigo = Flight::request()->data->codigo;
		$estado = Flight::request()->data->estado;
    $sentencia = Flight::db() ->prepare("CALL PROCEDURE_MODIFICAR_DISPONIBILIDADPRODUCTO_PRODUCTO('$codigo','$estado')");
		$sentencia->execute();
		$datos=$sentencia->fetchAll();
		Flight::json($datos);
  });

  // Actualizar informacion del producto
	Flight::route('PUT /mod/producto/datosbase', function () {
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
    $sentencia = Flight::db() ->prepare("CALL PROCEDURE_MODIFICAR_PRODUCTO('$codigo', '$nombre', '$img', '$iva', '$descuento', '$precio', '$detalles', '$disponible', '$estado', '$categoria')");
		$sentencia->execute();
		$datos=$sentencia->fetchAll();
		Flight::json($datos);
  });
?>