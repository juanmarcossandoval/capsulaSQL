CREATE TABLE PROFESOR (
	id INTEGER NOT NULL primary KEY AUTOINCREMENT ,
  	nombre VARCHAR(255) NOT NULL,
  	apellido VARCHAR(255) NOT NULL,
  	fecha_nacimiento DATE NOT NULL,
  	salario INTEGER NOT NULL
);
INSERT INTO PROFESOR VALUES (1, 'Juan', 'Pérez', '1990-06-06',55000);
INSERT INTO PROFESOR VALUES (2, 'María Emilia', 'Paz', '1984-07-15',72000);
INSERT INTO PROFESOR VALUES (3, 'Martín', 'Correa', '1987-12-07',63000);
INSERT INTO PROFESOR VALUES (4, 'Lucía', 'Díaz', '1991-02-24',45000);
INSERT INTO PROFESOR VALUES (5, 'Raúl', 'Martínez', '1980-10-15',85000);
INSERT INTO PROFESOR VALUES (6, 'Mabel', 'Ríos', '1982-06-12',83000);

SELECT nombre, apellido, fecha_nacimiento FROM PROFESOR ORDER BY fecha_nacimiento ASC;
SELECT nombre, apellido FROM PROFESOR WHERE salario >= 65000;
SELECT nombre, apellido FROM PROFESOR WHERE fecha_nacimiento > '1979-12-31' AND fecha_nacimiento < '1990-01-01';
SELECT nombre, apellido FROM PROFESOR WHERE fecha_nacimiento BETWEEN '1979-12-31' AND '1990-01-01';
SELECT * FROM PROFESOR LIMIT 5;
select *  from PROFESOR where apellido like 'P%';
SELECT nombre, apellido FROM PROFESOR where instr(PROFESOR.apellido, 'P') >0 ;
SELECT nombre, apellido FROM PROFESOR WHERE fecha_nacimiento BETWEEN '1979-12-31' AND '1990-01-01' AND salario > 80000;