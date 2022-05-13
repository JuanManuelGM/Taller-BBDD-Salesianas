---------------------------------------------------------
-- AUTOR       : NTTDATA CENTERS - SEVILLA     
-- DESCRIPCIÓN : JAVA - JDBC - MYSQL - PANDEMIA
-- RESPONSABLE : SALESIANAS Mª AUXILIADORA
---------------------------------------------------------

--Muestra la suma de las vacunaciones totales de un año de cada ciudad, siempre que esta suma supere las 2200, y las ordena de mayor a menor--
SELECT ID_CIUDAD, SUM(VACUNACIONES_TOTALES) VACUNAS  FROM VACUNACIONES 
	WHERE YEAR(FECHA)=2020 
	GROUP BY ID_CIUDAD HAVING VACUNAS>=2200  
	ORDER BY VACUNAS DESC;
	
--Cuenta el número de ciudades que, en el último mes, superan los 5000 contagios--
SELECT COUNT(CONTAGIOS_TOTALES) AS CONTAGIOS FROM CONTAGIOS 
	WHERE CONTAGIOS_TOTALES>=4500 
	AND FECHA=(SELECT MAX(FECHA) FROM CONTAGIOS);

--Muestra la media de camas ocupadas en los últimos dos meses de todas las ciudades,junto con su id, ordenadas ascendentemente según la media.
SELECT ID_CIUDAD, AVG(CAMAS_OCUPADAS) AS MEDIA FROM HOSPITALIZACIONES 
	WHERE FECHA >= DATE_ADD((SELECT MAX(FECHA) FROM HOSPITALIZACIONES), INTERVAL -1 MONTH) 
	GROUP BY ID_CIUDAD;