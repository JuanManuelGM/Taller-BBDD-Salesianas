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


-------------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE PROCEDURE CVPR_CONTAGIOS  IS
    --declarar cursos
    CURSOR C_INFECTADOS (
        MEDIA IN CONTAGIOS.CONTAGIOS_TOTALES%TYPE
    ) IS
    SELECT
        CI.NOMBRE,
        SUM(CO.CONTAGIOS_TOTALES) TOTAL
    FROM
        CIUDAD    CI,
        CONTAGIOS CO
    WHERE
        CI.ID_CIUDAD = CO.ID_CIUDAD
    GROUP BY
        CI.NOMBRE
    HAVING
        SUM(CO.CONTAGIOS_TOTALES) > MEDIA;
        
        
    --Declarar tipo de registro
    V_INF_REGISTRO C_INFECTADOS%ROWTYPE;
    --VARIABLE MEDIA
    V_MEDIA        CONTAGIOS.CONTAGIOS_TOTALES%TYPE;
    --VARIABLE SALIDA
    P_OUT_MENSAJE VARCHAR2(4000);
    
/****************************************************************************************************************
Nombre: CVPR_CONTAGIOS
Autor: Christian Lob�n Sevilla
Fecha de creaci�n: 07/05/2022
Par�metros de entrada:
Salida:
Comentarios:
    
Modificaciones:
******************************************************************************************************************/

BEGIN
    SELECT
        AVG(CONTAGIOS_TOTALES)
    INTO V_MEDIA
    FROM
        CONTAGIOS;
    P_OUT_MENSAJE:= 'Estas CIUDADES superan la media de CONTAGIOS:' || chr(13);

    OPEN C_INFECTADOS(V_MEDIA);
    --BUCLE
    LOOP
        BEGIN
            --VALORES DEL CURSOR
            FETCH C_INFECTADOS INTO V_INF_REGISTRO;
            EXIT WHEN C_INFECTADOS%NOTFOUND;
            P_OUT_MENSAJE := P_OUT_MENSAJE || V_INF_REGISTRO.NOMBRE || ': CON UN TOTAL DE CONTAGIOS2: ' || V_INF_REGISTRO.TOTAL || chr(13);
        EXCEPTION
            WHEN OTHERS THEN
                NULL;
        END;
    END LOOP;

    CLOSE C_INFECTADOS;
    INSERT INTO LOG VALUES (P_OUT_MENSAJE);
EXCEPTION
    WHEN OTHERS THEN
        NULL;
END CVPR_CONTAGIOS;
/

-------------------------------------------------------------------------------------------------------------------------

---------------------------------------
--Autor       : Salesianas de Nervión
--Descripción : Script 1 PL/SQL
--Responsable : Alba Parrón Pérez
---------------------------------------

--Dado el alto número de camas ocupadas en los hospitales, se requiere un
--procedimiento que analice las camas ocupadas y avise del nivel de alerta, según las hospitalizaciones producidas en cada 
--hospital de cada ciudad


CREATE OR REPLACE PROCEDURE alertanivel IS
CURSOR hciudad IS
    SELECT
        ciu.nombre,
        hos.camas_ocupadas
    FROM
        ciudad            ciu,
        hospitalizaciones hos
    WHERE
        ciu.id_ciudad = hos.id_ciudad (+)
    ORDER BY
        hos.fecha;

    alerta       hciudad%rowtype;
    nombreciudad VARCHAR2(30);
BEGIN
    OPEN hciudad;
    LOOP
        FETCH hciudad INTO alerta;
        EXIT WHEN hciudad%notfound;
        IF alerta.camas_ocupadas >= 200 THEN
            nombreciudad := alerta.nombre;
            UPDATE ciudad
            SET
                nombre = nombreciudad || ' - Nivel Alerta 2 '
            WHERE
                nombre = nombreciudad;

        END IF;

    END LOOP;

    CLOSE hciudad;
END alertanivel;
/
EXECUTE alertanivel;
SELECT NOMBRE, CAMAS_OCUPADAS FROM CIUDAD INNER JOIN HOSPITALIZACIONES ON CIUDAD.ID_CIUDAD = HOSPITALIZACIONES.ID_CIUDAD;
	
	









