-- Se requiere observar el nombre, la edad, la mano habil y los puntos de los mejores 20 jugadores del ranking

SELECT r.points AS "Puntos",
       m.winner_id AS "ID Jugador",
       REPLACE(REPLACE(m.winner_hand , "R", "Diestro"), "L", "Zurdo") AS "Mano Hábil",
	    m.winner_name AS "Nombre del Jugador",
       MAX(ROUND(m.winner_age, 0)) AS "Edad del Jugador"
FROM (
    SELECT player, MAX(points) AS points
    FROM rankings
    GROUP BY player
    ORDER BY points DESC
) AS r
JOIN Matches AS m ON r.player = m.winner_id
GROUP BY m.winner_id, m.winner_hand, m.winner_name
ORDER BY r.points DESC
LIMIT 20;