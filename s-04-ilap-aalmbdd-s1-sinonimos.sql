-- @Autor   Ariadna Lazaro & Alejandro Hernández
-- @Fecha   07/dic/2023
-- @Descripcion: Creacion de sinónimos

clear screen
whenever sqlerror exit rollback;

prompt =====================================
prompt Creando fragmentos para aalmbbdd_s1
prompt =====================================

connect ilap_bdd/ilap_bdd@aalmbdd_s1
--Locales
create or replace synonym sucursal_f3 for sucursal_f3_aalm_s1;
create or replace synonym sucursal_taller_f3 for sucursal_taller_f3_aalm_s1;
create or replace synonym sucursal_venta_f3 for sucursal_venta_f3_aalm_s1;
create or replace synonym servicio_laptop_f3 for servicio_laptop_f3_aalm_s1; 
create or replace synonym laptop_f4 for laptop_f4_aalm_s1;
create or replace synonym status_laptop for status_laptop_aalm_s1;
create or replace synonym laptop_inventario_f1 for laptop_inventario_f1_aalm_s1;
create or replace synonym tipo_procesador_r1 for tipo_procesador_r_aalm_s1;
create or replace synonym tipo_tarjeta_video_r1 for tipo_tarjeta_video_r_aalm_s1;
create or replace synonym tipo_almacenamiento_r1 for tipo_almacenamiento_r_aalm_s1;
create or replace synonym tipo_monitor_r1 for tipo_monitor_r_aalm_s1;
--AALMBDD_S2
create or replace synonym sucursal_f4 for sucursal_f4_aalm_s2@aalmbdd_s2;
create or replace synonym sucursal_taller_f4 for sucursal_taller_f4_aalm_s2@aalmbdd_s2;
create or replace synonym sucursal_venta_f4 for sucursal_venta_f4_aalm_s2@aalmbdd_s2;
create or replace synonym servicio_laptop_f4 for servicio_laptop_f4_aalm_s2@aalmbdd_s2;
create or replace synonym laptop_f1 for laptop_f1_aalm_s2@aalmbdd_s2;
create or replace synonym laptop_f3 for laptop_f3_aalm_s2@aalmbdd_s2;
create or replace synonym tipo_procesador_r2 for tipo_procesador_r_aalm_s2@aalmbdd_s2;
create or replace synonym tipo_tarjeta_video_r2 for tipo_tarjeta_video_r_aalm_s2@aalmbdd_s2;
create or replace synonym tipo_almacenamiento_r2 for tipo_almacenamiento_r_aalm_s2@aalmbdd_s2;
create or replace synonym tipo_monitor_r2 for tipo_monitor_r_aalm_s2@aalmbdd_s2;
--AMHBDD_S1
create or replace synonym sucursal_f1 for sucursal_f1_amh_s1@amhbdd_s1;
create or replace synonym sucursal_taller_f1 for sucursal_taller_f1_amh_s1@amhbdd_s1;
create or replace synonym sucursal_venta_f1 for sucursal_venta_f1_amh_s1@amhbdd_s1;
create or replace synonym servicio_laptop_f1 for servicio_laptop_f1_amh_s1@amhbdd_s1;
create or replace synonym historico_status_laptop_f2 for historico_status_laptop_f2_amh_s1@amhbdd_s1;
create or replace synonym laptop_f2 for laptop_f2_amh_s1@amhbdd_s1;
create or replace synonym laptop_inventario_f2 for laptop_inventario_f2_amh_s1@amhbdd_s1;
create or replace synonym tipo_procesador_r3 for tipo_procesador_r_amh_s1@amhbdd_s1;
create or replace synonym tipo_tarjeta_video_r3 for tipo_tarjeta_video_r_amh_s1@amhbdd_s1;
create or replace synonym tipo_almacenamiento_r3 for tipo_almacenamiento_r_amh_s1@amhbdd_s1;
create or replace synonym tipo_monitor_r3 for tipo_monitor_r_amh_s1@amhbdd_s1;
--AMHBDD_S2
create or replace synonym sucursal_f2 for sucursal_f2_amh_s2@amhbdd_s2;
create or replace synonym sucursal_taller_f2 for sucursal_taller_f2_amh_s2@amhbdd_s2; 
create or replace synonym sucursal_venta_f2 for sucursal_venta_f2_amh_s2@amhbdd_s2;
create or replace synonym servicio_laptop_f2 for servicio_laptop_f2_amh_s2@amhbdd_s2;
create or replace synonym historico_status_laptop_f1 for historico_status_laptop_f1_amh_s2@amhbdd_s2;
create or replace synonym laptop_f5 for laptop_f5_amh_s2@amhbdd_s2;
create or replace synonym tipo_procesador_r4 for tipo_procesador_r_amh_s2@amhbdd_s2;
create or replace synonym tipo_tarjeta_video_r4 for tipo_tarjeta_video_r_amh_s2@amhbdd_s2;
create or replace synonym tipo_almacenamiento_r4 for tipo_almacenamiento_r_amh_s2@amhbdd_s2;
create or replace synonym tipo_monitor_r4 for tipo_monitor_r_amh_s2@amhbdd_s2;
	
Prompt Listo c:
