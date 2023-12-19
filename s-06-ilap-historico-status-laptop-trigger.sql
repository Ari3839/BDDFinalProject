-- @Autor   Ariadna Lazaro & Alejandro Hernández
-- @Fecha   10/dic/2023
-- @Descripcion: Creacion de trigger para insertar y borrar

create or replace trigger t_dml_historico_status_laptop
instead of insert or update or delete on historico_status_laptop
declare
    --programar
begin
    case
    when inserting then
    --programar
        if :new.FECHA_STATUS <= to_date('31/12/2009','dd/mm/yyyy') then
            insert into historico_status_laptop_f1(HISTORICO_STATUS_LAPTOP_ID, FECHA_STATUS, LAPTOP_ID, STATUS_LAPTOP_ID)
            values(:new.HISTORICO_STATUS_LAPTOP_ID, :new.FECHA_STATUS, :new.LAPTOP_ID, :new.STATUS_LAPTOP_ID);
        elsif :new.FECHA_STATUS > to_date('31/12/2009','dd/mm/yyyy') then
            insert into historico_status_laptop_f2(HISTORICO_STATUS_LAPTOP_ID, FECHA_STATUS, LAPTOP_ID, STATUS_LAPTOP_ID)
            values(:new.HISTORICO_STATUS_LAPTOP_ID, :new.FECHA_STATUS, :new.LAPTOP_ID, :new.STATUS_LAPTOP_ID);
        else 
            raise_application_error(-20010,
            'El registro que se intenta insertar o eliminar no cumple con el esquema de fragmentación horizontal primaria.');
        end if;
    when deleting then
    --programar
        if :old.FECHA_STATUS <= to_date('31/12/2009','dd/mm/yyyy') then
            delete from historico_status_laptop_f1 where HISTORICO_STATUS_LAPTOP_ID = :old.HISTORICO_STATUS_LAPTOP_ID;
        elsif :old.FECHA_STATUS > to_date('31/12/2009','dd/mm/yyyy') then
            delete from historico_status_laptop_f2 where HISTORICO_STATUS_LAPTOP_ID = :old.HISTORICO_STATUS_LAPTOP_ID;

        else 
            raise_application_error(-20010,
            'El registro que se intenta insertar o eliminar no cumple con el esquema de fragmentación horizontal primaria.');
        end if;
    when updating then
    raise_application_error(-20030,
        'Se intentó realizar una operación update en una tabla con esquema de fragmentación. Para propósitos del proyecto, esta operación no estará implementada.');
    --programar
    end case;
end;
/

show errors