-- @Autor   Ariadna Lazaro & Alejandro Hernández
-- @Fecha   07/dic/2023
-- @Descripcion: Validando sinónimos en c/pdb


clear screen
whenever sqlerror exit rollback;

prompt =====================================
prompt Creando sinonimos para aalmbdd_s1
prompt =====================================

connect ilap_bdd/ilap_bdd@aalmbdd_s1
@s-04-ilap-aalmbdd-s1-sinonimos.sql
@s-04-ilap-valida-sinonimos.sql


prompt =====================================
prompt creando sinonimos para aalmbdd_s2
prompt =====================================

connect ilap_bdd/ilap_bdd@aalmbdd_s2
@s-04-ilap-aalmbdd-s2-sinonimos.sql
@s-04-ilap-valida-sinonimos.sql


prompt =====================================
prompt creando sinonimos para amhbdd_s1
prompt =====================================

connect ilap_bdd/ilap_bdd@amhbdd_s1
@s-04-ilap-amhbdd-s1-sinonimos.sql
@s-04-ilap-valida-sinonimos.sql


prompt =====================================
prompt creando sinonimos para amhbdd_s2
prompt =====================================

connect ilap_bdd/ilap_bdd@amhbdd_s2
@s-04-ilap-amhbdd-s2-sinonimos.sql
@s-04-ilap-valida-sinonimos.sql


prompt Listo c: