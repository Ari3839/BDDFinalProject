-- @Autor   Ariadna Lazaro & Alejandro Hernández
-- @Fecha   06/dic/2023
-- @Descripcion: Creacion del usuario en los 4 nodos


clear screen
whenever sqlerror exit rollback
set serveroutput on


Prompt ==============================================
prompt Creando ligas en aalmbdd_s1
Prompt ==============================================

connect ilap_bdd/ilap_bdd@aalmbdd_s1
--PDB local
create database link aalmbdd_s2.fi.unam using 'AALMBDD_S2';
--PDB remotas
create database link amhbdd_s1.fi.unam using 'AMHBDD_S1';
create database link amhbdd_s2.fi.unam using 'AMHBDD_S2';


Prompt ==============================================
prompt Creando ligas en aalmbdd_s2
Prompt ==============================================

connect ilap_bdd/ilap_bdd@aalmbdd_s2
--PDB local
create database link aalmbdd_s1.fi.unam using 'AALMBDD_S1';
--PDB remotas
create database link amhbdd_s1.fi.unam using 'AMHBDD_S1';
create database link amhbdd_s2.fi.unam using 'AMHBDD_S2';


Prompt ==============================================
prompt Creando ligas en amhbdd_s1
Prompt ==============================================

connect ilap_bdd/ilap_bdd@amhbdd_s1
--PDB local
create database link amhbdd_s2.fi.unam using 'AMHBDD_S2';
--PDB remotas
create database link aalmbdd_s1.fi.unam using 'AALMBDD_S1';
create database link aalmbdd_s2.fi.unam using 'AALMBDD_S2';


Prompt ==============================================
prompt Creando ligas en amhbdd_s2
Prompt ==============================================

connect ilap_bdd/ilap_bdd@amhbdd_s2
--PDB local
create database link amhbdd_s1.fi.unam using 'AMHBDD_S1';
--PDB remotas
create database link aalmbdd_s1.fi.unam using 'AALMBDD_S1';
create database link aalmbdd_s2.fi.unam using 'AALMBDD_S2';

Prompt Listo c:
disconnect
