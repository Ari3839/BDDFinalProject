-- @Autor   Ariadna Lazaro & Alejandro Hernández
-- @Fecha   06/dic/2023
-- @Descripcion: Creacion del usuario en los 4 nodos


clear screen
whenever sqlerror exit rollback
set serveroutput on

Prompt Iniciando creacion de usuarios
accept syspass char prompt 'Proporciona el password de sys:' hide


Prompt ==============================================
prompt Creando usuario en aalmbdd_s1
Prompt ==============================================

connect sys/&&syspass@aalmbdd_s1 as sysdba
@s-01-ilap-usuario.sql



Prompt ==============================================
prompt Creando usuario en aalmbdd_s2
Prompt ==============================================

connect sys/&&syspass@aalmbdd_s2 as sysdba
@s-01-ilap-usuario.sql


Prompt ==============================================
prompt Creando usuario en amhbdd_s1
Prompt ==============================================

connect sys/system@amhbdd_s1 as sysdba
@s-01-ilap-usuario.sql


Prompt ==============================================
prompt Creando usuario en amhbdd_s2
Prompt ==============================================

connect sys/&&syspass@amhbdd_s2 as sysdba
@s-01-ilap-usuario.sql

Prompt Listo
disconnect