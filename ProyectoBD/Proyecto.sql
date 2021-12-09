drop database bdproyecto;
create database bdproyecto;
USE bdproyecto;

/*SE CREAN LAS TABLAS CON SUS RESPECTIVAS CLAVE PRINCIPALES Y FORANEAS*/
CREATE TABLE USUARIOS(
    Usuario varchar(25) NOT NULL,
    Nombre varchar(50) NOT NULL,
    Apellidos varchar(50) NOT NULL,
    CorreoElectronico varchar(50) NOT NULL,
    Contraseña varchar(20) NOT NULL,
    Telefono varchar(10)  NOT NULL,
    PRIMARY KEY (Usuario)
);

CREATE TABLE PRODUCTO(
	IdProducto Integer(10) AUTO_INCREMENT,
    Nombre varchar(25) NOT NULL,
    Cantidad Integer(5) NOT NULL,
    Precio float(5) NOT NULL,
    PRIMARY KEY (IdProducto)
);

CREATE TABLE CARRITO(
	Usuario varchar(25) NOT NULL,
	IdProducto Integer(10) NOT NULL,
    Nombre varchar(20) NOT NULL,
    Cantidad Integer(10) NOT NULL,
    Precio float(10) NOT NULL,
    FOREIGN KEY (Usuario) REFERENCES USUARIOS(Usuario),
    FOREIGN KEY (IdProducto) REFERENCES PRODUCTO(IdProducto)
);

CREATE TABLE PEDIDO(
	IdPedido Integer(10) AUTO_INCREMENT,
    Usuario varchar(25) NOT NULL,
    IdProducto Integer(10) NOT NULL,
    Pais varchar(50) NOT NULL,
    Ciudad varchar(50) NOT NULL,
    Direccion VARCHAR(50) NOT NULL,
    Direccion_2 VARCHAR(50) DEFAULT NULL,
    Codigo_Postal VARCHAR(10) NOT NULL,
    Tipo_Pago VARCHAR(50) NOT NULL,
	PRIMARY KEY (IdPedido),
    FOREIGN KEY (Usuario) REFERENCES USUARIOS(Usuario),
    FOREIGN KEY (IdProducto) REFERENCES PRODUCTO(IdProducto)
);

CREATE TABLE ENVIO(
	IdRastreo Integer(10) AUTO_INCREMENT,
    IdPedido Integer(10) NOT NULL,
    Compañia Character(50) NOT NULL,
    Fecha_Envio date NOT NULL,
    Tipo_Envio Character(50) NOT NULL,
    Estado varchar(50) Not NULL,
    PRIMARY KEY (IdRastreo),
    FOREIGN KEY (IdPedido) REFERENCES PEDIDO(IdPedido)
);

/*SE INGRESAN LOS DATOS EN US RESPECTIVAS TABLAS*/
INSERT INTO `USUARIOS` (`Usuario`, `Nombre`,`Apellidos`, `CorreoElectronico`, `Contraseña`,`Telefono`) VALUES
('lcsanche', 'Luis', 'Sanchez','lcsanche@hotmail.com', 'lcsanche','095712012'),
('Jramirez', 'Jofre','Ramirez', 'Jofrrisc@hotmail.com', 'Jofrrisc','095874905'),
('Oscar85', 'Oscar', 'feeney','shanie.feeney@hotmail.info', '1234','095623141'),
('Ger52', 'Germaine', 'waters','gwaters@hotmail.com', '1234','091474836'),
('Eme54', 'Emery', 'alene','alene78@hotmail.com', '1234','097841452'),
('Eve52', 'Everett', 'rodger','rodger.vonrueden@hotmail.com', '1234','097957841'),
('River25', 'River', 'nasir','nasir19@hotmail.com', '1234','095214786'),
('Heather4', 'Heather', 'thiel','thiel.stefan@hotmail.com','1234', '095326478'),
('Isobel2', 'Isobel', 'kuphal','ana.kuphal@hotmail.com', '1234','095471412'),
('Brand25', 'Brandon', 'preston','preston59@hotmail.com', '1234','095732659');

INSERT INTO `PRODUCTO` (`Nombre`,`Cantidad`, `Precio`) VALUES ('Desodorante', 3, 1.00),		('Suavitel', 10, 1.25),
('Perfume', 20, 5.60),		('Cereal', 32, 0.95),		('Pasta', 17, 1.25),			('Leche', 9, 1.00),
('Cafe', 1, 1.50),		('Arroz', 32, 2.54),		('Helado', 63, 2.45),			('Caramelos', 23, 0.45);

INSERT INTO `PEDIDO` (`Usuario`, `IdProducto`, `Pais`, `Ciudad`, `Direccion`, `Direccion_2`, `Codigo_Postal`, `Tipo_Pago`) VALUES 
('lcsanche', 1, 'Tokelau', 'Rolfsonchester', '711 Pouros Pike', 'Suite 062', '34968', 'tarjeta de credito'),
('Jramirez', 2, 'Bolivia', 'Lake Elliotburgh', '6736 Shaun Parkways Suite 979', 'Apt. 292', '22126', 'deposito'),
('Oscar85', 3, 'Saudi Arabia', 'Hicklemouth', '39173 Joy Burg Apt. 483', 'Suite 889', '99394', 'deposito'),
('Ger52', 4, 'Liechtenstein', 'Monahanshire', '9509 Antonio Way', 'Suite 670', '39940', 'cheque'),
('Eve52', 5, 'Cameroon', 'Vandervortstad', '644 Denesik Ways', 'Suite 864', '12937', 'tarjeta de credito'),
('River25', 6, 'Dominica', 'Adeleberg', '614 Boyd Parkway', 'Suite 637', '90999', 'cheque'),
('Brand25', 1, 'Timor-Leste', 'East Jairostad', '72329 Johns Inlet Suite 055', 'Suite 754', '8861', 'cheque'),
('Isobel2', 9, 'Montserrat', 'Auerberg', '331 Gutkowski Locks Suite 451', 'Apt. 516', '56100', 'cheque'),
('lcsanche', 7, 'Uruguay', 'Montevideo', '751 arron altet Suite 055', 'Suite 754', '8861', 'tarjeta de credito'),
('Jramirez', 5, 'Montserrat', 'Auerberg', '523 lonweyr Locks Suite 451', 'Apt. 516', '56100', 'tarjeta de credito');

INSERT INTO `ENVIO` (`IdPedido`, `Compañia`, `Fecha_Envio`, `Tipo_Envio`, `Estado`) VALUES (2, 'Arkhan dn', '2020-03-15', 52145,'Entregado'),
(1, 'D.B ELMIERS', '2020-08-16', 52145,'Enviado'),
(2, 'EMPRY ALNS', '2020-09-17', 52145,'Entregado'),
(3, 'DATA CIENTIFY', '2020-10-18', 52145,'Enviado'),
(4, 'S.S LNMILL', '2020-11-19', 52145,'Entregado'),
(5, 'GARTHIN S.A', '2020-12-20', 52145,'Procesado'),
(4, 'LKING M.V', '2020-01-21', 52145,'Procesado'),
(3, 'KINGSTOM', '2020-02-22', 52145,'Procesado'),
(2, 'REGIONAL EMTY', '2020-03-23', 52145,'Entregado'),
(1, 'MONTAIN L.N', '2020-04-24', 52145,'Entregado');

/*SE CREAN LOS RESPECTIVOS STORE PROCEDURE PARA LAS DIFERENTES ACCIONES QUE SE REALIZARAN*/
DELIMITER $
CREATE PROCEDURE REGISTRAR_CLIENTE(IN Usuario1 VARCHAR(25), IN Nombre1 VARCHAR(50), IN Apellidos1 VARCHAR(50), IN CorreoElectronico1 VARCHAR(50), IN Contraseña1 VARCHAR(20), IN Telefono1 VARCHAR(10))
	BEGIN
		IF NOT EXISTS (SELECT Usuario, Nombre, Apellidos, CorreoElectronico, Contraseña,Telefono FROM USUARIOS WHERE Usuario = Usuario1) THEN
			INSERT INTO USUARIOS(Usuario, Nombre, Apellidos, CorreoElectronico, Contraseña,Telefono) VALUES (Usuario1, Nombre1, Apellidos1, CorreoElectronico1, Contraseña1, Telefono1);
		END if;
	END$
DELIMITER ;

DELIMITER //
create procedure BUSCAR_PRODUCTO (in Nombre1 varchar(25))
begin 
select * from PRODUCTO where Nombre=Nombre1;
end//

DELIMITER $
CREATE PROCEDURE AGREGAR_CARRITO(IN Usuario1 VARCHAR(25), IN IdProducto1 integer(10), IN Nombre1 VARCHAR(20), IN Cantidad1 integer(10), IN Precio1 float(10))
	BEGIN
    IF EXISTS (SELECT * FROM CARRITO WHERE Usuario = Usuario1 and IdProducto = IdProducto1) THEN
		UPDATE CARRITO SET Usuario = Usuario1, IdProducto = IdProducto1, Nombre = Nombre1, Cantidad = Cantidad+1, Precio=Precio*2 WHERE Usuario=Usuario and IdProducto = IdProducto1;
    else   
		INSERT INTO CARRITO(Usuario, IdProducto, Nombre, Cantidad, Precio) VALUES (Usuario1, IdProducto1, Nombre1, Cantidad1, Precio1);
		END IF;
	END$
DELIMITER ;

DELIMITER //
CREATE PROCEDURE AGREGAR_PEDIDO(IN Usuario1 VARCHAR(25), IN IdProducto1 integer(10), IN Cantidad1 integer(10), IN Pais1 VARCHAR(50), IN Ciudad1 VARCHAR(50), IN Direccion1 VARCHAR(50), IN Direccion2 VARCHAR(50), IN CodigoPostal VARCHAR(10), IN TipoPago VARCHAR(50))
	BEGIN
    INSERT INTO PEDIDO(Usuario, IdProducto, Pais, Ciudad, Direccion, Direccion_2, Codigo_Postal, Tipo_Pago) VALUES (Usuario1, IdProducto1, Pais1, Ciudad1, Direccion1, Direccion2, CodigoPostal, TipoPago);
    UPDATE PRODUCTO SET IdProducto = IdProducto, Nombre = Nombre, Cantidad = Cantidad-Cantidad1, Precio=Precio WHERE IdProducto = IdProducto1;
    DELETE FROM CARRITO WHERE IdProducto = IdProducto1;
END//

select * from USUARIOS;
select * from CARRITO;
select * from PEDIDO;
