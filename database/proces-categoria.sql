-- LISTAR CATEGORIAS --
DROP PROCEDURE IF EXISTS `PROCEDURE_LISTAR_CATEGORIAS`;

DELIMITER $$
CREATE PROCEDURE `PROCEDURE_LISTAR_CATEGORIAS`()
BEGIN
	SELECT CATEGORIA.CODIGO_CATEGORIA,
	CATEGORIA.NOMBRE_CATEGORIA,
	CATEGORIA.DISPONIBILIDAD,
	(SELECT  COUNT(PRODUCTO.CODIGO_PRODUCTO) FROM PRODUCTO WHERE PRODUCTO.ID_CATEGORIA = CATEGORIA.CODIGO_CATEGORIA) AS "NUMERO_PRODUCTOS",
    (SELECT IFNULL(FORMAT(AVG(PRODUCTO.IVA), 1), 0) FROM PRODUCTO WHERE PRODUCTO.ID_CATEGORIA = CATEGORIA.CODIGO_CATEGORIA) AS "PROMEDIO_IVA",
   	(SELECT IFNULL(FORMAT(AVG(PRODUCTO.DESCUENTO), 1), 0) FROM PRODUCTO WHERE PRODUCTO.ID_CATEGORIA = CATEGORIA.CODIGO_CATEGORIA) AS "PROMEDIO_DESCUENTO"
	FROM CATEGORIA;
END $$
DELIMITER ;

-- REGISTAR CATEGORIA --
DROP PROCEDURE IF EXISTS `PROCEDURE_INGRESAR_CATEGORIA`;

DELIMITER $$
CREATE PROCEDURE `PROCEDURE_INGRESAR_CATEGORIA`
	(IN VAR_NOMBRE VARCHAR(700))
BEGIN
	DECLARE VERIF DOUBLE;
	SET VERIF = (SELECT COUNT(CODIGO_CATEGORIA) FROM CATEGORIA WHERE NOMBRE_CATEGORIA = UPPER(VAR_NOMBRE));
	INSERT INTO CATEGORIA(CODIGO_CATEGORIA, NOMBRE_CATEGORIA, DISPONIBILIDAD)
	VALUES (NULL, UPPER(VAR_NOMBRE), 1);
	SELECT * FROM CATEGORIA;
END $$
DELIMITER ;

-- MOFDIFICAR ESTADO CATEGORIA --
DROP PROCEDURE IF EXISTS `PROCEDURE_MODIFICAR_ESTADOCATEGORIA`;

DELIMITER $$
CREATE PROCEDURE `PROCEDURE_MODIFICAR_ESTADOCATEGORIA`
	(IN VAR_CODIGO DOUBLE, IN VAR_ESTADOCATEGORIA DOUBLE)
BEGIN
	UPDATE CATEGORIA
	SET DISPONIBILIDAD = VAR_ESTADOCATEGORIA
	WHERE CODIGO_CATEGORIA = VAR_CODIGO;

	SELECT * FROM CATEGORIA;
END $$
DELIMITER ;

-- MODIFICAR NOMBRE CATEGORIA --
DROP PROCEDURE IF EXISTS `PROCEDURE_MODIFICAR_NOMBRECATEGORIA`;

DELIMITER $$
CREATE PROCEDURE `PROCEDURE_MODIFICAR_NOMBRECATEGORIA`
	(IN VAR_CODIGO DOUBLE, IN VAR_NOMBRE VARCHAR(700))
BEGIN
	UPDATE CATEGORIA
	SET NOMBRE_CATEGORIA = UPPER(VAR_NOMBRE)
	WHERE CODIGO_CATEGORIA = VAR_CODIGO;

	SELECT * FROM CATEGORIA;
END $$
DELIMITER ;

-- ELIMINAR NOMBRE CATEGORIA --
DROP PROCEDURE IF EXISTS `PROCEDURE_ELIMINAR_CATEGORIA`;

DELIMITER $$
CREATE PROCEDURE `PROCEDURE_ELIMINAR_CATEGORIA`
	(IN VAR_CODIGO DOUBLE)
BEGIN
	DECLARE DEC_VACIO, DEC_NUMEROPRODUCTOS DOUBLE;
	SET DEC_VACIO = (SELECT IFNULL(VAR_CODIGO, 0));
	SET DEC_NUMEROPRODUCTOS = (SELECT COUNT(ID_CATEGORIA) FROM PRODUCTO WHERE ID_CATEGORIA = DEC_VACIO);
	
	IF(DEC_NUMEROPRODUCTOS = 0 AND DEC_VACIO != 0) THEN
		DELETE FROM CATEGORIA WHERE CODIGO_CATEGORIA = VAR_CODIGO;
		SELECT "CATEGORIA ELIMINADA" AS "RESULTADO";
	ELSE 
		SELECT "ERROR LA CATEGORIA NO SE PUEDE BORRAR YA QUE PODRIA AFECTAR GRAVEMENTE LOS DATOS ALMACENADO"  AS "RESULTADO";
	END IF;
END $$
DELIMITER ;

-- MODIFICAR IVA --
DROP PROCEDURE IF EXISTS `PROCEDURE_MODIFICAR_CATEGORIAIVA`;

DELIMITER $$
CREATE PROCEDURE `PROCEDURE_MODIFICAR_CATEGORIAIVA`
	(IN VAR_CODIGO DOUBLE, IN VAR_IVA DOUBLE)
BEGIN
	UPDATE PRODUCTO
	SET IVA = VAR_IVA
	WHERE ID_CATEGORIA = VAR_CODIGO;
END $$
DELIMITER ;

-- MODIFICAR DESCUENTO --
DROP PROCEDURE IF EXISTS `PROCEDURE_MODIFICAR_CATEGORIADESCUENTO`;

DELIMITER $$
CREATE PROCEDURE `PROCEDURE_MODIFICAR_CATEGORIADESCUENTO`
	(IN VAR_CODIGO DOUBLE, IN VAR_DESCUENTO DOUBLE)
BEGIN
	UPDATE PRODUCTO
	SET DESCUENTO = VAR_DESCUENTO
	WHERE ID_CATEGORIA = VAR_CODIGO;
END $$
DELIMITER ;

-- MODIFICAR VALOR NUMERO --
DROP PROCEDURE IF EXISTS `PROCEDURE_MODIFICAR_CATEGORIAVALORNUMERO`;

DELIMITER $$
CREATE PROCEDURE `PROCEDURE_MODIFICAR_CATEGORIAVALORNUMERO`
	(IN VAR_CODIGO DOUBLE, IN VAR_NUMERO DOUBLE)
BEGIN
	UPDATE PRODUCTO
	SET PRECIO_BASE = (PRECIO_BASE + VAR_NUMERO)
	WHERE ID_CATEGORIA = VAR_CODIGO;
END $$
DELIMITER ;

-- MODIFICAR VALOR PORCENTAJE --
DROP PROCEDURE IF EXISTS `PROCEDURE_MODIFICAR_CATEGORIAVALORPORCENTAJE`;

DELIMITER $$
CREATE PROCEDURE `PROCEDURE_MODIFICAR_CATEGORIAVALORPORCENTAJE`
	(IN VAR_CODIGO DOUBLE, IN VAR_NUMERO DOUBLE)
BEGIN
	UPDATE PRODUCTO
	SET PRECIO_BASE = (PRECIO_BASE + ((PRECIO_BASE/100)*VAR_NUMERO))
	WHERE ID_CATEGORIA = VAR_CODIGO;
END $$
DELIMITER ;