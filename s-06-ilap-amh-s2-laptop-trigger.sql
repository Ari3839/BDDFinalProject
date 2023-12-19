-- @Autor   Ariadna Lazaro & Alejandro Hernández
-- @Fecha   11/dic/2023
-- @Descripcion: Trigger laptop Nodo 2

create or replace trigger t_dml_laptop
instead of insert or update or delete on laptop
declare
begin
  case
    when inserting then
      --insersion local
      if substr(:new.num_serie,1,1) IN (6,7,8,9) then
        insert into laptop_f5(laptop_id,num_serie,cantidad_ram,caracteristicas_extras,
          tipo_tarjeta_video_id,tipo_procesador_id,tipo_almacenamiento_id,
          tipo_monitor_id,laptop_reemplazo_id)
        values(:new.laptop_id,:new.num_serie,:new.cantidad_ram,:new.caracteristicas_extras,
          :new.tipo_tarjeta_video_id,:new.tipo_procesador_id,:new.tipo_almacenamiento_id,
          :new.tipo_monitor_id,:new.laptop_reemplazo_id);
      --insersiones remotas
      elsif substr(:new.num_serie,1,1) IN (2,3) then
        insert into laptop_f3(laptop_id,num_serie,cantidad_ram,caracteristicas_extras,
          tipo_tarjeta_video_id,tipo_procesador_id,tipo_almacenamiento_id,
          tipo_monitor_id,laptop_reemplazo_id)
        values(:new.laptop_id,:new.num_serie,:new.cantidad_ram,:new.caracteristicas_extras,
          :new.tipo_tarjeta_video_id,:new.tipo_procesador_id,:new.tipo_almacenamiento_id,
          :new.tipo_monitor_id,:new.laptop_reemplazo_id);
      elsif substr(:new.num_serie,1,1) IN (4,5) then
        insert into laptop_f4(laptop_id,num_serie,cantidad_ram,caracteristicas_extras,
          tipo_tarjeta_video_id,tipo_procesador_id,tipo_almacenamiento_id,
          tipo_monitor_id,laptop_reemplazo_id)
        values(:new.laptop_id,:new.num_serie,:new.cantidad_ram,:new.caracteristicas_extras,
          :new.tipo_tarjeta_video_id,:new.tipo_procesador_id,:new.tipo_almacenamiento_id,
          :new.tipo_monitor_id,:new.laptop_reemplazo_id);
      elsif substr(:new.num_serie,1,1) IN (0,1) then
        insert into laptop_f2(laptop_id,num_serie,cantidad_ram,caracteristicas_extras,
          tipo_tarjeta_video_id,tipo_procesador_id,tipo_almacenamiento_id,
          tipo_monitor_id,laptop_reemplazo_id)
        values(:new.laptop_id,:new.num_serie,:new.cantidad_ram,:new.caracteristicas_extras,
          :new.tipo_tarjeta_video_id,:new.tipo_procesador_id,:new.tipo_almacenamiento_id,
          :new.tipo_monitor_id,:new.laptop_reemplazo_id);
      else
        raise_application_error(-20010,
        'Valor incorrecto para el campo num_serie : '
        || :new.num_serie);
      end if;

      --insersión del blob en temporal
      insert into ti_laptop_f1(laptop_id,foto)
        values(:new.laptop_id,:new.foto);
      --insersion remota
      insert into laptop_f1
        select * from ti_laptop_f1
        where laptop_id=:new.laptop_id;
      --borrando datos temporales
      delete from ti_laptop_f1
        where laptop_id=:new.laptop_id;

    when deleting then
      if substr(:new.num_serie,1,1) IN (6,7,8,9) then
        delete from laptop_f5
          where laptop_id=:old.laptop_id;
      elsif substr(:new.num_serie,1,1) IN (2,3) then
        delete from laptop_f3
          where laptop_id=:old.laptop_id;
      elsif substr(:new.num_serie,1,1) IN (4,5) then
        delete from laptop_f4
          where laptop_id=:old.laptop_id;
      elsif substr(:new.num_serie,1,1) IN (0,1) then
        delete from laptop_f2
          where laptop_id=:old.laptop_id;
      else
        raise_application_error(-20010,
        'No se encontró el id para esa laptop:: '
        || :old.laptop_id);
      end if;
      delete from laptop_f1
        where laptop_id=:old.laptop_id;

    when updating then
      raise_application_error(-20030,
      'Aún no se admite la operación UPDATE');

  end case;
end;
/
show errors

