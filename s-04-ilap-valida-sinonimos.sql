-- @Autor   Ariadna Lazaro & Alejandro Hernández
-- @Fecha   07/dic/2023
-- @Descripcion: Validando sinónimos

Prompt validando sinonimos para sucursal
select
  (select count(*) from sucursal_f1) as sucursal_f1,
  (select count(*) from sucursal_f2) as sucursal_f2,
  (select count(*) from sucursal_f3) as sucursal_f3,
  (select count(*) from sucursal_f4) as sucursal_f4
from dual;

Prompt validando sinonimos para sucursal_taller
select
  (select count(*) from sucursal_taller_f1) as sucursal_taller_f1,
  (select count(*) from sucursal_taller_f2) as sucursal_taller_f2,
  (select count(*) from sucursal_taller_f3) as sucursal_taller_f3,
  (select count(*) from sucursal_taller_f4) as sucursal_taller_f4
from dual;

Prompt validando sinonimos para sucursal_venta
select
  (select count(*) from sucursal_venta_f1) as sucursal_venta_f1,
  (select count(*) from sucursal_venta_f2) as sucursal_venta_f2,
  (select count(*) from sucursal_venta_f3) as sucursal_venta_f3,
  (select count(*) from sucursal_venta_f4) as sucursal_venta_f4
from dual;

Prompt validando sinonimos para status_laptop
select count(*) as status_laptop from status_laptop;

Prompt validando sinonimos para historico_status_laptop
select
  (select count(*) from historico_status_laptop_f1) as historico_status_laptop_f1,
  (select count(*) from historico_status_laptop_f2) as historico_status_laptop_f2
from dual;

Prompt validando sinonimos para servicio_laptop
select
  (select count(*) from servicio_laptop_f1) as servicio_laptop_f1,
  (select count(*) from servicio_laptop_f2) as servicio_laptop_f2,
  (select count(*) from servicio_laptop_f3) as servicio_laptop_f3,
  (select count(*) from servicio_laptop_f4) as servicio_laptop_f4
from dual;

Prompt validando sinonimos para laptop
select
  (select count(*) from laptop_f1) as laptop_f1,
  (select count(*) from laptop_f2) as laptop_f2,
  (select count(*) from laptop_f3) as laptop_f3,
  (select count(*) from laptop_f4) as laptop_f4,
  (select count(*) from laptop_f5) as laptop_f5
from dual;


Prompt validando sinonimos para laptop_inventario
select
  (select count(*) from laptop_inventario_f1) as laptop_inventario_f1,
  (select count(*) from laptop_inventario_f2) as laptop_inventario_f2
from dual;

Prompt validando sinonimos para tipo_procesador
select
  (select count(*) from tipo_procesador_r1) as tipo_procesador_r1,
  (select count(*) from tipo_procesador_r2) as tipo_procesador_r2,
  (select count(*) from tipo_procesador_r3) as tipo_procesador_r3,
  (select count(*) from tipo_procesador_r4) as tipo_procesador_r4
from dual;

Prompt validando sinonimos para tipo_tarjeta_video
select
  (select count(*) from tipo_tarjeta_video_r1) as tipo_tarjeta_video_r1,
  (select count(*) from tipo_tarjeta_video_r2) as tipo_tarjeta_video_r2,
  (select count(*) from tipo_tarjeta_video_r3) as tipo_tarjeta_video_r3,
  (select count(*) from tipo_tarjeta_video_r4) as tipo_tarjeta_video_r4
from dual;

Prompt validando sinonimos para tipo_almacenamiento
select
  (select count(*) from tipo_almacenamiento_r1) as tipo_almacenamiento_r1,
  (select count(*) from tipo_almacenamiento_r2) as tipo_almacenamiento_r2,
  (select count(*) from tipo_almacenamiento_r3) as tipo_almacenamiento_r3,
  (select count(*) from tipo_almacenamiento_r4) as tipo_almacenamiento_r4
from dual;

Prompt validando sinonimos para tipo_monitor
select
  (select count(*) from tipo_monitor_r1) as tipo_monitor_r1,
  (select count(*) from tipo_monitor_r2) as tipo_monitor_r2,
  (select count(*) from tipo_monitor_r3) as tipo_monitor_r3,
  (select count(*) from tipo_monitor_r4) as tipo_monitor_r4
from dual;