--
-- ER/Studio 8.0 SQL Code Generation
-- Company :      qwe
-- Project :      AMH_S1.DM1
-- Author :       qwe
--
-- Date Created : Thursday, December 07, 2023 16:27:40
-- Target DBMS : Oracle 11g
--

-- 
-- TABLE: HISTORICO_STATUS_LAPTOP_F2_AMH_S1 
--

CREATE TABLE HISTORICO_STATUS_LAPTOP_F2_AMH_S1(
    HISTORICO_STATUS_LAPTOP_ID    NUMBER(10, 0)    NOT NULL,
    FECHA_STATUS                  TIMESTAMP(6)     NOT NULL,
    LAPTOP_ID                     NUMBER(10, 0)    NOT NULL,
    STATUS_LAPTOP_ID              NUMBER(5, 0)     NOT NULL,
    CONSTRAINT HISTORICO_STATUS_PK PRIMARY KEY (HISTORICO_STATUS_LAPTOP_ID)
)
;



-- 
-- TABLE: LAPTOP_F2_AMH_S1 
--

CREATE TABLE LAPTOP_F2_AMH_S1(
    LAPTOP_ID                 NUMBER(10, 0)     NOT NULL,
    NUM_SERIE                 VARCHAR2(18)      NOT NULL,
    CANTIDAD_RAM              NUMBER(6, 0)      NOT NULL,
    CARACTERISTICAS_EXTRAS    VARCHAR2(2000)    NOT NULL,
    TIPO_TARJETA_VIDEO_ID     NUMBER(5, 0)      NOT NULL,
    TIPO_PROCESADOR_ID        NUMBER(5, 0)      NOT NULL,
    TIPO_ALMACENAMIENTO_ID    NUMBER(5, 0)      NOT NULL,
    TIPO_MONITOR_ID           NUMBER(5, 0)      NOT NULL,
    LAPTOP_REEMPLAZO_ID       NUMBER(10, 0)     NULL,
    CONSTRAINT LAPTOP_F2_PK PRIMARY KEY (LAPTOP_ID)
)
;



-- 
-- TABLE: LAPTOP_INVENTARIO_F2_AMH_S1 
--

CREATE TABLE LAPTOP_INVENTARIO_F2_AMH_S1(
    LAPTOP_ID           NUMBER(10, 0)    NOT NULL,
    FECHA_STATUS        TIMESTAMP(6)     NOT NULL,
    SUCURSAL_ID         NUMBER(10, 0)    NULL,
    STATUS_LAPTOP_ID    NUMBER(5, 0)     NOT NULL,
    CONSTRAINT LAPTOP_INVENTARIO_F2_PK PRIMARY KEY (LAPTOP_ID)
)
;



-- 
-- TABLE: SERVICIO_LAPTOP_F1_AMH_S1 
--

CREATE TABLE SERVICIO_LAPTOP_F1_AMH_S1(
    NUM_SERVICIO    NUMBER(10, 0)     NOT NULL,
    LAPTOP_ID       NUMBER(10, 0)     NOT NULL,
    IMPORTE         NUMBER(8, 2)      NOT NULL,
    DIAGNOSTICO     VARCHAR2(2000)    NOT NULL,
    FACTURA         BLOB,
    SUCURSAL_ID     NUMBER(10, 0)     NOT NULL,
    CONSTRAINT SERVICIO_LAPTOP_F1_PK PRIMARY KEY (NUM_SERVICIO, LAPTOP_ID)
)
;



-- 
-- TABLE: STATUS_LAPTOP 
--

CREATE TABLE STATUS_LAPTOP_F2_AMH_S1(
    STATUS_LAPTOP_ID    NUMBER(5, 0)     NOT NULL,
    CLAVE               VARCHAR2(40)     NOT NULL,
    DESCRIPCION         VARCHAR2(400)    NOT NULL,
    CONSTRAINT STATUS_LAPTOP_PK PRIMARY KEY (STATUS_LAPTOP_ID)
)
;



-- 
-- TABLE: SUCURSAL_F1_AMH_S1 
--

CREATE TABLE SUCURSAL_F1_AMH_S1(
    SUCURSAL_ID    NUMBER(10, 0)    NOT NULL,
    CLAVE          VARCHAR2(10)     NOT NULL,
    ES_TALLER      NUMBER(1, 0)     NOT NULL,
    ES_VENTA       NUMBER(1, 0)     NOT NULL,
    NOMBRE         VARCHAR2(40)     NOT NULL,
    LATITUD        BINARY_FLOAT     NOT NULL,
    LONGITUD       BINARY_FLOAT     NOT NULL,
    URL            VARCHAR2(200)    NOT NULL,
    CONSTRAINT SUCURSAL_F1_PK PRIMARY KEY (SUCURSAL_ID)
)
;



-- 
-- TABLE: SUCURSAL_TALLER_F1_AMH_S1 
--

CREATE TABLE SUCURSAL_TALLER_F1_AMH_S1(
    SUCURSAL_ID          NUMBER(10, 0)    NOT NULL,
    DIA_DESCANSO         NUMBER(1, 0)     NOT NULL,
    TELEFONO_ATENCION    VARCHAR2(20)     NOT NULL,
    CONSTRAINT SUCURSAL_TALLER_F1_PK PRIMARY KEY (SUCURSAL_ID)
)
;



-- 
-- TABLE: SUCURSAL_VENTA_F1_AMH_S1 
--

CREATE TABLE SUCURSAL_VENTA_F1_AMH_S1(
    SUCURSAL_ID      NUMBER(10, 0)    NOT NULL,
    HORA_APERTURA    DATE             NOT NULL,
    HORA_CIERRE      DATE             NOT NULL,
    CONSTRAINT SUCURSAL_VENTA_F1_PK PRIMARY KEY (SUCURSAL_ID)
)
;



-- 
-- TABLE: TIPO_ALMACENAMIENTO_R_AMH_S1 
--

CREATE TABLE TIPO_ALMACENAMIENTO_R_AMH_S1(
    TIPO_ALMACENAMIENTO_ID    NUMBER(5, 0)     NOT NULL,
    CLAVE                     VARCHAR2(40)     NOT NULL,
    DESCRIPCION               VARCHAR2(400)    NOT NULL,
    CONSTRAINT TIPO_ALMACENAMIENTO_PK PRIMARY KEY (TIPO_ALMACENAMIENTO_ID)
)
;



-- 
-- TABLE: TIPO_MONITOR_R_AMH_S1 
--

CREATE TABLE TIPO_MONITOR_R_AMH_S1(
    TIPO_MONITOR_ID    NUMBER(5, 0)     NOT NULL,
    CLAVE              VARCHAR2(40)     NOT NULL,
    DESCRIPCION        VARCHAR2(400)    NOT NULL,
    CONSTRAINT TIPO_MONITOR_PK PRIMARY KEY (TIPO_MONITOR_ID)
)
;



-- 
-- TABLE: TIPO_PROCESADOR_R_AMH_S1 
--

CREATE TABLE TIPO_PROCESADOR_R_AMH_S1(
    TIPO_PROCESADOR_ID    NUMBER(5, 0)     NOT NULL,
    CLAVE                 VARCHAR2(40)     NOT NULL,
    DESCRIPCION           VARCHAR2(400)    NOT NULL,
    CONSTRAINT TIPO_PROCESADOR_PK PRIMARY KEY (TIPO_PROCESADOR_ID)
)
;



-- 
-- TABLE: TIPO_TARJETA_VIDEO_R_AMH_S1 
--

CREATE TABLE TIPO_TARJETA_VIDEO_R_AMH_S1(
    TIPO_TARJETA_VIDEO_ID    NUMBER(5, 0)     NOT NULL,
    CLAVE                    VARCHAR2(40)     NOT NULL,
    DESCRIPCION              VARCHAR2(400)    NOT NULL,
    CONSTRAINT TIPO_TARJETA_VIDEO_PK PRIMARY KEY (TIPO_TARJETA_VIDEO_ID)
)
;


-- 
-- TABLE: HISTORICO_STATUS_LAPTOP_F2_AMH_S1 
--

ALTER TABLE HISTORICO_STATUS_LAPTOP_F2_AMH_S1 ADD CONSTRAINT HISTORICO_STATUS_LAPTOP_ID_FK 
    FOREIGN KEY (LAPTOP_ID)
    REFERENCES LAPTOP_INVENTARIO_F2_AMH_S1(LAPTOP_ID)
;

ALTER TABLE HISTORICO_STATUS_LAPTOP_F2_AMH_S1 ADD CONSTRAINT HISTORICO_STATUS_STATUS_LAPTOP_ID_FK
    FOREIGN KEY (STATUS_LAPTOP_ID)
    REFERENCES STATUS_LAPTOP_F2_AMH_S1(STATUS_LAPTOP_ID)
;


-- 
-- TABLE: LAPTOP_F2_AMH_S1 
--

ALTER TABLE LAPTOP_F2_AMH_S1 ADD CONSTRAINT LAPTOP_TIPO_PROCESADOR_ID_FK
    FOREIGN KEY (TIPO_PROCESADOR_ID)
    REFERENCES TIPO_PROCESADOR_R_AMH_S1(TIPO_PROCESADOR_ID)
;

ALTER TABLE LAPTOP_F2_AMH_S1 ADD CONSTRAINT LAPTOP_TIPO_TARJETA_VIDEO_ID_FK
    FOREIGN KEY (TIPO_TARJETA_VIDEO_ID)
    REFERENCES TIPO_TARJETA_VIDEO_R_AMH_S1(TIPO_TARJETA_VIDEO_ID)
;

ALTER TABLE LAPTOP_F2_AMH_S1 ADD CONSTRAINT LAPTOP_TIPO_ALMACENAMIENTO_ID_FK 
    FOREIGN KEY (TIPO_ALMACENAMIENTO_ID)
    REFERENCES TIPO_ALMACENAMIENTO_R_AMH_S1(TIPO_ALMACENAMIENTO_ID)
;

ALTER TABLE LAPTOP_F2_AMH_S1 ADD CONSTRAINT LAPTOP_TIPO_MONITOR_ID_FK
    FOREIGN KEY (TIPO_MONITOR_ID)
    REFERENCES TIPO_MONITOR_R_AMH_S1(TIPO_MONITOR_ID)
;


-- 
-- TABLE: LAPTOP_INVENTARIO_F2_AMH_S1 
--

ALTER TABLE LAPTOP_INVENTARIO_F2_AMH_S1 ADD CONSTRAINT LAPTOP_INVENTARIO_STATUS_LAPTOP_ID_FK 
    FOREIGN KEY (STATUS_LAPTOP_ID)
    REFERENCES STATUS_LAPTOP_F2_AMH_S1(STATUS_LAPTOP_ID)
;


-- 
-- TABLE: SERVICIO_LAPTOP_F1_AMH_S1 
--

ALTER TABLE SERVICIO_LAPTOP_F1_AMH_S1 ADD CONSTRAINT SERVICIO_LAPTOP_SUCURSAL_ID_FK
    FOREIGN KEY (SUCURSAL_ID)
    REFERENCES SUCURSAL_TALLER_F1_AMH_S1(SUCURSAL_ID)
;


-- 
-- TABLE: SUCURSAL_TALLER_F1_AMH_S1 
--

ALTER TABLE SUCURSAL_TALLER_F1_AMH_S1 ADD CONSTRAINT SUCURSAL_TALLER_SUCURSAL_ID_FK 
    FOREIGN KEY (SUCURSAL_ID)
    REFERENCES SUCURSAL_F1_AMH_S1(SUCURSAL_ID)
;


-- 
-- TABLE: SUCURSAL_VENTA_F1_AMH_S1 
--

ALTER TABLE SUCURSAL_VENTA_F1_AMH_S1 ADD CONSTRAINT SUCURSAL_VENTA_SUCURSAL_ID_FK 
    FOREIGN KEY (SUCURSAL_ID)
    REFERENCES SUCURSAL_F1_AMH_S1(SUCURSAL_ID)
;


