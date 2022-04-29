---------------------------------------------------------
-- AUTOR       : NTTDATA CENTERS - SEVILLA     
-- DESCRIPCIÓN : JAVA - JDBC - MYSQL - PANDEMIA
-- RESPONSABLE : SALESIANAS Mª AUXILIADORA
---------------------------------------------------------

-- Creación de tabla Centro de Vacunación.
CREATE TABLE PANDEMIA.CENTRO_VACUNACION (ID_CENTRO INT (6) PRIMARY KEY AUTO_INCREMENT,ID_CIUDAD INT (6), NOMBRE VARCHAR (50), DIRECCION VARCHAR (50), AFORO INT (6),FOREIGN KEY (ID_CIUDAD) REFERENCES PANDEMIA.CIUDAD(ID_CIUDAD));

-- Insercción de datos de Centro de Vacunación.

INSERT INTO CENTRO_VACUNACION(ID_CIUDAD, NOMBRE, DIRECCION, AFORO) VALUES (1, "Hospital Ramón y Cajal", "Plaza Conde de Suchil", 3000);
INSERT INTO CENTRO_VACUNACION(ID_CIUDAD, NOMBRE, DIRECCION, AFORO) VALUES (2, "Complejo Deportivo Campolongo", "Rúa Iglesias Vilrelle, 32", 2000);
INSERT INTO CENTRO_VACUNACION(ID_CIUDAD, NOMBRE, DIRECCION, AFORO) VALUES (3, "Hospital Universitario Torrevieja", "Carretera CV 95", 2000);
INSERT INTO CENTRO_VACUNACION(ID_CIUDAD, NOMBRE, DIRECCION, AFORO) VALUES (4, "Estadio Olímpico", "Isla de la Cartuja", 5000);
INSERT INTO CENTRO_VACUNACION(ID_CIUDAD, NOMBRE, DIRECCION, AFORO) VALUES (5, "Hospital María Zambrano", "Explanada de la Estación 12", 2500);
