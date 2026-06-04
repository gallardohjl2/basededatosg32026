CREATE DATABASE EJEMPLOBD;
GO

USE EJEMPLOBD;
GO

-- SQL-LDD
CREATE TABLE categoria(
	categoria_id INT not null, 
	nombre VARCHAR(50) not null, 
	CONSTRAINT pk_categoria
	PRIMARY KEY (categoria_id)
);

CREATE TABLE producto(
	producto_id INT NOT NULL PRIMARY KEY,
	nombre VARCHAR(50) NOT NULL, 
	precio MONEY NOT NULL, 
	existencia int NOT NULL,
	categoria_id int not null,
	CONSTRAINT fk_producto_categoria
	FOREIGN KEY (categoria_id)
	REFERENCES categoria (categoria_id)
);

CREATE DATABASE EJEMPLOBD;
GO

USE EJEMPLOBD;
GO 

CREATE TABLE ALUMNO (
	id_alumno INT NOT NULL PRIMARY KEY, 
	nombre VARCHAR(30) NOT NULL, 
	apellido_1 VARCHAR(15) NOT NULL, 
	apellido_2 VARCHAR(15) NULL,
	telefono VARCHAR(13), 
	calle VARCHAR(50) NOT NULL, 
	numero_interior INT, 
	numero_exterior INT, 
	fecha_naci DATE NOT NULL
); 

INSERT INTO ALUMNO 
VALUES (1, 'Kevin', 'Kosner', NULL, '+527731458723', 'INFIERNO', 666,NULL, '2007-02-18');

INSERT INTO ALUMNO (id_alumno, nombre, apellido_1, calle, fecha_naci)
VALUES (2, 'José Luis', 'Gallardo', 'Angel', '1983-04-06');

INSERT INTO ALUMNO (id_alumno, nombre, apellido_1,apellido_2, calle, fecha_naci)
VALUES (3, 'JIMENA', 'VALDEZ','DELGADILLO','FLOR DE MAYO', '2007-06-12');

SELECT *, DATEDIFF(YEAR,fecha_naci, GETDATE()) AS edad
FROM ALUMNO


-- Razon de cardinalidad 1:N

CREATE TABLE categoria2 (
  categoria_id INT NOT NULL PRIMARY KEY, 
  nombre VARCHAR(20) NOT NULL, 
);

CREATE TABLE producto2(
	producto_id INT NOT NULL PRIMARY KEY, 
	nombre VARCHAR(30) NOT NULL, 
	precio MONEY NOT NULL, 
	existencia INT NOT NULL, 
	categoria_id INT NULL, 
	CONSTRAINT fk_producto2_categoria2
	FOREIGN KEY (categoria_id)
	REFERENCES categoria2(categoria_id)
);


SELECT *
FROM categoria2;

SELECT * 
FROM producto2
WHERE categoria_id = 1;

