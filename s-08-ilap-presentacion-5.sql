-- @Autor   Ariadna Lazaro & Alejandro Hernández
-- @Fecha   11/dic/2023
-- @Descripcion: Presentacion final pte. 2

Prompt Seleccionar la PDB para realizar la eliminación de datos
connect ilap_bdd/ilap_bdd@&pdb

set serveroutput on

Prompt Eliminando datos ...

declare
  v_formato varchar2(50) := 'yyy-mm-dd hh24:mi:ss';
begin
  --completar

  dbms_output.put_line(to_char(sysdate,v_formato)
    || ' Eliminando datos de servicio_laptop');
  delete from servicio_laptop;
  

  dbms_output.put_line(to_char(sysdate,v_formato)
    || ' Eliminando datos de sucursal_venta');
  delete from sucursal_venta;
  dbms_output.put_line(to_char(sysdate,v_formato)
    || ' Eliminando datos de sucursal_taller');
  delete from sucursal_taller;
  dbms_output.put_line(to_char(sysdate,v_formato)
    || ' Eliminando datos de sucursal');
  delete from sucursal;

  dbms_output.put_line(to_char(sysdate,v_formato)
    || ' Eliminando datos de historico_status_laptop');
  delete from historico_status_laptop;
  dbms_output.put_line(to_char(sysdate,v_formato)
    || ' Eliminando datos de laptop_inventario');
  delete from laptop_inventario;
  dbms_output.put_line(to_char(sysdate,v_formato)
    || ' Eliminando datos de status_laptop');
  delete from status_laptop;
  
  dbms_output.put_line(to_char(sysdate,v_formato)
    || ' Eliminando datos de laptop');
  delete from laptop;

  dbms_output.put_line(to_char(sysdate,v_formato)
    || ' Eliminando datos de tipo procesador');
  delete from tipo_procesador;
  dbms_output.put_line(to_char(sysdate,v_formato)
    || ' Eliminando datos de tipo monitor');
  delete from tipo_monitor;
  dbms_output.put_line(to_char(sysdate,v_formato)
    || ' Eliminando datos de tipo almacenamiento');
  delete from tipo_almacenamiento;
  dbms_output.put_line(to_char(sysdate,v_formato)
    || ' Eliminando datos de tipo tarjeta video');
  delete from tipo_tarjeta_video;
  
  
  commit;
exception
  when others then
    dbms_output.put_line('Errores detectados al realizar la eliminacion');
    dbms_output.put_line('Se hara rollback');
    dbms_output.put_line(dbms_utility.format_error_backtrace);
  rollback;
  raise;
end;
/
Prompt Listo ccc:

exit