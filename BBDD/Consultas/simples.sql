---------------------------------------------------------
-- AUTOR       : NTTDATA CENTERS - SEVILLA     
-- DESCRIPCIÓN : JAVA - JDBC - MYSQL - PANDEMIA
-- RESPONSABLE : SALESIANAS Mª AUXILIADORA
---------------------------------------------------------

-- Selecciona el nombre, la direccion y el aforo de los dos centros de vacunacion con mayor aforo
SELECT NOMBRE, DIRECCION, AFORO 
	FROM CENTRO_VACUNACION 
	ORDER BY AFORO DESC LIMIT 2;
	
-- Selecciona todos los datos de los hospitales cuyas hospitalizaciones 
--son mayor que 800 en la última fecha almacenada.
SELECT * FROM HOSPITALIZACIONES 
	WHERE CAMAS_OCUPADAS > 800 
	AND FECHA = (
		SELECT MAX(FECHA) 
		FROM HOSPITALIZACIONES);


--Selecciona el registro de vacunaciones de los últimos tres meses en una ciudad
SELECT ID_CIUDAD, FECHA, VACUNACIONES_TOTALES FROM VACUNACIONES 
	WHERE ID_CIUDAD=4 
	AND FECHA >= DATE_ADD((SELECT MAX(FECHA) FROM VACUNACIONES), INTERVAL -2 MONTH);
	
--Selecciona el máximo, mínimo y la media de contagios de una ciudad en un año:
SELECT ID_CIUDAD, MAX(CONTAGIOS_TOTALES) AS MAXIMO, MIN(CONTAGIOS_TOTALES) AS MINIMO, AVG(CONTAGIOS_TOTALES) AS MEDIA FROM CONTAGIOS 
	WHERE ID_CIUDAD=3 
	AND YEAR(FECHA)=2020;
	
--Muestra todos los datos del distribución de las vacunas que no se han especificado
SELECT * FROM DISTRIBUIDOR_VACUNA 
	WHERE NOMBRE NOT LIKE 'PFIZER' 
	AND NOMBRE NOT LIKE 'MODERNA';