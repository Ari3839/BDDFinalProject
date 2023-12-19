-- @Autor   Ariadna Lazaro & Alejandro Hernández
-- @Fecha   06/dic/2023
-- @Descripcion: Usuarios

declare
  v_count number;
  v_username varchar2(20) := 'ILAP_BDD';
begin
  select count(*) into v_count from all_users where username=v_username;
  if v_count >0 then
    execute immediate 'drop user '||v_username|| ' cascade';
  end if;
end;
/

Prompt creando al usuario ilap_bdd
create user ilap_bdd identified by ilap_bdd quota unlimited on users;
grant create session, create table, create sequence, create procedure, create view, 
create synonym, create database link to ilap_bdd;

grant create type, create procedure, create trigger, create any directory to ilap_bdd;