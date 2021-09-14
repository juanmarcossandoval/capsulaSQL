CREATE TABLE CURSO(
	codigo_curso INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,
  	nombre VARCHAR(100) NOT NULL,
  	descripcion VARCHAR,
  	turno VARCHAR(10)
);
ALTER TABLE CURSO ADD cupo INTEGER;
INSERT INTO CURSO VALUES (101, 'Algoritmos','Algoritmos y Estructuras de Datos','Mañana',35);
INSERT INTO CURSO VALUES (102, 'Matemática Discreta',NULL,'Tarde',30);
INSERT INTO CURSO VALUES (103, NULL,'Matemática Discreta','Tarde',30);
INSERT INTO CURSO VALUES (101, 'Matemática 3','Estadistica','Tarde',30);
UPDATE CURSO SET cupo = 25;
DELETE FROM CURSO WHERE nombre = 'Algoritmos';
SELECT * FROM CURSO;