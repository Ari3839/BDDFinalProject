-- @Autor   Ariadna Lazaro & Alejandro Hernández
-- @Fecha   10/dic/2023
-- @Descripcion: Creacion de trigger para insertar y borrar

create or replace trigger t_dml_sucursal
instead of insert or update or delete on sucursal
declare
    --programar
begin
    case
    when inserting then
    --programar
        if substr(:new.CLAVE,3,2) not in ('NO','EA','WS','SO') then
          raise_application_error(-20010,
            'El registro que se intenta insertar o eliminar no cumple con el esquema de fragmentación horizontal primaria.');
        end if;

        if (:new.ES_TALLER = '1' and :new.ES_VENTA = '1') or substr(:new.CLAVE,3,2) = 'NO' then
            insert into sucursal_f1(SUCURSAL_ID, CLAVE, ES_TALLER, ES_VENTA, NOMBRE, LATITUD, LONGITUD, URL)
            values(:new.SUCURSAL_ID, :new.CLAVE, :new.ES_TALLER, :new.ES_VENTA, :new.NOMBRE, :new.LATITUD, :new.LONGITUD, :new.URL);
        elsif (:new.ES_TALLER = '0' or :new.ES_VENTA = '0') and substr(:new.CLAVE,3,2) <> 'NO' then
            if substr(:new.CLAVE,3,2) = 'EA' then
                insert into sucursal_f2(SUCURSAL_ID, CLAVE, ES_TALLER, ES_VENTA, NOMBRE, LATITUD, LONGITUD, URL)
                values(:new.SUCURSAL_ID, :new.CLAVE, :new.ES_TALLER, :new.ES_VENTA, :new.NOMBRE, :new.LATITUD, :new.LONGITUD, :new.URL);
            elsif substr(:new.CLAVE,3,2) = 'WS' then
                insert into sucursal_f3(SUCURSAL_ID, CLAVE, ES_TALLER, ES_VENTA, NOMBRE, LATITUD, LONGITUD, URL)
                values(:new.SUCURSAL_ID, :new.CLAVE, :new.ES_TALLER, :new.ES_VENTA, :new.NOMBRE, :new.LATITUD, :new.LONGITUD, :new.URL);
            elsif substr(:new.CLAVE,3,2) = 'SO'then
                insert into sucursal_f4(SUCURSAL_ID, CLAVE, ES_TALLER, ES_VENTA, NOMBRE, LATITUD, LONGITUD, URL)
                values(:new.SUCURSAL_ID, :new.CLAVE, :new.ES_TALLER, :new.ES_VENTA, :new.NOMBRE, :new.LATITUD, :new.LONGITUD, :new.URL);
            else
                raise_application_error(-20010,
                'El registro que se intenta insertar o eliminar no cumple con el esquema de fragmentación horizontal primaria.');
            end if;
        else 
            raise_application_error(-20010,
            'El registro que se intenta insertar o eliminar no cumple con el esquema de fragmentación horizontal primaria.');
        end if;
    when deleting then
    --programar
        if substr(:old.CLAVE,3,2) not in ('NO','EA','WS','SO') then
          raise_application_error(-20010,
            'El registro que se intenta insertar o eliminar no cumple con el esquema de fragmentación horizontal primaria.');
        end if;
        
        if (:old.ES_TALLER = '1' and :old.ES_VENTA = '1') or substr(:old.CLAVE,3,2) = 'NO' then
            delete from sucursal_f1 where SUCURSAL_ID = :old.SUCURSAL_ID;
        elsif (:old.ES_TALLER = '0' or :old.ES_VENTA = '0') and substr(:old.CLAVE,3,2) <> 'NO' then
            if substr(:old.CLAVE,3,2) = 'EA' then
                delete from sucursal_f2 where SUCURSAL_ID = :old.SUCURSAL_ID;
            elsif substr(:old.CLAVE,3,2) = 'WS' then
                delete from sucursal_f3 where SUCURSAL_ID = :old.SUCURSAL_ID;
            elsif substr(:old.CLAVE,3,2) = 'SO'then
                delete from sucursal_f4 where SUCURSAL_ID = :old.SUCURSAL_ID;
            else
                raise_application_error(-20010,
                'El registro que se intenta insertar o eliminar no cumple con el esquema de fragmentación horizontal primaria.');
            end if;
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