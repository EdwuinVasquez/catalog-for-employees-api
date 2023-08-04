-- BUSCAR O LISTAR USUARIOS --
DROP PROCEDURE IF EXISTS `PROCEDURE_LISTAR_USUARIO`;

DELIMITER $$
CREATE PROCEDURE `PROCEDURE_LISTAR_USUARIO`(IN VAR_CEDULA DOUBLE)
BEGIN
	DECLARE DEC_VACIO DOUBLE;
	SET DEC_VACIO = (SELECT IFNULL(VAR_CEDULA, 0));
	IF(DEC_VACIO != 0) THEN
		SELECT * ,
		(SELECT COUNT(VENTA.CODIGO_VENTA) 
			FROM VENTA 
			WHERE VENTA.CEDULA_USUARIO = USUARIO.CEDULA) AS 'NUMERO_COMPRAS'
		FROM USUARIO
		WHERE CEDULA = VAR_CEDULA;
	ELSE 
		SELECT * , 
		(SELECT COUNT(VENTA.CODIGO_VENTA) 
			FROM VENTA 
			WHERE VENTA.CEDULA_USUARIO = USUARIO.CEDULA) AS 'NUMERO_COMPRAS'
		FROM USUARIO;
	END IF;
END $$
DELIMITER ;

-- REGISTAR USUARIOS --
DROP PROCEDURE IF EXISTS `PROCEDURE_INGRESAR_USUARIO`;

DELIMITER $$
CREATE PROCEDURE `PROCEDURE_INGRESAR_USUARIO`
	(IN VAR_CEDULA DOUBLE,IN VAR_NOMBRE VARCHAR(700),IN VAR_ROL VARCHAR(300),IN VAR_CLAVE VARCHAR(2000),IN VAR_PREGUNTA VARCHAR(500),IN VAR_RESPUESTA VARCHAR(2000),IN VAR_USUARIO_ACTIVADO DOUBLE,IN VAR_USUARIO_VERIFICADO DOUBLE,IN VAR_CONTACTO VARCHAR(1000))
BEGIN
	DECLARE DEC_VACIO DOUBLE;
	SET DEC_VACIO = (SELECT CEDULA FROM USUARIO WHERE CEDULA = VAR_CEDULA);
	SET DEC_VACIO = (SELECT IFNULL(DEC_VACIO, 0));
	IF(DEC_VACIO = 0 ) THEN
	  INSERT INTO USUARIO (CEDULA, NOMBRE, ROL, CLAVE, PREGUNTA, RESPUESTA, USUARIO_ACTIVADO, USUARIO_VERIFICADO, FECHA_REGISTRO, ULTIMO_INGRESO, CONTACTO) 
	  VALUES (VAR_CEDULA, VAR_NOMBRE, VAR_ROL, VAR_CLAVE, VAR_PREGUNTA, VAR_RESPUESTA, VAR_USUARIO_ACTIVADO, VAR_USUARIO_VERIFICADO, NOW(), NOW(), VAR_CONTACTO);
	 	SELECT "El USUARIO FUE REGISTRADO CORRECTAMENTE" AS "RESULTADO";
	ELSE
	  SELECT "ERROR EL USUARIO YA ESTA REGISTRADO" AS "RESULTADO";
	END IF;
END $$
DELIMITER ;

-- ELIMINAR USUARIOS --
DROP PROCEDURE IF EXISTS `PROCEDURE_ELIMINAR_USUARIO`;

DELIMITER $$
CREATE PROCEDURE `PROCEDURE_ELIMINAR_USUARIO`(IN VAR_CEDULA DOUBLE)
BEGIN
	DECLARE DEC_ROL VARCHAR(300);
	DECLARE DEC_VACIO, DEC_NUMEROCOMPRAS DOUBLE;
	SET DEC_ROL = (SELECT UPPER(ROL) FROM USUARIO WHERE CEDULA = VAR_CEDULA);
	SET DEC_VACIO = (SELECT IFNULL(VAR_CEDULA, 0));

	IF(DEC_ROL = "EMPLEADO") THEN
		SET DEC_NUMEROCOMPRAS = (SELECT COUNT(CODIGO_VENTA) FROM VENTA WHERE CEDULA_USUARIO = VAR_CEDULA);
	END IF;

	IF((DEC_NUMEROCOMPRAS = 0 AND DEC_VACIO != 0) AND DEC_ROL != "ADMINSUPER") THEN
		DELETE FROM USUARIO WHERE CEDULA = VAR_CEDULA;
		SELECT "USUARIO ELIMINADO" AS "RESULTADO";
	ELSE 
		SELECT "ERROR EL USUARIO NO SE PUEDE BORRAR YA QUE PODRIA AFECTAR GRAVEMENTE LOS DATOS ALMACENADO"  AS "RESULTADO";
	END IF;
END $$
DELIMITER ;

-- BLOQUEAR O DESBLOQUEAR USUARIOS --
DROP PROCEDURE IF EXISTS `PROCEDURE_MODIFICAR_ESTADOUSUARIO_USUARIO`;

DELIMITER $$
CREATE PROCEDURE `PROCEDURE_MODIFICAR_ESTADOUSUARIO_USUARIO`(IN VAR_CEDULA DOUBLE, IN VAR_ESTADO DOUBLE)
BEGIN
	DECLARE DEC_VACIO DOUBLE;
	SET DEC_VACIO = (SELECT IFNULL(VAR_CEDULA, 0));
	IF(DEC_VACIO != 0 AND (VAR_ESTADO = 1 OR VAR_ESTADO = 0)) THEN
		UPDATE USUARIO
		SET USUARIO_ACTIVADO = VAR_ESTADO
		WHERE CEDULA = VAR_CEDULA;
		SELECT CONCAT("USUARIO ", VAR_CEDULA, " MODIFICADO") AS "RESULTADO";
	ELSE
		SELECT CONCAT("ERROR EL USUARIO ", VAR_CEDULA, " NO SE PUDO MODIFICAR") AS "RESULTADO";
	END IF;
END $$
DELIMITER ;

-- VERIFICAR USUARIO --
DROP PROCEDURE IF EXISTS `PROCEDURE_MODIFICAR_ESTADOVERIFICADO_USUARIO`;

DELIMITER $$
CREATE PROCEDURE `PROCEDURE_MODIFICAR_ESTADOVERIFICADO_USUARIO`(IN VAR_CEDULA DOUBLE)
BEGIN
	DECLARE DEC_VACIO DOUBLE;
	SET DEC_VACIO = (SELECT IFNULL(VAR_CEDULA, 0));
	IF(DEC_VACIO != 0) THEN
		UPDATE USUARIO
		SET USUARIO_ACTIVADO = 1, USUARIO_VERIFICADO = 1
		WHERE CEDULA = VAR_CEDULA;
		SELECT CONCAT("USUARIO ", VAR_CEDULA, " VERIFICADO") AS "RESULTADO";
	ELSE
		SELECT CONCAT("ERROR EL USUARIO ", VAR_CEDULA, " NO SE PUDO VERIFICAR") AS "RESULTADO";
	END IF;
END $$
DELIMITER ;

-- MOFDIFICAR USUARIO PREGUNTA--
DROP PROCEDURE IF EXISTS `PROCEDURE_MODIFICARPREGUNTA_USUARIO`;

DELIMITER $$
CREATE PROCEDURE `PROCEDURE_MODIFICARPREGUNTA_USUARIO`
	(IN VAR_CEDULA DOUBLE, IN VAR_PREGUNTA VARCHAR(500),IN VAR_RESPUESTA VARCHAR(2000))
BEGIN
	DECLARE DEC_VACIO DOUBLE;
	SET DEC_VACIO = (SELECT IFNULL(VAR_CEDULA, 0));
	IF(DEC_VACIO != 0) THEN
		UPDATE USUARIO
		SET PREGUNTA = VAR_PREGUNTA, 
			RESPUESTA = VAR_RESPUESTA
		WHERE CEDULA = VAR_CEDULA;
		SELECT CONCAT("USUARIO ", VAR_CEDULA, " MODIFICADO") AS "RESULTADO";
	ELSE
		SELECT CONCAT("ERROR EL USUARIO ", VAR_CEDULA, " NO SE PUDO MODIFICAR") AS "RESULTADO";
	END IF;
END $$
DELIMITER ;

-- MOFDIFICAR USUARIO CONTACTO --
DROP PROCEDURE IF EXISTS `PROCEDURE_MODIFICARCONCTACTO_USUARIO`;

DELIMITER $$
CREATE PROCEDURE `PROCEDURE_MODIFICARCONCTACTO_USUARIO`
	(IN VAR_CEDULA DOUBLE,IN VAR_CONTACTO VARCHAR(1000))
BEGIN
	DECLARE DEC_VACIO DOUBLE;
	SET DEC_VACIO = (SELECT IFNULL(VAR_CEDULA, 0));
	IF(DEC_VACIO != 0) THEN
		UPDATE USUARIO
		SET CONTACTO = VAR_CONTACTO
		WHERE CEDULA = VAR_CEDULA;
		SELECT CONCAT("USUARIO ", VAR_CEDULA, " MODIFICADO") AS "RESULTADO";
	ELSE
		SELECT CONCAT("ERROR EL USUARIO ", VAR_CEDULA, " NO SE PUDO MODIFICAR") AS "RESULTADO";
	END IF;
END $$
DELIMITER ;

-- MODIFICAR USUARIO NOMBRE --
DROP PROCEDURE IF EXISTS `PROCEDURE_MODIFICARNOMBRE_USUARIO`;

DELIMITER $$
CREATE PROCEDURE `PROCEDURE_MODIFICARNOMBRE_USUARIO`
	(IN VAR_CEDULA DOUBLE,IN VAR_NOMBRE VARCHAR(1000))
BEGIN
	DECLARE DEC_VACIO DOUBLE;
	SET DEC_VACIO = (SELECT IFNULL(VAR_CEDULA, 0));
	IF(DEC_VACIO != 0) THEN
		UPDATE USUARIO
		SET NOMBRE = VAR_NOMBRE
		WHERE CEDULA = VAR_CEDULA;
		SELECT CONCAT("USUARIO ", VAR_CEDULA, " MODIFICADO") AS "RESULTADO";
	ELSE
		SELECT CONCAT("ERROR EL USUARIO ", VAR_CEDULA, " NO SE PUDO MODIFICAR") AS "RESULTADO";
	END IF;
END $$
DELIMITER ;

-- MODIFICAR CLAVE USUARIO --
DROP PROCEDURE IF EXISTS `PROCEDURE_MODIFICAR_CLAVE_USUARIO`;

DELIMITER $$
CREATE PROCEDURE `PROCEDURE_MODIFICAR_CLAVE_USUARIO`(IN VAR_CEDULA DOUBLE,IN VAR_CLAVE VARCHAR(2000))
BEGIN
	DECLARE DEC_VACIO DOUBLE;
	SET DEC_VACIO = (SELECT IFNULL(VAR_CEDULA, 0));
	IF(DEC_VACIO != 0) THEN
		UPDATE USUARIO
		SET CLAVE = VAR_CLAVE
		WHERE CEDULA = VAR_CEDULA;
		SELECT CONCAT("USUARIO ", VAR_CEDULA, " MODIFICADO") AS "RESULTADO";
	ELSE
		SELECT CONCAT("ERROR EL USUARIO ", VAR_CEDULA, " NO SE PUDO MODIFICAR") AS "RESULTADO";
	END IF;
END $$
DELIMITER ;

-- MODIFICAR CLAVE USUARIO --
DROP PROCEDURE IF EXISTS `PROCEDURE_MODIFICAR_ULTIMOINGRESO_USUARIO`;

DELIMITER $$
CREATE PROCEDURE `PROCEDURE_MODIFICAR_ULTIMOINGRESO_USUARIO`(IN VAR_CEDULA DOUBLE)
BEGIN
	DECLARE DEC_VACIO DOUBLE;
	SET DEC_VACIO = (SELECT IFNULL(VAR_CEDULA, 0));
	IF(DEC_VACIO != 0) THEN
		UPDATE USUARIO
		SET ULTIMO_INGRESO = NOW()
		WHERE CEDULA = VAR_CEDULA;
		SELECT CONCAT("USUARIO ", VAR_CEDULA, " LOGUEADO") AS "RESULTADO";
	ELSE
		SELECT CONCAT("ERROR EL  USUARIO ", VAR_CEDULA, " NO SE PUDO LOGUEAR") AS "RESULTADO";
	END IF;
END $$
DELIMITER ;