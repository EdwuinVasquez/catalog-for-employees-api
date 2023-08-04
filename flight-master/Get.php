<?php 
// Obtener informacion lista de imagenes
Flight::route('GET /getImagenes', function () {
	$directory = '../galeria'; // Reemplaza esto con la ruta de tu directorio
    $files = scandir($directory);

    // Filtramos los archivos y carpetas '.' y '..'
    $files = array_filter($files, function($file) {
        return !in_array($file, ['.', '..']);
    });

    // Retornamos los archivos como un JSON
    Flight::json($files);
});

// Obtener informacion de la app
	Flight::route('GET /getHome', function () {
		$sql = "CALL PROCEDURE_LISTAR_DATOSHOME()";
    	$sentencia = Flight::db() ->prepare($sql);
		$sentencia->execute();
		$datos=$sentencia->fetchAll();
		Flight::json($datos);
  });

	// Obtener informacion de usuarios 
	Flight::route('GET /getUsuario/@id', function ($id) {
		$sql = "CALL PROCEDURE_LISTAR_USUARIO('$id')";
    	$sentencia = Flight::db() ->prepare($sql);
		$sentencia->execute();
		$datos=$sentencia->fetchAll();
		Flight::json($datos);
  });

  // Obtener informacion de basica producto 
	Flight::route('GET /getProductoBase', function () {
		$sql = "CALL PROCEDURE_LISTAR_PRODUCTOS()";
    	$sentencia = Flight::db() ->prepare($sql);
		$sentencia->execute();
		$datos=$sentencia->fetchAll();
		Flight::json($datos);
  });

  // Obtener informacion de venta
	Flight::route('GET /getVenta/@id', function ($id) {
		$sql = "CALL PROCEDURE_LISTAR_VENTAS('$id')";
    	$sentencia = Flight::db() ->prepare($sql);
		$sentencia->execute();
		$datos=$sentencia->fetchAll();
		Flight::json($datos);
  });

  // Obtener informacion de basica categoria 
	Flight::route('GET /getCategoria', function () {
		$sql = "CALL PROCEDURE_LISTAR_CATEGORIAS()";
    	$sentencia = Flight::db() ->prepare($sql);
		$sentencia->execute();
		$datos=$sentencia->fetchAll();
		Flight::json($datos);
  });
?>