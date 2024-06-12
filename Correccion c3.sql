----------- Correccion pregunta 3 del cuestionario (where dentro la subconsulta) 

SELECT m.winner_name AS Nombre, s.Rango AS "Mayor Rango",
       CAST(s.Puntos AS INT) AS Puntos, 
       CAST(winner_ht AS INT) AS "Estatura(cm)",
	   CAST(winner_age AS INT) AS Edad, 
	   COUNT(winner_id) AS "Partidos Ganados"
FROM (
        SELECT MIN(rank) AS Rango, player, SUM(points) as Puntos FROM rankings
        GROUP BY player
        ORDER BY Puntos DESC) s
JOIN matches m ON m.winner_id = s.player
WHERE Puntos IS NOT NULL
GROUP BY Nombre
ORDER BY "Partidos Ganados" DESC
LIMIT 15 
