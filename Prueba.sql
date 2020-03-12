-- Generado por Oracle SQL Developer Data Modeler 19.4.0.350.1424
--   en:        2020-03-12 15:49:24 ART
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



CREATE TABLE alternativa (
    idalt                  INTEGER NOT NULL,
    decripcion             VARCHAR2(100 CHAR),
    valorlogicocorreccion  CHAR(1),
    porcentajeaportado     FLOAT(2),
    pregunta_idpregunta    INTEGER NOT NULL
);

COMMENT ON COLUMN alternativa.valorlogicocorreccion IS
    '1 = correcta
0 = incorrecta';

ALTER TABLE alternativa ADD CONSTRAINT alternativa_pk PRIMARY KEY ( idalt );

CREATE TABLE curso (
    idcurso          INTEGER NOT NULL,
    programa         VARCHAR2(100 CHAR) NOT NULL,
    cantidadalumnos  INTEGER
);

ALTER TABLE curso ADD CONSTRAINT curso_pk PRIMARY KEY ( idcurso );

CREATE TABLE estudiante (
    idestu         INTEGER NOT NULL,
    nombre         VARCHAR2(100 CHAR),
    edad           INTEGER,
    curso_idcurso  INTEGER NOT NULL
);

ALTER TABLE estudiante ADD CONSTRAINT estudiante_pk PRIMARY KEY ( idestu );

CREATE TABLE pregunta (
    idpregunta   INTEGER NOT NULL,
    enunciado    VARCHAR2(100 CHAR),
    puntaje      FLOAT(2),
    test_idtest  INTEGER NOT NULL
);

ALTER TABLE pregunta ADD CONSTRAINT pregunta_pk PRIMARY KEY ( idpregunta );

CREATE TABLE relation_5 (
    curso_idcurso  INTEGER NOT NULL,
    test_idtest    INTEGER NOT NULL
);

ALTER TABLE relation_5 ADD CONSTRAINT relation_5_pk PRIMARY KEY ( curso_idcurso,
                                                                  test_idtest );

CREATE TABLE relstualt (
    estudiante_idestudiante    INTEGER NOT NULL,
    alternativa_idalternativa  INTEGER NOT NULL
);

ALTER TABLE relstualt ADD CONSTRAINT relation_8_pk PRIMARY KEY ( estudiante_idestudiante,
                                                                 alternativa_idalternativa );

CREATE TABLE test (
    idtest           INTEGER NOT NULL,
    nombre           VARCHAR2(100 CHAR),
    descripcion      VARCHAR2(100 CHAR),
    programa         VARCHAR2(100 CHAR),
    unidad           VARCHAR2(100 CHAR),
    autor            VARCHAR2(100 CHAR),
    fechadecreacion  DATE
);

ALTER TABLE test ADD CONSTRAINT test_pk PRIMARY KEY ( idtest );

ALTER TABLE alternativa
    ADD CONSTRAINT alternativa_pregunta_fk FOREIGN KEY ( pregunta_idpregunta )
        REFERENCES pregunta ( idpregunta );

ALTER TABLE estudiante
    ADD CONSTRAINT estudiante_curso_fk FOREIGN KEY ( curso_idcurso )
        REFERENCES curso ( idcurso );

ALTER TABLE pregunta
    ADD CONSTRAINT pregunta_test_fk FOREIGN KEY ( test_idtest )
        REFERENCES test ( idtest );

ALTER TABLE relation_5
    ADD CONSTRAINT relation_5_curso_fk FOREIGN KEY ( curso_idcurso )
        REFERENCES curso ( idcurso );

ALTER TABLE relation_5
    ADD CONSTRAINT relation_5_test_fk FOREIGN KEY ( test_idtest )
        REFERENCES test ( idtest );

ALTER TABLE relstualt
    ADD CONSTRAINT relation_8_alternativa_fk FOREIGN KEY ( alternativa_idalternativa )
        REFERENCES alternativa ( idalt );

ALTER TABLE relstualt
    ADD CONSTRAINT relation_8_estudiante_fk FOREIGN KEY ( estudiante_idestudiante )
        REFERENCES estudiante ( idestu );



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             7
-- CREATE INDEX                             0
-- ALTER TABLE                             14
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