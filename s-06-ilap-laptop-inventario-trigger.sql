-- @Autor   Ariadna Lazaro & Alejandro Hernández
-- @Fecha   10/dic/2023
-- @Descripcion: Creacion de trigger para insertar y borrar

create or replace trigger t_dml_laptop_inventario
instead of insert or update or delete on laptop_inventario
declare
    --programar
begin
    case
    when inserting then
    --programar
        
                insert into laptop_inventario_f1(LAPTOP_ID, RFC_CLIENTE, NUM_TARJETA)
                values(:new.LAPTOP_ID, :new.RFC_CLIENTE, :new.NUM_TARJETA);

                insert into laptop_inventario_f2(LAPTOP_ID, FECHA_STATUS, STATUS_LAPTOP_ID, SUCURSAL_ID)
                values(:new.LAPTOP_ID, :new.FECHA_STATUS, :new.STATUS_LAPTOP_ID, :new.SUCURSAL_ID);

    when deleting then
    --programar

                delete from laptop_inventario_f1 where LAPTOP_ID = :old.LAPTOP_ID;
                delete from laptop_inventario_f2 where LAPTOP_ID = :old.LAPTOP_ID;

    when updating then
    raise_application_error(-20030,
        'Se intentó realizar una operación update en una tabla con esquema de fragmentación. Para propósitos del proyecto, esta operación no estará implementada.');
    --programar
    end case;
end;
/

show errors