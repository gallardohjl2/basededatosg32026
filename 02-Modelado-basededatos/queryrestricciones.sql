CREATE DATABASE bdconstraints;
GO

USE bdconstraints;
GO

-- Razón de Cardinalidad de 1:1

CREATE TABLE paciente (
	Numpaciente INT NOT NULL, 
	Nombre VARCHAR(30) NOT NULL,
	Apellido1 VARCHAR(20) NOT NULL, 
	Apellido2 VARCHAR(20) NULL,
	Fechanaci DATE NOT NULL, 
	CONSTRAINT pk_paciente
	PRIMARY KEY (Numpaciente)
);
GO

CREATE TABLE expediente (
	NumExp INT NOT NULL, 
	Fechaapertura DATE NOT NULL,
	Tipodesangre CHAR(3) NOT NULL,
	paciente INT NOT NULL,
	CONSTRAINT pk_expediente
	PRIMARY KEY (NumExp),
	CONSTRAINT unique_numpaciente
	UNIQUE(paciente),
	CONSTRAINT fk_expediente_paciente
	FOREIGN KEY (paciente)
	REFERENCES paciente (Numpaciente)

);
GO

INSERT INTO paciente 
VALUES(1, 'Kevin', 'Kosner', 'López', '2007-02-18');

INSERT INTO paciente 
VALUES(2, 'Daniel', 'Martinez', 'Mendoza', '2005-01-30');

INSERT INTO paciente 
VALUES(3, 'Luis Fernando', 'Nieto', NULL, '2007-07-04');

SELECT *
FROM paciente;

INSERT INTO expediente
VALUES (1, GETDATE(), '+O', 1);

INSERT INTO expediente
VALUES (2, GETDATE(), '+A', 2);

INSERT INTO expediente
VALUES (3, GETDATE(), '+B', 3);
GO

SELECT 
	e.NumExp, 
	e.Fechaapertura, 
	e.Tipodesangre,
	CONCAT(p.Nombre, ' ', p.Apellido1, ' ', 
	p.Apellido2 ) 
	AS [Nombre Completo]
FROM expediente AS e
INNER JOIN paciente AS p
ON e.paciente = p.Numpaciente;

GO

-- Razon de Cardinalidad de 1:N
CREATE TABLE profesor (
  Numprof INT not null IDENTITY(1,1) PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL, 
  Apellido1 VARCHAR(30) NOT NULL, 
  Apellido2 VARCHAR(30)
);
GO

CREATE TABLE curso(
   Numcurso INT NOT NULL, 
   Nombre VARCHAR(20) NOT NULL, 
   Creditos INT NOT NULL, 
   Numprof INT NOT NULL,
   CONSTRAINT pk_curso
   PRIMARY KEY (Numcurso), 
   CONSTRAINT unique_nombre
   UNIQUE(Nombre),
   CONSTRAINT check_creditos
   CHECK (Creditos > 0),
   CONSTRAINT fk_curso_profesor
   FOREIGN KEY (Numprof)
   REFERENCES profesor (Numprof)
);
GO

CREATE TABLE especialidad
(
	Numesp INT NOT NULL,
	Numprof INT NOT NULL,
	NombreEsp VARCHAR(30) NOT NULL,
	CONSTRAINT pk_especialidad
	PRIMARY KEY (Numesp,Numprof), 
	CONSTRAINT unique_nombreesp
	UNIQUE (NombreEsp), 
	CONSTRAINT fk_especialidad_profesor
	FOREIGN KEY (Numprof)
	REFERENCES profesor(Numprof)
);
GO


INSERT INTO profesor  
VALUES ('José Luis', 'Herrera', 
        'Gallardo'),
	   ('Luis', 'Nieto', 'Sanchez' );

INSERT INTO profesor  
VALUES ('José Angel', 'Pérez', 
        'Hernández')
GO

INSERT INTO curso 
VALUES (1,'Base de Datos', 50, 1);

INSERT INTO curso 
VALUES (2,'Programación', 50, 1);

INSERT INTO curso 
VALUES (3,'Topicos', 30, 2);


SELECT * FROM curso

INSERT INTO especialidad
VALUES (1,1,'aws' ), 
       (2,1, 'SQL SERVER'), 
	   (3,2, 'Redes'), 
	   (4,2, 'Scrum'), 
	   (5,2, 'Linux');

SELECT * FROM especialidad
ORDER BY NombreEsp DESC;

SELECT 
	p.nombre, 
	p.Apellido1, 
	p.Apellido2, 
	c.Nombre, 
	c.Creditos, 
	e.NombreEsp
FROM profesor AS p
INNER JOIN curso AS c
ON p.Numprof = c.Numprof
INNER JOIN especialidad AS e
ON p.Numprof = e.Numprof
ORDER BY 1;

-- Cardinalidad de M:N

CREATE TABLE alumno(
	Idalumno INT NOT NULL PRIMARY KEY, 
	Matricula VARCHAR (10) NOT NULL, 
	Nombre NVARCHAR (30) NOT NULL,
	Apellido1 NVARCHAR (20) NOT NULL,
	Apellido2 NVARCHAR (20) NULL,
	Semestre INT NOT NULL, 
	CONSTRAINT unique_matricula
	UNIQUE(Matricula), 
	CONSTRAINT check_semestre
	CHECK (Semestre>0 AND Semestre <=10)
);
GO

CREATE TABLE materia (
	Idmateria INT NOT NULL, 
	NombreMat NVARCHAR(20) NOT NULL,
	Creditos INT NOT NULL, 
	CONSTRAINT pk_materia
	PRIMARY KEY (Idmateria),
	CONSTRAINT unique_nombremat
	UNIQUE(NombreMat),
	CONSTRAINT chk_creditos
	CHECK (Creditos BETWEEN 1 AND 60)
);
GO

CREATE TABLE inscribe (
	Idmateria INT NOT NULL, 
	Idalumno INT NOT NULL, 
	Fechainscripcion DATE NOT NULL, 
	Calificacion DECIMAL (10,2) NOT NULL, 
	CONSTRAINT pk_inscribe
	PRIMARY KEY (Idmateria, Idalumno), 
	CONSTRAINT fk_inscribe_materia 
	FOREIGN KEY (Idmateria)
	REFERENCES materia(Idmateria), 
	CONSTRAINT fk_inscribe_alumno
	FOREIGN KEY (Idalumno)
	REFERENCES alumno(Idalumno)
);
GO


