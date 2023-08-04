-- LISTAR DATOS HOME --
DROP PROCEDURE IF EXISTS `PROCEDURE_LISTAR_DATOSHOME`;

DELIMITER $$
CREATE PROCEDURE `PROCEDURE_LISTAR_DATOSHOME`()
BEGIN
	SELECT
	(SELECT COUNT(VENTA.ESTADO_VENTA) FROM VENTA WHERE VENTA.ESTADO_VENTA = 3) AS "VENTA_PENDIENTE",
	(SELECT COUNT(VENTA.ESTADO_VENTA) FROM VENTA WHERE VENTA.ESTADO_VENTA = 5) AS "VENTA_PAGA",
	(SELECT COUNT(VENTA.ESTADO_VENTA) FROM VENTA WHERE VENTA.ESTADO_VENTA = 2) AS "VENTA_CANCELADA",
	(SELECT COUNT(VENTA.ESTADO_VENTA) FROM VENTA WHERE VENTA.ESTADO_VENTA = 4) AS "VENTA_ENTREGADA",
	(SELECT COUNT(USUARIO.USUARIO_VERIFICADO) FROM USUARIO WHERE USUARIO.USUARIO_VERIFICADO = 0) AS "USURIOS_SIN_VERIFICAR",
	(SELECT COUNT(USUARIO.USUARIO_VERIFICADO) FROM USUARIO WHERE USUARIO.USUARIO_VERIFICADO = 1 AND USUARIO.USUARIO_ACTIVADO = 1) AS "USUARIOS_ACTIVOS",
	(SELECT COUNT(USUARIO.USUARIO_VERIFICADO) FROM USUARIO WHERE USUARIO.USUARIO_VERIFICADO = 1 AND USUARIO.USUARIO_ACTIVADO = 0) AS "USUARIOS_BLOQUEADOS",
	(SELECT COUNT(PRODUCTO.PRODUCTO_DISPONIBLE) FROM PRODUCTO WHERE PRODUCTO.PRODUCTO_DISPONIBLE = 1) AS "PRODUCTO_ACTIVO",
	(SELECT COUNT(PRODUCTO.PRODUCTO_DISPONIBLE) FROM PRODUCTO WHERE PRODUCTO.PRODUCTO_DISPONIBLE = 0) AS "PRODUCTOS_DESACTIVOS",
	(SELECT APLICACION.CATALOGO_ACTIVO FROM APLICACION LIMIT 1) AS "ESTADO_CATALOGO"
	FROM USUARIO LIMIT 1; 
END $$
DELIMITER ;

-- INSERTAR ALERTA --
DROP PROCEDURE IF EXISTS `PROCEDURE_INGRESAR_APLICACION`;

DELIMITER $$
CREATE PROCEDURE `PROCEDURE_INGRESAR_APLICACION`(IN VAR_ESTADO DOUBLE)
BEGIN
	DELETE FROM APLICACION;
	INSERT INTO APLICACION (CODIGO_APLICACION, CATALOGO_ACTIVO)
	VALUES(1, VAR_ESTADO);
END $$
DELIMITER ;