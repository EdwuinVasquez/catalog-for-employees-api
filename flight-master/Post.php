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

  // envia una compra
	Flight::route('POST /pos/venta/nueva', function () {
    $valorIva = Flight::request()->data->valorIva;
    $valorDescuento = Flight::request()->data->valorDescuento;
    $valorTotal = Flight::request()->data->valorTotal;
    $estadoVenta = Flight::request()->data->estadoVenta;
    $observaciones = Flight::request()->data->observaciones;
    $cedula = Flight::request()->data->cedula;
    $sentencia = Flight::db()->prepare("CALL PROCEDURE_INGRESAR_VENTA('$valorIva', '$valorDescuento', '$valorTotal', '$estadoVenta', '$observaciones', '$cedula')");
		$sentencia->execute();
		$datos=$sentencia->fetchAll();
		Flight::json($datos);
  });

  // envia un nuevo item venta
	Flight::route('POST /pos/item/venta', function () {
    $nombreItem = Flight::request()->data->nombreItem;
    $informacionAdicional = Flight::request()->data->informacionAdicional;
    $descuento = Flight::request()->data->descuento;
    $iva = Flight::request()->data->iva;
    $cantidad = Flight::request()->data->cantidad;
    $valorBase = Flight::request()->data->valorBase;
    $valorIva = Flight::request()->data->valorIva;
    $valorDescuento = Flight::request()->data->valorDescuento;
    $valorTotal = Flight::request()->data->valorTotal;
    $idProducto = Flight::request()->data->idProducto;
    $idVenta = Flight::request()->data->idVenta;
    $sentencia = Flight::db()->prepare("CALL PROCEDURE_INGRESAR_ITEMVENTA('$nombreItem', '$informacionAdicional', '$descuento', '$iva', '$cantidad', '$valorBase', '$valorIva', '$valorDescuento', '$valorTotal', '$idProducto', '$idVenta')");
		$sentencia->execute();
		$datos=$sentencia->fetchAll();
		Flight::json($datos);
  });

    // envia una categoria
	Flight::route('POST /pos/categoria/nueva', function () {
    $nombre = Flight::request()->data->nombre;
    $sentencia = Flight::db()->prepare("CALL PROCEDURE_INGRESAR_CATEGORIA('$nombre')");
		$sentencia->execute();
		$datos=$sentencia->fetchAll();
		Flight::json($datos);
  });

  // envia dato de la app
	Flight::route('POST /pos/aplicacion/alert', function () {
    $estado = Flight::request()->data->estado;
    $sentencia = Flight::db()->prepare("CALL PROCEDURE_INGRESAR_APLICACION('$estado')");
		$sentencia->execute();
		$datos=$sentencia->fetchAll();
		Flight::json($datos);
  });

  //Subir imagen
  Flight::route('POST /pos/subirImagen', function(){
    $requestData = Flight::request()->data;
    $imageBase64 = $requestData['image'];
    $uploadPath = '../galeria/';
    $fileName =  $requestData['nombre']; 

    $imageData = base64_decode($imageBase64);

    if(file_put_contents($uploadPath . $fileName, $imageData)){
      // Si la imagen se guardó correctamente
      Flight::json(['status' => 'success', 'message' => 'Imagen guardada correctamente']);
    } else {
      // Si ocurrió un error al guardar la imagen
      Flight::json(['status' => 'error', 'message' => 'Error al guardar la imagen']);
    }
  });

    // envia un producto
	Flight::route('POST /pos/producto/nuevo', function () {
    $id = Flight::request()->data->id;
    $nombre = Flight::request()->data->nombre;
    $img = Flight::request()->data->img;
    $iva = Flight::request()->data->iva;
    $descuento = Flight::request()->data->descuento;
    $valorSinIva = Flight::request()->data->valorSinIva;
    $detalles = Flight::request()->data->detalles;
    $productoDisponible = Flight::request()->data->productoDisponible;
    $categoriaId = Flight::request()->data->categoriaId;
    $sentencia = Flight::db()->prepare("CALL PROCEDURE_INGRESAR_PRODUCTO('$id','$nombre','$img','$iva','$descuento','$valorSinIva','$detalles','$productoDisponible','6','$categoriaId')");
		$sentencia->execute();
		$datos=$sentencia->fetchAll();
		Flight::json($datos);
  });

    // envia informacion de un producto
	Flight::route('POST /pos/productoInfo/nuevo', function () {
    $id = Flight::request()->data->id;
    $estilo = Flight::request()->data->estilo;
    $tipoContenido = Flight::request()->data->tipoContenido;
    $contenido = Flight::request()->data->contenido;
    $imgExtra = Flight::request()->data->imgExtra;
    $disponible = Flight::request()->data->disponible;
    $sentencia = Flight::db()->prepare("CALL PROCEDURE_INGRESAR_PRODUCTOINFO('$id','$estilo','$tipoContenido','$contenido','$imgExtra','$disponible')");
		$sentencia->execute();
		$datos=$sentencia->fetchAll();
		Flight::json($datos);
  });
?>