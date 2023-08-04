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
	Flight::route('PUT /mod/usuario/pregunta', function () {
		$cedula = Flight::request()->data->cedula;
		$pregunta = Flight::request()->data->pregunta;
		$respuesta = Flight::request()->data->respuesta;
    $sentencia = Flight::db() ->prepare("CALL PROCEDURE_MODIFICARPREGUNTA_USUARIO('$cedula','$pregunta','$respuesta')");
		$sentencia->execute();
		$datos=$sentencia->fetchAll();
		Flight::json($datos);
  });

  	// Actualizar informacion del usuario
	Flight::route('PUT /mod/usuario/nombre', function () {
		$cedula = Flight::request()->data->cedula;
		$nombre = Flight::request()->data->nombre;
    $sentencia = Flight::db() ->prepare("CALL PROCEDURE_MODIFICARNOMBRE_USUARIO('$cedula','$nombre')");
		$sentencia->execute();
		$datos=$sentencia->fetchAll();
		Flight::json($datos);
  });
  
  // Actualizar informacion del usuario
	Flight::route('PUT /mod/usuario/contacto', function () {
		$cedula = Flight::request()->data->cedula;
		$contacto = Flight::request()->data->contacto;
    $sentencia = Flight::db() ->prepare("CALL PROCEDURE_MODIFICARCONCTACTO_USUARIO('$cedula','$contacto')");
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

    // Actualizar estado venta
	Flight::route('PUT /mod/venta/estado', function () {
		$codigo = Flight::request()->data->codigo;
		$estado = Flight::request()->data->estado;
		$cedula = Flight::request()->data->cedula;
    $sentencia = Flight::db() ->prepare("CALL PROCEDURE_MODIFICAR_ESTADOVENTA('$codigo','$estado','$cedula')");
		$sentencia->execute();
		$datos=$sentencia->fetchAll();
		Flight::json($datos);
  });

   // Actualizar venta
	Flight::route('PUT /mod/venta/modificar', function () {
		$codigo = Flight::request()->data->codigo;
		$iva = Flight::request()->data->iva;
		$descuento = Flight::request()->data->descuento;
		$total = Flight::request()->data->total;
		$estado = Flight::request()->data->estado;
		$cedula = Flight::request()->data->cedula;
    $sentencia = Flight::db() ->prepare("CALL PROCEDURE_MODIFICAR_VENTA('$codigo','$iva','$descuento','$total','$estado','$cedula')");
		$sentencia->execute();
		$datos=$sentencia->fetchAll();
		Flight::json($datos);
  });

    // Actualizar informacion de la categoria
	Flight::route('PUT /mod/categoria/estado', function () {
		$codigo = Flight::request()->data->codigo;
		$estado = Flight::request()->data->estado;
    $sentencia = Flight::db() ->prepare("CALL PROCEDURE_MODIFICAR_ESTADOCATEGORIA('$codigo','$estado')");
		$sentencia->execute();
		$datos=$sentencia->fetchAll();
		Flight::json($datos);
  });

  // Actualizar informacion de la categoria
	Flight::route('PUT /mod/categoria/nombre', function () {
		$codigo = Flight::request()->data->codigo;
		$nombre = Flight::request()->data->nombre;
    $sentencia = Flight::db() ->prepare("CALL PROCEDURE_MODIFICAR_NOMBRECATEGORIA('$codigo','$nombre')");
		$sentencia->execute();
		$datos=$sentencia->fetchAll();
		Flight::json($datos);
  });

  // Actualizar el iva de los productos vinculados a una categoria
	Flight::route('PUT /mod/categoria/iva', function () {
		$codigo = Flight::request()->data->codigo;
		$iva = Flight::request()->data->iva;
    $sentencia = Flight::db() ->prepare("CALL PROCEDURE_MODIFICAR_CATEGORIAIVA('$codigo','$iva')");
		$sentencia->execute();
		$datos=$sentencia->fetchAll();
		Flight::json($datos);
  });

  // Actualizar el descuento de los productos vinculados a una categoria
	Flight::route('PUT /mod/categoria/descuento', function () {
		$codigo = Flight::request()->data->codigo;
		$descuento = Flight::request()->data->descuento;
    $sentencia = Flight::db() ->prepare("CALL PROCEDURE_MODIFICAR_CATEGORIADESCUENTO('$codigo','$descuento')");
		$sentencia->execute();
		$datos=$sentencia->fetchAll();
		Flight::json($datos);
  });

  // Actualizar el valor de los productos vinculados a una categoria
	Flight::route('PUT /mod/categoria/valor', function () {
		$codigo = Flight::request()->data->codigo;
		$valor = Flight::request()->data->valor;
    $sentencia = Flight::db() ->prepare("CALL PROCEDURE_MODIFICAR_CATEGORIAVALORNUMERO('$codigo','$valor')");
		$sentencia->execute();
		$datos=$sentencia->fetchAll();
		Flight::json($datos);
  });

  // Actualizar el porcentaje de los productos vinculados a una categoria
	Flight::route('PUT /mod/categoria/porcentaje', function () {
		$codigo = Flight::request()->data->codigo;
		$porcentaje = Flight::request()->data->porcentaje;
    $sentencia = Flight::db() ->prepare("CALL PROCEDURE_MODIFICAR_CATEGORIAVALORPORCENTAJE('$codigo','$porcentaje')");
		$sentencia->execute();
		$datos=$sentencia->fetchAll();
		Flight::json($datos);
  });
?>