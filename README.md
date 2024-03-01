# Catálogo API

Este repositorio contiene el SQL correspondiente a la aplicación "catalogo-front", así como la API correspondiente desarrollada en [FlightPHP](https://docs.flightphp.com/). A continuación, encontrarás la documentación del proyecto con sus respectivos módulos e instalación.

## Base de Datos

La base de datos consta de 8 tablas, como se muestra en el modelo físico. A continuación, se explicará brevemente la razón de cada tabla y, posteriormente, los procedimientos almacenados:

1. **Tabla "usuario":** Contiene información para identificar a los diferentes usuarios, incluyendo datos de control y una pregunta y respuesta de seguridad en caso de ser necesaria (estos dos campos funcionan como una contraseña secundaria en caso de olvido).

2. **Tabla "categoria":** Permite agrupar una serie de productos en una sección al introducirlos en una categoría. Esto posibilita realizar modificaciones de precio, IVA y descuento a una lista de productos vinculados a una categoría.

3. **Tabla "Producto":** Almacena la información base de un producto. Esta tabla funciona como una subcategoría, por lo tanto, al crear o modificar un producto, es necesario ingresar las variantes de color que tiene en la tabla "producto_informacion".

4. **Tabla "producto_informacion":** Almacena cada estilo respectivo de cada producto. Al intentar cargar un producto en el carrito, se debe seleccionar uno de los estilos almacenados en esta tabla.

5. **Tabla "venta":** Almacena la información generada de una compra, como su número de venta, estado, valor, entre otros datos.

6. **Tabla "item":** Almacena la información de cada ítem o producto que ha sido cargado en una compra. Aunque esta tabla no contiene una llave primaria, utiliza distintos campos respectivos para una correcta modificación de los datos.

7. **Tabla "Aplicacion":** Almacena el estado del catálogo, ya sea que esté abierto a las compras o se encuentre en cierre de caja.

8. **Tabla "Historial":** Aunque esta tabla aún no representa una pieza clave en el sistema, para aprovechar al máximo su eficacia, se debe implementar el uso de tokens (actualmente se emplea LocalStorage como almacenamiento de la sesión).
