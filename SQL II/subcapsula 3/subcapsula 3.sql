create TABLE PERSONA (
	id integer,
  	nombre VARCHAR (45)
);

INSERT INTO PERSONA VALUES (1,'Juan');
INSERT INTO PERSONA VALUES (3,'Marcos');
insert into PERSONA VALUES (5, 'Ramón');
insert into PERSONA values (2,'María');
insert INTO PERSONA VALUES (4,'Guadalupe');
insert into PERSONA VALUES (6,'Noemi');

select * from PERSONA;

alter table PERSONA add constraint pk_id primary key(id);

select * from PERSONA;

-- Al agregar una primary key que es indice de tipo clousterizado se reordena fisicamente los registros almacenados 