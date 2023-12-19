-- @Autor   Ariadna Lazaro & Alejandro Hernández
-- @Fecha   11/dic/2023
-- @Descripcion: Preparación de carga de datos blob MAIN

Prompt configurando directorios y otorgando registros.

--aalmbdd_s1
Prompt configurando soporte BLOB para aalmbdd_s1
connect ilap_bdd/ilap_bdd@aalmbdd_s1
@s-07-ilap-configuracion-soporte-blobs.sql

--aalmbdd_s2
Prompt configurando soporte BLOB para aalmbdd_s2
connect ilap_bdd/ilap_bdd@aalmbdd_s2
@s-07-ilap-configuracion-soporte-blobs.sql

--amhbdd_s1
Prompt configurando soporte BLOB para amhbdd_s1
connect ilap_bdd/ilap_bdd@amhbdd_s1
@s-07-ilap-configuracion-soporte-blobs.sql

--amhbdd_s2
Prompt configurando soporte BLOB para amhbdd_s2
connect ilap_bdd/ilap_bdd@amhbdd_s2
@s-07-ilap-configuracion-soporte-blobs.sql

Prompt Listo c: