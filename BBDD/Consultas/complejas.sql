---------------------------------------------------------
-- AUTOR       : NTTDATA CENTERS - SEVILLA     
-- DESCRIPCIÓN : JAVA - JDBC - MYSQL - PANDEMIA
-- RESPONSABLE : SALESIANAS Mª AUXILIADORA
---------------------------------------------------------

--Muestra los contagios totales a lo largo de un año, junto a la población, nombre y fecha de los registros de cada ciudad de una provincia específica--
SELECT CIUDAD.NOMBRE CIUDAD, CIUDAD.POBLACION POBLACION, CONTAGIOS.CONTAGIOS_TOTALES, CONTAGIOS.FECHA 
	FROM CIUDAD 
	LEFT JOIN CONTAGIOS ON CIUDAD.ID_CIUDAD = CONTAGIOS.ID_CIUDAD 
	WHERE YEAR(FECHA)=2020 AND PROVINCIA LIKE 'AndalucÃ­a';
	
--Muestra el recuento total de vacunados (en número y en porcentaje), con respecto a la población desde el principio de la pandemia hasta la actualidad de todas las ciudades de una provincia específica.
SELECT CIUDAD.NOMBRE AS NOMBRE, CIUDAD.POBLACION AS POBLACION, SUM(VACUNACIONES.VACUNACIONES_TOTALES) AS VACUNACIONES, (SUM(VACUNACIONES.VACUNACIONES_TOTALES)*100)/CIUDAD.POBLACION AS PORCENTAJE  
	FROM VACUNACIONES RIGHT JOIN CIUDAD ON VACUNACIONES.ID_CIUDAD=CIUDAD.ID_CIUDAD 
	WHERE CIUDAD.PROVINCIA LIKE 'AndalucÃ­a' 
	GROUP BY CIUDAD.NOMBRE, CIUDAD.POBLACION;
	
-- Muestra, de cada centro de vacunacion, la direccion, el nombre, el aforo, la provincia a la que pertenecen y los nombres de las vacunas que reciben
SELECT CIUDAD.PROVINCIA AS PROVINCIA, CENTRO_VACUNACION.NOMBRE AS CENTRO, CENTRO_VACUNACION.DIRECCION AS DIRECCION, CENTRO_VACUNACION.AFORO AS AFORO, DISTRIBUIDOR_VACUNA.NOMBRE AS VACUNA 
	FROM CIUDAD LEFT JOIN CENTRO_VACUNACION ON CIUDAD.ID_CIUDAD=CENTRO_VACUNACION.ID_CIUDAD 
	LEFT JOIN DISTRIBUIDOR_VACUNA ON CENTRO_VACUNACION.ID_CENTRO=DISTRIBUIDOR_VACUNA.ID_CENTRO ORDER BY PROVINCIA;
	
	
	
	------------------------------------------------------------------------------------------------
	
	-- LAS CONSULTAS DE ABAJO QUIERO HACERLAS PERO TODAVIA NO SE COMO --
	

--Muestra, de las ciudades de una provincia, la poblacion, los contagios totales y las capas ocupadas en un mes--
	
--Muestra la evolución de vacunados y contagiados en una ciudad a lo largo de un año de una ciudad--

--Muestra una comparativa de datos de contagiados y vacunados de una ciudad con un mes respecto al anterior (incluyendo cuanto han subido o bajado los vacunados y contagiados)--ç

--Control de contagiados con respecto al mes anterior en una ciudad--