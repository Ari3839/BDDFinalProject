-- @Autor   Ariadna Lazaro & Alejandro Hernández
-- @Fecha   06/dic/2023
-- @Descripcion: Creacion de los fragmentos en los 4 nodos

clear screen
whenever sqlerror exit rollback;

prompt =====================================
prompt Creando fragmentos para aalmbbdd_s1
prompt =====================================
connect ilap_bdd/ilap_bdd@aalmbdd_s1
@s-03-ilap-aalm-s1-ddl.sql


prompt =====================================
prompt Creando fragmentos para aalmbbdd_s2
prompt =====================================
connect ilap_bdd/ilap_bdd@aalmbdd_s2
@s-03-ilap-aalm-s2-ddl.sql


prompt =====================================
prompt Creando fragmentos para amhbdd_s1
prompt =====================================
connect ilap_bdd/ilap_bdd@amhbdd_s1
@s-03-ilap-amh-s1-ddl.sql


prompt =====================================
prompt Creando fragmentos para amhbdd_s2
prompt =====================================
connect ilap_bdd/ilap_bdd@amhbdd_s2
@s-03-ilap-amh-s2-ddl.sql
Prompt Listo!