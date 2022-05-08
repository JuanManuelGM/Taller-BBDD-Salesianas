--Ante la necesidad de tomar medidas de control de la pandemia, se pretende crear un procedimiento--
--que localice y establezca un confinamiento a las ciudades que superen actualmente un número de--
--contagios determinado--

CREATE OR REPLACE PROCEDURE homeArrest(limitInfections NUMBER)
IS
    CURSOR cityCurrentInfections IS  SELECT NOMBRE, CONTAGIOS_TOTALES FROM CIUDAD INNER JOIN contagios ON CIUDAD.ID_CIUDAD=CONTAGIOS.ID_CIUDAD ORDER BY FECHA DESC FETCH FIRST 5 ROWS ONLY ;
    cityName VARCHAR(30);
BEGIN
FOR cityCurrentInfection IN cityCurrentInfections
LOOP 
dbms_output.put_line(cityCurrentInfection.nombre);
  IF cityCurrentInfection.contagios_totales>limitInfections THEN
  cityName:=cityCurrentInfection.nombre;
  UPDATE CIUDAD SET NOMBRE=cityName || ' - Confinada' WHERE NOMBRE=cityName;
  END IF;
END LOOP;
END homeArrest;

--Se realiza la prueba para confinar las ciudades con un número de contagios superior a 5000, en este caso, Sevilla--
EXECUTE HOMEARREST(5000);