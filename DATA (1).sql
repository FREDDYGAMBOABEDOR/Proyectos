prompt PL/SQL Developer Export Tables for user SYSTEM@ORCL
prompt Created by Usuario on viernes, 17 de junio de 2022
set feedback off
set define off

prompt Creating CARGOS...
create table CARGOS
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
alter table CARGOS
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

prompt Creating DEPARTAMENTOS...
create table DEPARTAMENTOS
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
alter table DEPARTAMENTOS
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

prompt Creating TIPOS_IDENTIFICACION...
create table TIPOS_IDENTIFICACION
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
alter table TIPOS_IDENTIFICACION
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

prompt Creating EMPLEADOS...
create table EMPLEADOS
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
alter table EMPLEADOS
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
alter table EMPLEADOS
  add constraint FK_ID_CARGOS foreign key (ID_CARGOS)
  references CARGOS (ID_CARGOS);
alter table EMPLEADOS
  add constraint FK_ID_DEPARTAMENTOS foreign key (ID_DEPARTAMENTOS)
  references DEPARTAMENTOS (ID_DEPARTAMENTOS);
alter table EMPLEADOS
  add constraint FK_ID_TIPOS_IDENTIFICACION foreign key (ID_TIPOS_IDENTIFICACION)
  references TIPOS_IDENTIFICACION (ID_TIPOS_IDENTIFICACION);

prompt Disabling triggers for CARGOS...
alter table CARGOS disable all triggers;
prompt Disabling triggers for DEPARTAMENTOS...
alter table DEPARTAMENTOS disable all triggers;
prompt Disabling triggers for TIPOS_IDENTIFICACION...
alter table TIPOS_IDENTIFICACION disable all triggers;
prompt Disabling triggers for EMPLEADOS...
alter table EMPLEADOS disable all triggers;
prompt Disabling foreign key constraints for EMPLEADOS...
alter table EMPLEADOS disable constraint FK_ID_CARGOS;
alter table EMPLEADOS disable constraint FK_ID_DEPARTAMENTOS;
alter table EMPLEADOS disable constraint FK_ID_TIPOS_IDENTIFICACION;
prompt Deleting EMPLEADOS...
delete from EMPLEADOS;
commit;
prompt Deleting TIPOS_IDENTIFICACION...
delete from TIPOS_IDENTIFICACION;
commit;
prompt Deleting DEPARTAMENTOS...
delete from DEPARTAMENTOS;
commit;
prompt Deleting CARGOS...
delete from CARGOS;
commit;
prompt Loading CARGOS...
insert into CARGOS (id_cargos, descripcion, sueldo, estados)
values (1, 'INGENIERO', 1200, 'A');
insert into CARGOS (id_cargos, descripcion, sueldo, estados)
values (2, 'ARQUITECTO', 400, 'A');
insert into CARGOS (id_cargos, descripcion, sueldo, estados)
values (3, 'COCINERO', 100, 'A');
commit;
prompt 3 records loaded
prompt Loading DEPARTAMENTOS...
insert into DEPARTAMENTOS (id_departamentos, nombres, capacidad)
values (1, 'SISTEMAS', 7);
insert into DEPARTAMENTOS (id_departamentos, nombres, capacidad)
values (2, 'RECURSOS HUMANOS', 2);
insert into DEPARTAMENTOS (id_departamentos, nombres, capacidad)
values (3, 'RECURSOS HUMANOS', 5);
commit;
prompt 3 records loaded
prompt Loading TIPOS_IDENTIFICACION...
insert into TIPOS_IDENTIFICACION (id_tipos_identificacion, descripcion, estados)
values (1, 'RUC', 'A');
insert into TIPOS_IDENTIFICACION (id_tipos_identificacion, descripcion, estados)
values (2, 'CEDULA', 'I');
commit;
prompt 2 records loaded
prompt Loading EMPLEADOS...
insert into EMPLEADOS (id_empleados, nombres, apellidos, numero_identificacion, id_tipos_identificacion, id_cargos, id_departamentos)
values (1, 'JONATHAN ANTONIO', 'ZORRILLA GAMBOA', 960112834, 1, 1, null);
insert into EMPLEADOS (id_empleados, nombres, apellidos, numero_identificacion, id_tipos_identificacion, id_cargos, id_departamentos)
values (2, 'FREDDY IVAN', 'BORBOR TORRES', 965678943, 2, 2, null);
insert into EMPLEADOS (id_empleados, nombres, apellidos, numero_identificacion, id_tipos_identificacion, id_cargos, id_departamentos)
values (5, 'FIDEL', 'ZORRILLA', 930456742, null, null, null);
insert into EMPLEADOS (id_empleados, nombres, apellidos, numero_identificacion, id_tipos_identificacion, id_cargos, id_departamentos)
values (6, 'FIDEL', 'ZORRILLA', 2, 2, 2, 2);
insert into EMPLEADOS (id_empleados, nombres, apellidos, numero_identificacion, id_tipos_identificacion, id_cargos, id_departamentos)
values (7, 'IVAN', 'ELANO', 2, 2, 2, 2);
insert into EMPLEADOS (id_empleados, nombres, apellidos, numero_identificacion, id_tipos_identificacion, id_cargos, id_departamentos)
values (8, 'IVAN', 'ELANO', 2, 2, 2, 2);
insert into EMPLEADOS (id_empleados, nombres, apellidos, numero_identificacion, id_tipos_identificacion, id_cargos, id_departamentos)
values (9, 'IVAN', 'ELANO', 2, 2, 2, 2);
insert into EMPLEADOS (id_empleados, nombres, apellidos, numero_identificacion, id_tipos_identificacion, id_cargos, id_departamentos)
values (10, 'IVAN', 'ELANO', 2, 2, 2, 2);
insert into EMPLEADOS (id_empleados, nombres, apellidos, numero_identificacion, id_tipos_identificacion, id_cargos, id_departamentos)
values (11, 'IVAN', 'ELANO', 2, 2, 2, 2);
insert into EMPLEADOS (id_empleados, nombres, apellidos, numero_identificacion, id_tipos_identificacion, id_cargos, id_departamentos)
values (12, 'IVAN', 'ELANO', 2, 1, 2, 2);
insert into EMPLEADOS (id_empleados, nombres, apellidos, numero_identificacion, id_tipos_identificacion, id_cargos, id_departamentos)
values (13, 'IVANA', 'TOMALA', 2, 2, 3, 2);
commit;
prompt 11 records loaded
prompt Enabling foreign key constraints for EMPLEADOS...
alter table EMPLEADOS enable constraint FK_ID_CARGOS;
alter table EMPLEADOS enable constraint FK_ID_DEPARTAMENTOS;
alter table EMPLEADOS enable constraint FK_ID_TIPOS_IDENTIFICACION;
prompt Enabling triggers for CARGOS...
alter table CARGOS enable all triggers;
prompt Enabling triggers for DEPARTAMENTOS...
alter table DEPARTAMENTOS enable all triggers;
prompt Enabling triggers for TIPOS_IDENTIFICACION...
alter table TIPOS_IDENTIFICACION enable all triggers;
prompt Enabling triggers for EMPLEADOS...
alter table EMPLEADOS enable all triggers;

set feedback on
set define on
prompt Done
