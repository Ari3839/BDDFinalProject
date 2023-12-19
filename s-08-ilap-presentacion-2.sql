-- @Autor   Ariadna Lazaro & Alejandro Hernández
-- @Fecha   11/dic/2023
-- @Descripcion: Presentacion final pte. 2

clear screen
whenever sqlerror exit rollback;

--Para visualizar export NLS_LANG=SPANISH_SPAIN.WE8ISO8859P1

Prompt ======================================
Prompt Cargando catalogos de forma manual en amhbdd_s1
Prompt ======================================
connect ilap_bdd/ilap_bdd@amhbdd_s1
delete from status_laptop;
@carga-inicial/status_laptop.sql
commit;

Prompt ======================================
Prompt Cargando catalogos de forma manual en amhbdd_s2
Prompt ======================================
connect ilap_bdd/ilap_bdd@amhbdd_s2
delete from status_laptop;
@carga-inicial/status_laptop.sql
commit;

Prompt ======================================
Prompt Cargando catalogos de forma manual en aalmbdd_s1
Prompt ======================================
connect ilap_bdd/ilap_bdd@aalmbdd_s1
delete from status_laptop;
@carga-inicial/status_laptop.sql
commit;

Prompt ======================================
Prompt Cargando catalogos de forma manual en aalmbdd_s2
Prompt ======================================
connect ilap_bdd/ilap_bdd@aalmbdd_s2
delete from status_laptop;
@carga-inicial/status_laptop.sql
commit;

Prompt Listo ccc:
exit