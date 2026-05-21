CREATE DATABASE pruebabd;

CREATE TABLE tbl1 (
 id INT, 
 nombre varchar(30)
);

INSERT INTO tbl1
VALUES (1, 'Pepito'),
       (2, 'Luis'), 
       (3, 'Luar');
       
SELECT * 
FROM tbl1;