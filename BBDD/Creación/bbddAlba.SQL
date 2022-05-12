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
	
	