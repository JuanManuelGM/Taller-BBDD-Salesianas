-- ------------------------------------------------ -------
-- AUTOR : NTTDATA CENTERS - SEVILLA     
-- DESCRIPCIÓN : JAVA - JDBC - MYSQL - PANDEMIA
-- RESPONSABLE : SALESIANAS Mª AUXILIADORA
-- ------------------------------------------------ -------


--Creación de tabla Centro_Vacunación--

CREATE TABLE CENTRO_VACUNACION(

ID_CENTRO VARCHAR (11) NOT NULL,
ID_CIUDAD INT ,
NOMBRE VARCHAR (50),
DIRECCION VARCHAR (50),
AFORO INT ,
PRIMARY KEY (ID_CENTRO),
FOREIGN KEY (ID_CIUDAD) REFERENCES CIUDAD(ID_CIUDAD)

);
