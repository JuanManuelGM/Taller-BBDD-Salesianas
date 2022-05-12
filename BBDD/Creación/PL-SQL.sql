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

-------------------------------------------------------------------------------------------------------------------------

--Con la intención de facilitar el control de la evolución de la pandemia, se crea un procedimiento
--que, dadas dos fechas y un ID de una ciudad, muestra los datos de nuevos contagios, junto con el procentaje de poblacion
--infectada del mes

create or replace PROCEDURE estudio (inicio DATE, fin DATE, idCiudad NUMBER)
IS
    CURSOR cityInfections IS
        SELECT CIUDAD.NOMBRE, CONTAGIOS.contagios_totales, CONTAGIOS.fecha
        FROM CIUDAD LEFT JOIN CONTAGIOS ON CIUDAD.ID_CIUDAD = CONTAGIOS.ID_CIUDAD
        WHERE CIUDAD.ID_CIUDAD=idCiudad AND CONTAGIOS.FECHA BETWEEN inicio AND fin;

    nombreCiudad VARCHAR(40);    
    contiene BOOLEAN := FALSE;  

    habitantes NUMBER(38);
    porcentaje DECIMAL(38,2);

BEGIN    

   SELECT NOMBRE INTO nombreCiudad FROM CIUDAD
   WHERE ID_CIUDAD=idCiudad;  

dbms_output.put_line('------Estudio de la ciudad de: ' || nombreCiudad || '------');    

FOR mes IN cityInfections
LOOP                        
    dbms_output.put_line(habitantes);  
    SELECT POBLACION INTO habitantes FROM CIUDAD WHERE ID_CIUDAD=idCiudad;    
   
    porcentaje := (mes.contagios_totales*100)/habitantes;
   
    dbms_output.put_line( '--------------------------------------------------');
    dbms_output.put_line( 'FECHA: ' || mes.fecha);    
    dbms_output.put_line( 'Contagios totales: ' || mes.contagios_totales);  
     
    IF porcentaje<1
    THEN
        dbms_output.put_line('Porcentaje de población nueva infectada: 0' || porcentaje || '%');
    ELSE
        dbms_output.put_line('Porcentaje de población nueva infectada: ' || porcentaje || '%');
    END IF;
     
    dbms_output.put_line( '--------------------------------------------------');

END LOOP;

END estudio;


--Comprobamos los contagiados de la ciudad de ID 3
execute estudio('25-08-2020', '25-10-2020', 3);
