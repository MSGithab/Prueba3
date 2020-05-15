-- Generado por Oracle SQL Developer Data Modeler 19.4.0.350.1424
--   en:        2020-05-15 10:10:50 CLT
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



CREATE TABLE alternativas (
    id_alternativa           INTEGER NOT NULL,
    descripcion_alternativa  VARCHAR2(300),
    respuesta_correcta       CHAR(1),
    ponderacion_alternativa  FLOAT(2),
    preguntas_id_pregunta    INTEGER NOT NULL
);

ALTER TABLE alternativas ADD CONSTRAINT alternativas_pk PRIMARY KEY ( id_alternativa );

CREATE TABLE alumnos (
    rut             INTEGER NOT NULL,
    nombre_alumno   CHAR(50),
    promedio_notas  FLOAT(1),
    curso_id_curso  INTEGER NOT NULL
);

ALTER TABLE alumnos ADD CONSTRAINT alumnos_pk PRIMARY KEY ( rut );

CREATE TABLE curso (
    id_curso        INTEGER NOT NULL,
    nombre_curso    CHAR(50),
    numero_alumnos  INTEGER
);

ALTER TABLE curso ADD CONSTRAINT curso_pk PRIMARY KEY ( id_curso );

CREATE TABLE preguntas (
    id_pregunta         INTEGER NOT NULL,
    enunciado_pregunta  CHAR(300),
    puntos_pregunta     INTEGER,
    test_id_test        INTEGER NOT NULL
);

ALTER TABLE preguntas ADD CONSTRAINT preguntas_pk PRIMARY KEY ( id_pregunta );

CREATE TABLE test (
    id_test            INTEGER NOT NULL,
    nombre_test        CHAR(50),
    descripcion_test   CHAR(100),
    programa_estudios  VARCHAR2(100),
    unidad_programa    CHAR(50),
    autor              CHAR(50),
    fecha_test         DATE,
    curso_id_curso     INTEGER NOT NULL
);

ALTER TABLE test ADD CONSTRAINT test_pk PRIMARY KEY ( id_test );

ALTER TABLE alternativas
    ADD CONSTRAINT alternativas_preguntas_fk FOREIGN KEY ( preguntas_id_pregunta )
        REFERENCES preguntas ( id_pregunta );

ALTER TABLE alumnos
    ADD CONSTRAINT alumnos_curso_fk FOREIGN KEY ( curso_id_curso )
        REFERENCES curso ( id_curso );

ALTER TABLE preguntas
    ADD CONSTRAINT preguntas_test_fk FOREIGN KEY ( test_id_test )
        REFERENCES test ( id_test );

ALTER TABLE test
    ADD CONSTRAINT test_curso_fk FOREIGN KEY ( curso_id_curso )
        REFERENCES curso ( id_curso );



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             5
-- CREATE INDEX                             0
-- ALTER TABLE                              9
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
