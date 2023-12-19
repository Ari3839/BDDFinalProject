-- @Autor   Ariadna Lazaro & Alejandro Hernández
-- @Fecha   10/dic/2023
-- @Descripcion: Creacion de trigger para insertar y borrar

create or replace trigger t_dml_sucursal_taller
instead of insert or update or delete on sucursal_taller
declare
    --programar
    v_count number;
begin
    case
    when inserting then
    --programar
        select count(*) into v_count
        from sucursal_f2 where SUCURSAL_ID = :new.SUCURSAL_ID;
        if v_count > 0 then
            insert into sucursal_taller_f2(SUCURSAL_ID, DIA_DESCANSO, TELEFONO_ATENCION)
            values(:new.SUCURSAL_ID, :new.DIA_DESCANSO, :new.TELEFONO_ATENCION);
        else
            select count(*) into v_count
            from sucursal_f1 where SUCURSAL_ID = :new.SUCURSAL_ID; 
            if v_count > 0 then
                insert into sucursal_taller_f1(SUCURSAL_ID, DIA_DESCANSO, TELEFONO_ATENCION)
                values(:new.SUCURSAL_ID, :new.DIA_DESCANSO, :new.TELEFONO_ATENCION);
            else 
                select count(*) into v_count
                from sucursal_f3 where SUCURSAL_ID = :new.SUCURSAL_ID; 
                if v_count > 0 then
                    insert into sucursal_taller_f3(SUCURSAL_ID, DIA_DESCANSO, TELEFONO_ATENCION)
                    values(:new.SUCURSAL_ID, :new.DIA_DESCANSO, :new.TELEFONO_ATENCION);
                else
                    select count(*) into v_count
                    from sucursal_f4 where SUCURSAL_ID = :new.SUCURSAL_ID; 
                    if v_count > 0 then
                        insert into sucursal_taller_f4(SUCURSAL_ID, DIA_DESCANSO, TELEFONO_ATENCION)
                        values(:new.SUCURSAL_ID, :new.DIA_DESCANSO, :new.TELEFONO_ATENCION);
                    else
                        raise_application_error(-20010,
                        'El registro que se intenta insertar o eliminar no cumple con el esquema de fragmentación horizontal derivada.');
                    end if;
                end if;
            end if;
        end if;
    
    when deleting then
    --programar
        select count(*) into v_count
        from sucursal_f2 where SUCURSAL_ID = :old.SUCURSAL_ID;
        if v_count > 0 then
            delete from sucursal_taller_f2 where SUCURSAL_ID = :old.SUCURSAL_ID;
        else
            select count(*) into v_count
            from sucursal_f1 where SUCURSAL_ID = :old.SUCURSAL_ID; 
            if v_count > 0 then
                delete from sucursal_taller_f1 where SUCURSAL_ID = :old.SUCURSAL_ID;
            else 
                select count(*) into v_count
                from sucursal_f3 where SUCURSAL_ID = :old.SUCURSAL_ID; 
                if v_count > 0 then
                    delete from sucursal_taller_f3 where SUCURSAL_ID = :old.SUCURSAL_ID;
                else
                    select count(*) into v_count
                    from sucursal_f4 where SUCURSAL_ID = :old.SUCURSAL_ID; 
                    if v_count > 0 then
                        delete from sucursal_taller_f4 where SUCURSAL_ID = :old.SUCURSAL_ID;
                    else
                        raise_application_error(-20020,
                        'El registro que se intenta insertar o eliminar no cumple con el esquema de fragmentación horizontal derivada.');
                    end if;
                end if;
            end if;
        end if;
    when updating then
    raise_application_error(-20030,
        'Se intentó realizar una operación update en una tabla con esquema de fragmentación. Para propósitos del proyecto, esta operación no estará implementada.');
    --programar
    end case;
end;
/

show errors