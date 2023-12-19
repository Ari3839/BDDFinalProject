-- @Autor   Ariadna Lazaro & Alejandro Hernández
-- @Fecha   07/dic/2023
-- @Descripcion: Creando vistas que no tienen BLOBs


--sucursal
create or replace view sucursal as
  select sucursal_id,clave,es_taller,es_venta,nombre,latitud,longitud,url from sucursal_f1
  union all
  select sucursal_id,clave,es_taller,es_venta,nombre,latitud,longitud,url from sucursal_f2
  union all
  select sucursal_id,clave,es_taller,es_venta,nombre,latitud,longitud,url from sucursal_f3
  union all
  select sucursal_id,clave,es_taller,es_venta,nombre,latitud,longitud,url from sucursal_f4;

--sucursal_taller
create or replace view sucursal_taller as
  select sucursal_id,dia_descanso,telefono_atencion from sucursal_taller_f1
  union all
  select sucursal_id,dia_descanso,telefono_atencion from sucursal_taller_f2
  union all
  select sucursal_id,dia_descanso,telefono_atencion from sucursal_taller_f3
  union all
  select sucursal_id,dia_descanso,telefono_atencion from sucursal_taller_f4;

--sucursal_venta
create or replace view sucursal_venta as
  select sucursal_id,hora_apertura,hora_cierre from sucursal_venta_f1
  union all
  select sucursal_id,hora_apertura,hora_cierre from sucursal_venta_f2
  union all
  select sucursal_id,hora_apertura,hora_cierre from sucursal_venta_f3
  union all
  select sucursal_id,hora_apertura,hora_cierre from sucursal_venta_f4;

--status es copia manual

--laptop tiene foto blob

--laptop_inventario tiene factura blob

--histórico_status_laptop
create or replace view historico_status_laptop as
  select historico_status_laptop_id,fecha_status,status_laptop_id,laptop_id from historico_status_laptop_f1
  union all
  select historico_status_laptop_id,fecha_status,status_laptop_id,laptop_id from historico_status_laptop_f2;

--laptop inventario
create or replace view laptop_inventario as
  select t.laptop_id,s.fecha_status,t.rfc_cliente,t.num_tarjeta,s.sucursal_id,s.status_laptop_id
  from laptop_inventario_f1 t join laptop_inventario_f2 s
  on t.laptop_id=s.laptop_id;

--Vistas replicadas

create or replace view tipo_procesador as
  select tipo_procesador_id,clave,descripcion
  from tipo_procesador_r1;

create or replace view tipo_tarjeta_video as
  select tipo_tarjeta_video_id,clave,descripcion
  from tipo_tarjeta_video_r1;

create or replace view tipo_almacenamiento as
  select tipo_almacenamiento_id,clave,descripcion
  from tipo_almacenamiento_r1;

create or replace view tipo_monitor as
  select tipo_monitor_id,clave,descripcion
  from tipo_monitor_r1;

