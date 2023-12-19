-- @Autor   Ariadna Lazaro & Alejandro Hernández
-- @Fecha   07/dic/2023
-- @Descripcion: Manejo de datos blob en select MAIN

clear screen
whenever sqlerror exit rollback;

prompt ===========================================
prompt Creando vistas para aalmbdd_s1
prompt ===========================================
connect ilap_bdd/ilap_bdd@aalmbdd_s1
prompt creando vistas que no requieren manejo de BLOBs
@s-05-ilap-vistas.sql
prompt creando tablas temporales
@s-05-ilap-tablas-temporales.sql
prompt creando objetos para manejo de BLOBs
@s-05-ilap-funciones-blob.sql
prompt creando vistas con soporte para BLOBs
@s-05-ilap-aalm-s1-vistas-blob.sql

prompt ===========================================
prompt Creando vistas para aalmbdd_s2
prompt ===========================================
connect ilap_bdd/ilap_bdd@aalmbdd_s2
prompt creando vistas que no requieren manejo de BLOBs
@s-05-ilap-vistas.sql
prompt creando tablas temporales
@s-05-ilap-tablas-temporales.sql
prompt creando objetos para manejo de BLOBs
@s-05-ilap-funciones-blob.sql
prompt creando vistas con soporte para BLOBs
@s-05-ilap-aalm-s2-vistas-blob.sql



prompt ===========================================
prompt Creando vistas para amhbdd_s1
prompt ===========================================
connect ilap_bdd/ilap_bdd@amhbdd_s1
prompt creando vistas que no requieren manejo de BLOBs
@s-05-ilap-vistas.sql
prompt creando tablas temporales
@s-05-ilap-tablas-temporales.sql
prompt creando objetos para manejo de BLOBs
@s-05-ilap-funciones-blob.sql
prompt creando vistas con soporte para BLOBs
@s-05-ilap-amh-s1-vistas-blob.sql

prompt ===========================================
prompt Creando vistas para amhbdd_s2
prompt ===========================================
connect ilap_bdd/ilap_bdd@amhbdd_s2
prompt creando vistas que no requieren manejo de BLOBs
@s-05-ilap-vistas.sql
prompt creando tablas temporales
@s-05-ilap-tablas-temporales.sql
prompt creando objetos para manejo de BLOBs
@s-05-ilap-funciones-blob.sql
prompt creando vistas con soporte para BLOBs
@s-05-ilap-amh-s2-vistas-blob.sql
