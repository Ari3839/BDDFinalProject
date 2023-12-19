-- @Autor   Ariadna Lazaro & Alejandro Hernández
-- @Fecha   11/dic/2023
-- @Descripcion: Triggers MAIN

clear screen
whenever sqlerror exit rollback

Prompt ==============================
Prompt Creando triggers en amhbdd_s1
Prompt ==============================
connect sys/system@amhbdd_s1 as sysdba
GRANT CREATE TRIGGER TO ilap_bdd;
connect ilap_bdd/ilap_bdd@amhbdd_s1
@s-06-ilap-sucursal-trigger.sql
@s-06-ilap-amh-s1-sucursal-taller-trigger.sql
@s-06-ilap-amh-s1-sucursal-venta-trigger.sql
--@s-06-ilap-laptop-trigger.sql
@s-06-ilap-amh-s1-laptop-trigger.sql --err
@s-06-ilap-laptop-inventario-trigger.sql
@s-06-ilap-historico-status-laptop-trigger.sql
@s-06-ilap-amh-s1-servicio-laptop-trigger.sql --err
@s-06-ilap-tipo-procesador-trigger.sql
@s-06-ilap-tipo-almacenamiento-trigger.sql
@s-06-ilap-tipo-monitor-trigger.sql
@s-06-ilap-tipo-tarjeta-video-trigger.sql

Prompt ==============================
Prompt Creando triggers en amhbdd_s2
Prompt ==============================
connect sys/system@amhbdd_s2 as sysdba
GRANT CREATE TRIGGER TO ilap_bdd;
connect ilap_bdd/ilap_bdd@amhbdd_s2
@s-06-ilap-sucursal-trigger.sql
@s-06-ilap-amh-s2-sucursal-taller-trigger.sql
@s-06-ilap-amh-s2-sucursal-venta-trigger.sql
--@s-06-ilap-laptop-trigger.sql
@s-06-ilap-amh-s2-laptop-trigger.sql --err
@s-06-ilap-laptop-inventario-trigger.sql
@s-06-ilap-laptop-inventario-trigger.sql
@s-06-ilap-historico-status-laptop-trigger.sql
@s-06-ilap-amh-s2-servicio-laptop-trigger.sql --err
@s-06-ilap-tipo-procesador-trigger.sql
@s-06-ilap-tipo-almacenamiento-trigger.sql
@s-06-ilap-tipo-monitor-trigger.sql
@s-06-ilap-tipo-tarjeta-video-trigger.sql

Prompt ==============================
Prompt Creando triggers en aalmbdd_s1
Prompt ==============================
connect sys/system@aalmbdd_s1 as sysdba
GRANT CREATE TRIGGER TO ilap_bdd;
connect ilap_bdd/ilap_bdd@aalmbdd_s1
@s-06-ilap-sucursal-trigger.sql
@s-06-ilap-aalm-s1-sucursal-taller-trigger.sql
@s-06-ilap-aalm-s1-sucursal-venta-trigger.sql
--@s-06-ilap-laptop-trigger.sql
@s-06-ilap-aalm-s1-laptop-trigger.sql --err
@s-06-ilap-laptop-inventario-trigger.sql
@s-06-ilap-historico-status-laptop-trigger.sql
@s-06-ilap-aalm-s1-servicio-laptop-trigger.sql --err
@s-06-ilap-tipo-procesador-trigger.sql
@s-06-ilap-tipo-almacenamiento-trigger.sql
@s-06-ilap-tipo-monitor-trigger.sql
@s-06-ilap-tipo-tarjeta-video-trigger.sql

Prompt ==============================
Prompt Creando triggers en aalmbdd_s2
Prompt ==============================
connect sys/system@aalmbdd_s2 as sysdba
GRANT CREATE TRIGGER TO ilap_bdd;
connect ilap_bdd/ilap_bdd@aalmbdd_s2
@s-06-ilap-sucursal-trigger.sql
@s-06-ilap-aalm-s2-sucursal-taller-trigger.sql
@s-06-ilap-aalm-s2-sucursal-venta-trigger.sql
@s-06-ilap-aalm-s2-laptop-trigger.sql --err
@s-06-ilap-laptop-inventario-trigger.sql
@s-06-ilap-historico-status-laptop-trigger.sql
@s-06-ilap-aalm-s2-laptop-trigger.sql --err
@s-06-ilap-aalm-s2-servicio-laptop-trigger.sql --err
@s-06-ilap-tipo-procesador-trigger.sql
@s-06-ilap-tipo-almacenamiento-trigger.sql
@s-06-ilap-tipo-monitor-trigger.sql
@s-06-ilap-tipo-tarjeta-video-trigger.sql

Prompt Listo c: