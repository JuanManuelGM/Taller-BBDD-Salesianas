-- ------------------------------------------------ -------
-- AUTOR : NTTDATA CENTERS - SEVILLA     
-- DESCRIPCIÓN : JAVA - JDBC - MYSQL - PANDEMIA
-- RESPONSABLE : SALESIANAS Mª AUXILIADORA
-- ------------------------------------------------ -------


--Creación de tabla Distribuidor_Vacuna--

CREATE TABLE DISTRIBUIDOR_VACUNA(

ID_VACUNA VARCHAR (11) NOT NULL,
ID_CENTRO VARCHAR (11),
NOMBRE VARCHAR (30),
PRIMARY KEY (ID_VACUNA, ID_CENTRO),
FOREIGN KEY (ID_CENTRO) REFERENCES CENTRO_VACUNACION(ID_CENTRO)

);


