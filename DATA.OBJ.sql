prompt PL/SQL Developer Export User Objects for user SYSTEM@ORCL
prompt Created by Usuario on viernes, 17 de junio de 2022
set define off
spool DATA.OBJ.log

prompt
prompt Creating table CARGOS
prompt =====================
prompt
create table SYSTEM.CARGOS
(
  id_cargos   NUMBER not null,
  descripcion NVARCHAR2(50),
  sueldo      NUMBER,
  estados     NVARCHAR2(1)
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table SYSTEM.CARGOS
  add constraint PK_ID_CARGOS primary key (ID_CARGOS)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table DEPARTAMENTOS
prompt ============================
prompt
create table SYSTEM.DEPARTAMENTOS
(
  id_departamentos NUMBER not null,
  nombres          NVARCHAR2(50),
  capacidad        NUMBER
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table SYSTEM.DEPARTAMENTOS
  add constraint PK_ID_DEPARTAMENTOS primary key (ID_DEPARTAMENTOS)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table TIPOS_IDENTIFICACION
prompt ===================================
prompt
create table SYSTEM.TIPOS_IDENTIFICACION
(
  id_tipos_identificacion NUMBER not null,
  descripcion             NVARCHAR2(50),
  estados                 NVARCHAR2(1)
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table SYSTEM.TIPOS_IDENTIFICACION
  add constraint PK_ID_IDENTIFICACION primary key (ID_TIPOS_IDENTIFICACION)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table EMPLEADOS
prompt ========================
prompt
create table SYSTEM.EMPLEADOS
(
  id_empleados            NUMBER not null,
  nombres                 NVARCHAR2(50),
  apellidos               NVARCHAR2(50),
  numero_identificacion   NUMBER,
  id_tipos_identificacion NUMBER,
  id_cargos               NUMBER,
  id_departamentos        NUMBER
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table SYSTEM.EMPLEADOS
  add constraint PK_ID_EMPLEADOS primary key (ID_EMPLEADOS)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table SYSTEM.EMPLEADOS
  add constraint FK_ID_CARGOS foreign key (ID_CARGOS)
  references SYSTEM.CARGOS (ID_CARGOS);
alter table SYSTEM.EMPLEADOS
  add constraint FK_ID_DEPARTAMENTOS foreign key (ID_DEPARTAMENTOS)
  references SYSTEM.DEPARTAMENTOS (ID_DEPARTAMENTOS);
alter table SYSTEM.EMPLEADOS
  add constraint FK_ID_TIPOS_IDENTIFICACION foreign key (ID_TIPOS_IDENTIFICACION)
  references SYSTEM.TIPOS_IDENTIFICACION (ID_TIPOS_IDENTIFICACION);

prompt
prompt Creating procedure PRC_ACTUALIZAR
prompt =================================
prompt
create or replace procedure system.PRC_ACTUALIZAR(PV_DESCRIPCION IN VARCHAR2, PN_ID_CARGOS IN NUMBER) is
begin
  
UPDATE CARGOS

SET DESCRIPCION = PV_DESCRIPCION
WHERE ID_CARGOS=PN_ID_CARGOS;
COMMIT;
  
end PRC_ACTUALIZAR;
/

prompt
prompt Creating procedure PRC_CONSULTAS
prompt ================================
prompt
create or replace procedure system.PRC_CONSULTAS( PL_DATOS OUT  SYS_REFCURSOR ) is
begin
   OPEN PL_DATOS FOR select D.* from CARGOS D;
  
end PRC_CONSULTAS;
/

prompt
prompt Creating procedure PRC_DELETE
prompt =============================
prompt
create or replace procedure system.PRC_DELETE(PN_ID_DEPARTAMENTOS IN NUMBER) is


begin
  
DELETE FROM DEPARTAMENTOS WHERE ID_DEPARTAMENTOS=  PN_ID_DEPARTAMENTOS;
COMMIT;
 
  
end PRC_DELETE;
/

prompt
prompt Creating procedure PRC_INSERTAR_CARGOS
prompt ======================================
prompt
create or replace procedure system.PRC_INSERTAR_CARGOS(PV_DESCRIPCION IN VARCHAR2,PN_SUELDO IN NUMBER ) is

 

 CURSOR C_CARGOS IS
 select nvl(MAX(d.id_cargos)+1,1) from CARGOS D ; 
  
  LN_ID_NUEVO NUMBER;

begin
  
  OPEN C_CARGOS;
  FETCH C_CARGOS INTO LN_ID_NUEVO;
  --DBMS_OUTPUT.PUT_LINE(continente);
  CLOSE C_CARGOS;


insert into CARGOS (ID_CARGOS, DESCRIPCION, SUELDO, ESTADOS)
values (LN_ID_NUEVO, PV_DESCRIPCION,PN_SUELDO, 'A'); 
COMMIT;

end PRC_INSERTAR_CARGOS;
/

prompt
prompt Creating procedure PRC_INSERTAR_DEPARTAMENTOS
prompt =============================================
prompt
create or replace procedure system.PRC_INSERTAR_DEPARTAMENTOS(PV_NOMBRE IN VARCHAR2, PN_CAPACIDAD IN NUMBER ) is

CURSOR C_DEPARTAMENTOS IS
SELECT NVL (MAX (ID_DEPARTAMENTOS)+1,1)FROM DEPARTAMENTOS;
 
       LN_ID_DEPARTAMENTO_NUEVO NUMBER;  --LN LOCAL , TIPO DE DATO
begin
  OPEN C_DEPARTAMENTOS;
  FETCH C_DEPARTAMENTOS 
  INTO LN_ID_DEPARTAMENTO_NUEVO ;
  --DBMS_OUTPUT.PUT_LINE(continente);
  CLOSE C_DEPARTAMENTOS;
  
  insert into DEPARTAMENTOS (ID_DEPARTAMENTOS, NOMBRES, CAPACIDAD)
values (LN_ID_DEPARTAMENTO_NUEVO, PV_NOMBRE ,PN_CAPACIDAD );
  
  COMMIT;
  
end PRC_INSERTAR_DEPARTAMENTOS;
/

prompt
prompt Creating procedure PRC_INSERTAR_EMPLEADO
prompt ========================================
prompt
create or replace procedure system.PRC_INSERTAR_EMPLEADO(PV_DESCRIPCION IN VARCHAR2,PN_SUELDO IN NUMBER ) is

 

 CURSOR C_CARGOS IS
 select nvl(MAX(d.id_cargos)+1,1) from CARGOS D ; 
  
  LN_ID_NUEVO NUMBER;

begin
  
  OPEN C_CARGOS;
  FETCH C_CARGOS INTO LN_ID_NUEVO;
  --DBMS_OUTPUT.PUT_LINE(continente);
  CLOSE C_CARGOS;


  insert into CARGOS (ID_CARGOS, DESCRIPCION, SUELDO, ESTADOS)
values (LN_ID_NUEVO, PV_DESCRIPCION,PN_SUELDO, 'A'); 
COMMIT;

end PRC_INSERTAR_EMPLEADO;
/

prompt
prompt Creating procedure PRC_INSERTAR_EMPLEADOS
prompt =========================================
prompt
create or replace procedure system.PRC_INSERTAR_EMPLEADOS (PV_NOMBRES IN VARCHAR2,
                     PV_APELLIDOS IN VARCHAR2, PN_NUMERO_IDENTIFICACION IN NUMBER, 
                     PN_ID_TIPO_IDENTIFICACION IN NUMBER, PN_CARGOS IN NUMBER,
                      PN_ID_DEPARTAMENTOS IN NUMBER, PV_SALIDA OUT VARCHAR) is

CURSOR C_EMPLEADOS IS
SELECT NVL (MAX(ID_EMPLEADOS)+1,1)FROM EMPLEADOS;


CURSOR C_VALIDAR_TIPOS_ID IS
SELECT COUNT(*) FROM TIPOS_IDENTIFICACION WHERE ID_TIPOS_IDENTIFICACION =PN_ID_TIPO_IDENTIFICACION;

CURSOR C_VALIDAR_CARGOS IS
SELECT COUNT(*) FROM CARGOS WHERE ID_CARGOS =PN_CARGOS;

CURSOR C_VALIDAR_DEPARTAMENTOS IS
SELECT COUNT(*) FROM DEPARTAMENTOS WHERE ID_DEPARTAMENTOS = PN_ID_DEPARTAMENTOS;



LN_EMPLEADOS_NUEVOS NUMBER;
LN_VALIDAR_TIPOS_ID NUMBER;
LN_VALIDAR_CARGOS NUMBER;
LN_VALIDAR_DEPARTAMENTOS NUMBER;


BEGIN
  
  OPEN C_EMPLEADOS;
  FETCH C_EMPLEADOS 
  INTO LN_EMPLEADOS_NUEVOS;
  --DBMS_OUTPUT.PUT_LINE(continente);
  CLOSE C_EMPLEADOS;
  
  OPEN C_VALIDAR_TIPOS_ID;
  FETCH C_VALIDAR_TIPOS_ID
  INTO LN_VALIDAR_TIPOS_ID;
  --DBMS_OUTPUT.PUT_LINE(continente);
  CLOSE C_VALIDAR_TIPOS_ID;
  
  
  OPEN C_VALIDAR_CARGOS;
  FETCH C_VALIDAR_CARGOS
  INTO LN_VALIDAR_CARGOS;
  --DBMS_OUTPUT.PUT_LINE(continente);
  CLOSE C_VALIDAR_CARGOS;
  
  OPEN C_VALIDAR_DEPARTAMENTOS;
  FETCH C_VALIDAR_DEPARTAMENTOS
  INTO LN_VALIDAR_DEPARTAMENTOS;
  --DBMS_OUTPUT.PUT_LINE(continente);
  CLOSE C_VALIDAR_DEPARTAMENTOS;
  
  IF LN_VALIDAR_TIPOS_ID = 0 THEN
  PV_SALIDA:= 'NO SE ENCUENTRA DISPONIBLE';
  RETURN ; 
  END IF ;
  
  IF LN_VALIDAR_CARGOS = 0 THEN
   PV_SALIDA:= 'NO CARGOS';
   
   
  RETURN ; 
  END IF ;
     
   IF LN_VALIDAR_DEPARTAMENTOS = 0 THEN
   PV_SALIDA:= 'NO DEPARTAMENTOS';
   
   
  RETURN ; 
  END IF ;

insert into EMPLEADOS (ID_EMPLEADOS, NOMBRES, APELLIDOS, NUMERO_IDENTIFICACION, ID_TIPOS_IDENTIFICACION, ID_CARGOS, ID_DEPARTAMENTOS)
values (LN_EMPLEADOS_NUEVOS,PV_NOMBRES ,PV_APELLIDOS,PN_NUMERO_IDENTIFICACION,PN_ID_TIPO_IDENTIFICACION,PN_CARGOS,PN_ID_DEPARTAMENTOS);
  
 COMMIT;
end PRC_INSERTAR_EMPLEADOS ;
/

prompt
prompt Creating procedure PRC_LISTAR
prompt =============================
prompt
create or replace procedure system.PRC_LISTAR(PC_DEPARTAMENTOS OUT SYS_REFCURSOR) is--OUT PARAMENTRO DE SALIDA
begin
  OPEN PC_DEPARTAMENTOS FOR SELECT * FROM DEPARTAMENTOS;
end PRC_LISTAR;
/

prompt
prompt Creating procedure PRC_UPTEDE
prompt =============================
prompt
create or replace procedure system.PRC_UPTEDE(PV_NOMBRES IN VARCHAR,PN_ID_DEPARTAMENTOS IN NUMBER  ) is--UPDATE CON EL ID



begin
  UPDATE DEPARTAMENTOS
  SET NOMBRES = PV_NOMBRES
  WHERE ID_DEPARTAMENTOS = PN_ID_DEPARTAMENTOS;
  COMMIT;
end PRC_UPTEDE;
/


prompt Done
spool off
set define on
