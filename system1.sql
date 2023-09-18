create table Nombres_pais(
  ID_Cod_Pais varchar2(10),
  Nombres_pais varchar2(10),
  Regiones varchar2 (10),
  Constraint PK_ID_Cod_Pais
  primary key(ID_Cod_Pais)
);

Insert INTO nombres_pais(ID_Cod_Pais,Nombres_Pais,Regiones)
VALUES ('593','Ecuador','Ame-Sur');
Insert INTO nombres_pais(ID_Cod_Pais,Nombres_Pais,Regiones)
VALUES ('125','Argentina','Ame-Sur');
Insert INTO nombres_pais(ID_Cod_Pais,Nombres_Pais,Regiones)
VALUES ('789','E.E.U.U','Ame-Norte');



create table Provincias_pais(
  ID_Cod_Provincias number(10),
  Nombres_Provincias varchar2 (10),
  FK_ID_Cod_Pais varchar2(10),
  Constraint PK_ID_Cod_Provincias
  primary key(ID_Cod_Provincias),
  FOREIGN key (FK_ID_Cod_Pais)
  references Nombres_pais (ID_Cod_Pais)
); 
Insert INTO Provincias_pais(ID_Cod_Provincias,Nombres_Provincias,FK_ID_Cod_Pais)
VALUES ('04','Guayas','593');

Insert INTO Provincias_pais(ID_Cod_Provincias,Nombres_Provincias,FK_ID_Cod_Pais)
VALUES ('056','Salta','125');
Insert INTO Provincias_pais(ID_Cod_Provincias,Nombres_Provincias,FK_ID_Cod_Pais)
VALUES ('78','Phoenix','789');

create table Cuidades_pais(
  ID_Cod_Cuidades number(10),
  Nombres_Ciudades varchar2 (10),
  FK_ID_Cod_Pais varchar2(10),
  FK_ID_Cod_Provincias number(10),
Constraint PK_ID_Cod_Cuidades
primary key(ID_Cod_Cuidades),
FOREIGN key (FK_ID_Cod_Pais)
references Nombres_pais(ID_Cod_Pais),
FOREIGN key(FK_ID_Cod_Provincias)
references Provincias_pais(ID_Cod_Provincias)
);


Insert INTO Cuidades_pais(ID_Cod_Cuidades,Nombres_Ciudades,FK_ID_Cod_Pais,FK_ID_Cod_Provincias)
VALUES ('1234','Guayaquil','593','04');
Insert INTO Cuidades_pais(ID_Cod_Cuidades,Nombres_Ciudades,FK_ID_Cod_Pais,FK_ID_Cod_Provincias)
VALUES ('4567','Rosario','125','056');
Insert INTO Cuidades_pais(ID_Cod_Cuidades,Nombres_Ciudades,FK_ID_Cod_Pais,FK_ID_Cod_Provincias)
VALUES ('78910','Chicago','789','78');



Delete from Cuidades_pais;--Provincias_pais;
drop table Provincias_pais;
SELECT * FROM Cuidades_pais;