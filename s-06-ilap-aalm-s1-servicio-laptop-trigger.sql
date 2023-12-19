-- @Autor   Ariadna Lazaro & Alejandro Hernández
-- @Fecha   11/dic/2023
-- @Descripcion: Trigger en servicio_laptop en nodo 3

create or replace trigger t_dml_servicio_laptop
instead of insert or update or delete on servicio_laptop
declare
  v_count number;
  v_count2 number;
  v_count3 number;
  v_count4 number;
begin
  case
    when inserting then
      --Verificando correspondencia local
      select count(*) into v_count
      from sucursal_f3
      where sucursal_id=:new.sucursal_id;
      --Verificando correspondencias remotas
      select count(*) into v_count2
      from sucursal_f2
      where sucursal_id=:new.sucursal_id;
      select count(*) into v_count3
      from sucursal_f1
      where sucursal_id=:new.sucursal_id;
      select count(*) into v_count4
      from sucursal_f4
      where sucursal_id=:new.sucursal_id;

      if v_count>0 then
        insert into ti_servicio_laptop_f3(num_servicio,laptop_id,
          importe,diagnostico,factura,sucursal_id)
        values(:new.num_servicio,:new.laptop_id,
          :new.importe,:new.diagnostico,:new.factura,:new.sucursal_id);
        --insersión con select
        insert into servicio_laptop_f3
          select * from ti_servicio_laptop_f3
          where num_servicio=:new.num_servicio
          and laptop_id=:new.laptop_id;
        --borrando registros de tabla temporal
        delete from ti_servicio_laptop_f3
          where num_servicio=:new.num_servicio
          and laptop_id=:new.laptop_id;
      elsif v_count2>0 then
        insert into ti_servicio_laptop_f2(num_servicio,laptop_id,
          importe,diagnostico,factura,sucursal_id)
        values(:new.num_servicio,:new.laptop_id,
          :new.importe,:new.diagnostico,:new.factura,:new.sucursal_id);
        --insersión con select
        insert into servicio_laptop_f2
          select * from ti_servicio_laptop_f2
          where num_servicio=:new.num_servicio
          and laptop_id=:new.laptop_id;
        --borrando registros de tabla temporal
        delete from ti_servicio_laptop_f2
          where num_servicio=:new.num_servicio
          and laptop_id=:new.laptop_id;
      elsif v_count3>0 then
        insert into ti_servicio_laptop_f1(num_servicio,laptop_id,
          importe,diagnostico,factura,sucursal_id)
        values(:new.num_servicio,:new.laptop_id,
          :new.importe,:new.diagnostico,:new.factura,:new.sucursal_id);
        --insersión con select
        insert into servicio_laptop_f1
          select * from ti_servicio_laptop_f1
          where num_servicio=:new.num_servicio
          and laptop_id=:new.laptop_id;
        --borrando registros de tabla temporal
        delete from ti_servicio_laptop_f1
          where num_servicio=:new.num_servicio
          and laptop_id=:new.laptop_id;
      elsif v_count4>0 then
        insert into ti_servicio_laptop_f4(num_servicio,laptop_id,
          importe,diagnostico,factura,sucursal_id)
        values(:new.num_servicio,:new.laptop_id,
          :new.importe,:new.diagnostico,:new.factura,:new.sucursal_id);
        --insersión con select
        insert into servicio_laptop_f4
          select * from ti_servicio_laptop_f4
          where num_servicio=:new.num_servicio
          and laptop_id=:new.laptop_id;
        --borrando registros de tabla temporal
        delete from ti_servicio_laptop_f4
          where num_servicio=:new.num_servicio
          and laptop_id=:new.laptop_id;
      else
        raise_application_error(-20020,
        'Valor incorrecto para el campo sucursal_id : '
        || :new.sucursal_id);
      end if;

    when deleting then
      --Verificando correspondencia local
      select count(*) into v_count
      from sucursal_f3
      where sucursal_id=:old.sucursal_id;
      --Verificando correspondencias remotas
      select count(*) into v_count2
      from sucursal_f2
      where sucursal_id=:old.sucursal_id;
      select count(*) into v_count3
      from sucursal_f1
      where sucursal_id=:old.sucursal_id;
      select count(*) into v_count4
      from sucursal_f4
      where sucursal_id=:old.sucursal_id;

      if v_count>0 then
        delete from servicio_laptop_f3 
          where laptop_id=:old.laptop_id 
          and num_servicio=:old.num_servicio;
      elsif v_count2>0 then
        delete from servicio_laptop_f2 
          where laptop_id=:old.laptop_id 
          and num_servicio=:old.num_servicio;
      elsif v_count3>0 then
        delete from servicio_laptop_f1 
          where laptop_id=:old.laptop_id 
          and num_servicio=:old.num_servicio;
      elsif v_count4>0 then
        delete from servicio_laptop_f4 
          where laptop_id=:old.laptop_id 
          and num_servicio=:old.num_servicio;
      else
        raise_application_error(-20020,
        'Valor incorrecto para el campo laptop_id : '
        || :old.sucursal_id ||' o para el campo num_servicio : '
        || :old.num_servicio);
      end if;

    when updating then
      raise_application_error(-20030,
      'Aún no se admite la operación UPDATE');

  end case;
end;
/
show errors