CREATE table ESTUDIANTE (
	legajo INTEGER PRIMARY key AUTOINCREMENT NOT NULL,
  	nombre VARCHAR(45) not NULL,
  	apellido VARCHAR(45) not NULL,
  	fecha_nacimiento DATE not NULL,
  	carrera VARCHAR (45) not NULL
);

CREATE TABLE PROFESOR (
	id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  	nombre VARCHAR (45) not NULL,
  	apellido VARCHAR (45) not NULL,
  	fecha_nacimiento DATE not NULL,
  	salario FLOAT not NULL
);

CREATE TABLE CURSO (
	codigo INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  	nombre VARCHAR(45) not NULL,
  	descripcion VARCHAR (45),
  	cupo INTEGER NOT NULL,
  	turno VARCHAR (45) NOT NULL,
  	profesor_id INTEGER not NULL,
  	FOREIGN KEY(profesor_id) REFERENCES PROFESOR(id)
);

CREATE TABLE INSCRIPCION (
	numero INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
   	CURSO_codigo integer not NULL,
   	ESTUDIANTE_legajo integer not NULL,
   	fecha_hora TIMESTAMP NOT NULL,
  	FOREIGN KEY(CURSO_codigo) REFERENCES CURSO(codigo),
  	FOREIGN KEY(ESTUDIANTE_legajo) REFERENCES ESTUDIANTE(legajo)
);

INSERT INTO PROFESOR VALUES (1, 'Juan', 'Pérez', '1990-06-06',55000);
INSERT INTO PROFESOR VALUES (2, 'María Emilia', 'Paz', '1984-07-15',72000);
INSERT INTO PROFESOR VALUES (3, 'Martín', 'Correa', '1987-12-07',63000);
INSERT INTO PROFESOR VALUES (4, 'Lucía', 'Díaz', '1991-02-24',45000);
INSERT INTO PROFESOR VALUES (5, 'Raúl', 'Martínez', '1980-10-15',85000);
INSERT INTO PROFESOR VALUES (6, 'Mabel', 'Ríos', '1982-06-12',83000);

INSERT INTO CURSO VALUES (101, 'Algoritmos','Algoritmos y estructuras de datos', 20, 'Mañana', 1);
INSERT INTO CURSO VALUES (102, 'Matemática Discreta',NULL, 20, 'Tarde', 2);
INSERT INTO CURSO VALUES (103, 'Programación Java','POO en Java', 35, 'Noche', 4);
INSERT INTO CURSO VALUES (104, 'Programación Web',NULL, 35, 'Noche', 5);
INSERT INTO CURSO VALUES (105, 'Programación C#','.NET, Visual Studio 2019', 30, 'Noche', 6);

INSERT INTO ESTUDIANTE VALUES (36485, 'Romina', 'Nieva','1999-11-26','Mecánica');
INSERT INTO ESTUDIANTE VALUES (39685, 'Brenda', 'Medrano','2000-09-25','Sistemas');
INSERT INTO ESTUDIANTE VALUES (41258, 'Ramiro', 'Ríos','1994-12-06','Sistemas');
INSERT INTO ESTUDIANTE VALUES (43651, 'Cristian', 'Gómez','1995-03-19','Mecánica');
INSERT INTO ESTUDIANTE VALUES (47521, 'María', 'Velazques','1998-01-02','Sistemas');
INSERT INTO ESTUDIANTE VALUES (47961, 'Alexis', 'Reinoso','1994-12-17','Sistemas');
INSERT INTO ESTUDIANTE VALUES (48952, 'Gabriel', 'Morales','1996-10-03','Sistemas');
INSERT INTO ESTUDIANTE VALUES (51200, 'Lourdes', 'Martinez','2001-12-13','Sistemas');

INSERT INTO INSCRIPCION VALUES (1,101,41258, '2012-05-02 18:45:00');
INSERT INTO INSCRIPCION VALUES (2,102,41258, '2012-04-02 18:45:00');
INSERT INTO INSCRIPCION VALUES (3,102,47961, '2012-01-02 20:01:00');
INSERT INTO INSCRIPCION VALUES (4,103,47961, '2012-04-28 18:45:00');
INSERT INTO INSCRIPCION VALUES (5,101,39685, '2012-04-12 18:45:00');
INSERT INTO INSCRIPCION VALUES (6,103,36485, '2012-04-28 18:45:00');
INSERT INTO INSCRIPCION VALUES (7,103,43651, '2012-04-28 18:45:00');
INSERT INTO INSCRIPCION VALUES (8,101,47961, '2012-04-28 18:45:00');
INSERT INTO INSCRIPCION VALUES (11,101,43651, '2012-04-21 18:45:00');
INSERT INTO INSCRIPCION VALUES (13,102,47521, '2012-04-03 18:45:00');
INSERT INTO INSCRIPCION VALUES (14,102,51200, '2012-05-02 18:45:00');

  SELECT e.nombre, e.apellido, i.CURSO_codigo as 'Curso'
	from  INSCRIPCION i
    inner JOIN ESTUDIANTE e 
    		   on i.ESTUDIANTE_legajo = e.legajo
order by i.CURSO_codigo;

  SELECT e.nombre, e.apellido, c.nombre as 'Curso'
	from  INSCRIPCION i
    inner JOIN ESTUDIANTE e 
    		   on i.ESTUDIANTE_legajo = e.legajo 
    inner JOIN CURSO c 
    		   ON c.codigo = i.CURSO_codigo
order by c.nombre;

  select c.nombre as 'Curso', p.nombre, p.apellido
  	FROM CURSO c 
    INNER JOIN PROFESOR p
    		   ON c.profesor_id = p.id;
               
  select c.nombre as 'Curso', p.nombre, p.apellido
  	FROM CURSO c 
    INNER JOIN PROFESOR p
    		   ON c.profesor_id = p.id
order by c.nombre;

  SELECT c.nombre as 'Curso', c.cupo as 'Cupo', c.cupo - COUNT (i.ESTUDIANTE_legajo) as 'Cupo disponible'
 	from CURSO c 
    LEFT JOIN INSCRIPCION i
    		  on c.codigo = i.CURSO_codigo
group by c.codigo;

  SELECT c.nombre as 'Curso', c.cupo as 'Cupo', c.cupo - COUNT (i.ESTUDIANTE_legajo) as Disponible
 	from CURSO c 
    LEFT JOIN INSCRIPCION i
    		  on c.codigo = i.CURSO_codigo
group by c.codigo HAVING Disponible < 10;

