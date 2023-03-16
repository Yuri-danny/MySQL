CREATE SCHEMA minimarket;

USE minimarket;

CREATE TABLE Proveedor(

proveedor_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,

nombre VARCHAR (15),
apellido VARCHAR (15),
telefono INTEGER ,
#cuando pongo limite no me deja correo el programa dice que en un futuro no se podra limitar (integer)
correo VARCHAR (50)

);

CREATE TABLE TipoProducto(
tipoProducto_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,

nombre VARCHAR(30)
);

CREATE TABLE Producto(

producto_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,

nombre VARCHAR (30),
precio INTEGER,
tipoProducto_id INTEGER
);
#precios en chile no utilizan decimales 
CREATE TABLE ProveedorTipoProducto(

proveedorTipoProducto_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,

proveedor_id INTEGER,
tipoProducto_id INTEGER
);

CREATE TABLE Cliente(
cliente_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
nombre VARCHAR(15),
apellido VARCHAR(15),
correo VARCHAR(50),
direccion VARCHAR(50),
# string letra numero simbolo
rut VARCHAR(15)
#  PARA   - K 
);
CREATE TABLE Boleta(

boleta_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
numeroBoleta BIGINT,
fecha DATE,
total INTEGER,
cliente_id INTEGER
);

ALTER TABLE Producto
ADD FOREIGN KEY (tipoProducto_id) REFERENCES TipoProducto (tipoProducto_id);

ALTER TABLE ProveedorTipoProducto
ADD FOREIGN KEY (proveedor_id) REFERENCES Proveedor(proveedor_id),
ADD FOREIGN KEY (tipoProducto_id) REFERENCES TipoProducto (tipoProducto_id);

ALTER TABLE Boleta
ADD FOREIGN KEY (cliente_id) REFERENCES Cliente (cliente_id);

#poblar 
INSERT INTO Proveedor (nombre, apellido, telefono, correo) values
("Juan", "Contreras", "987452635", "juan@gmail.com"),
("Cristian", "Castro", "974526372", "Cristian@gmail.com"),
("Pedro", "Pascal", "987653721", "Pedro@gmail.com"),
("Jessica", "Molina", "918273465", "jessica@gmail.com"),
("Maria", "Zuñiga", "908372831", "maria@gmail.com");

#asignar 
INSERT INTO TipoProducto (nombre) values
("aseo"),
("bebestibles"),
("carniceria"),
("congelados"),
("verdureria"),
("confites");

INSERT INTO Producto (nombre,precio,tipoProducto_id) value
("jabon","1000", 1),
("cloro","890", 1),
("Coca-Cola", "2300", 2),
("jugosLITRO", "1000", 2),
("lomoKilo", "10000", 3),
("longaniza", "5000", 3),
("helado", "2000", 4),
("hielo", "800", 4),
("lechuga", "1000", 5),
("palta", "100000", 5),
("gomitas", "900", 6),
("chocolates", "2000", 6);

INSERT INTO ProveedorTipoProducto (proveedor_id, tipoProducto_id) value 
(1, 1),
(1, 6 ),
(2, 2),
(3, 3),
(4, 4),
(5, 5);


INSERT INTO Cliente (nombre, apellido, correo, direccion, rut)value
("Teresa", "Rojas", "tere@gmail.com", "calleX123", "71638294-2"),
("Elias", "Moya", "elias@gmail.com", "caleX432", "8272722-k"),
("Jose", "Lobos", "jose@gmail.com", "caleXX928", "822719-1");


INSERT INTO Boleta (numeroBoleta, fecha, total, cliente_id)value
(3478292, "2022-07-08", "10000", 2),
(9181718, "2022-10-11", "98000", 3),
(2987403, "2022-06-19", "7300", 1);

#ver datos de  productos y boleta 
SELECT * FROM Producto;
SELECT * FROM Boleta;
SELECT *FROM ProveedorTipoProducto;
SELECT nombre FROM Proveedor;
SELECT nombre FROM producto;

SELECT Boleta.numeroBoleta, boleta.total, Cliente.nombre , Cliente.apellido
 # aqui se pueden agregar mas cosas de tabla cliente o boleta
FROM Boleta RIGHT JOIN Cliente ON Boleta.cliente_id = Cliente.cliente_id;





