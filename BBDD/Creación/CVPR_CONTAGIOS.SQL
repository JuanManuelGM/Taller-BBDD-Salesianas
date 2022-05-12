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
