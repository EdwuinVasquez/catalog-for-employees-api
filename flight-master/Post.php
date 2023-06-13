<?php 
  Flight::route('POST /usuarios', function () {
    //Obtener datos recibidos
		$cedula =(Flight::request()->data->cedula);
		//Declara consulta SQL
		$sql = "CALL PROCEDURE_LISTAR_USUARIO('?')";
    $sentencia = Flight::db() ->prepare($sql);
		//Preparar datos
		$sentencia->bindParam(1,$cedula);
		//Ejecucion del querry y lectura
		$sentencia->execute();
		Flight::jsonp(["Usuario registrado"]);
  });
?>