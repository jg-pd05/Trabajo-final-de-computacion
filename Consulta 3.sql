/* pregunta 3: Es de interes observar el nombre, el ranking, los puntos,
la estatura y la edadde los 15 jugadores con mas matches ganados*/

SELECT 
count (matches.winner_id) as "Partidos Ganados", 
matches.winner_name as Nombre,
matches.winner_ht as Estatura,
matches.winner_age as Edad,
top15.puntos,
top15.MejorRanking as "Mejor Ranking"
FROM (
SELECT MAX(points) as Puntos, MIN(rank) as MejorRanking, player 
FROM rankings 
WHERE points IS NOT NULL 
GROUP BY rankings.player
ORDER by points DESC) as top15
JOIN
matches on matches.winner_id = top15.player
GROUP by matches.winner_name
ORDER by "Partidos Ganados" desc 
LIMIT 15;


-- Subquery 

SELECT MAX(points) as puntos, MIN(rank) as MejorRanking, player 
FROM rankings 
WHERE points IS NOT NULL 
GROUP BY rankings.player
ORDER by points DESC;


