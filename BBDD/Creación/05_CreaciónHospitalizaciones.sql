-- ------------------------------------------------ -------
-- AUTOR : NTTDATA CENTERS - SEVILLA     
-- DESCRIPCIÓN : JAVA - JDBC - MYSQL - PANDEMIA
-- RESPONSABLE : SALESIANAS Mª AUXILIADORA
-- ------------------------------------------------ -------


--Creación de tabla Hospitalizacioness--


CREATE TABLE HOSPITALIZACIONES(

ID_RECUENTO_HOS VARCHAR (11) NOT NULL,
CAMAS_OCUPADAS INT,
FECHA DATE,
ID_CIUDAD INT,
PRIMARY KEY (ID_RECUENTO_HOS, ID_CIUDAD),
FOREIGN KEY (ID_CIUDAD) REFERENCES CIUDAD(ID_CIUDAD)

);