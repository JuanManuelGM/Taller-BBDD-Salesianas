-- ------------------------------------------------ -------
-- AUTOR : NTTDATA CENTERS - SEVILLA     
-- DESCRIPCIÓN : JAVA - JDBC - MYSQL - PANDEMIA
-- RESPONSABLE : SALESIANAS Mª AUXILIADORA
-- ------------------------------------------------ -------


--Creación de tabla Hospitalizacioness--


CREATE TABLE VACUNACIONES(

ID_RECUENTO_VAC VARCHAR (11) NOT NULL,
VACUNACIONES_TOTALES INT,
FECHA DATE,
ID_CIUDAD INT,
PRIMARY KEY (ID_RECUENTO_VAC, ID_CIUDAD),
FOREIGN KEY (ID_CIUDAD) REFERENCES CIUDAD(ID_CIUDAD)

);
