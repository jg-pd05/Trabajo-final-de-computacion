
------------------------- Puntos de los jugadores de españa

SELECT winner_name, SUM(winner_rank_points) AS Puntos FROM TODO4
WHERE winner_ioc = "ESP"
GROUP BY winner_name
ORDER BY Puntos DESC

---------------  Partidos ganados de los jugadores en españa

SELECT winner_name, SUM(PG) AS Partidos FROM TODO4
WHERE winner_ioc = "ESP"
GROUP BY winner_name 
ORDER BY Partidos DESC

------------------- Máximo de partidos ganados en un torneo por Rafael Nadal 

SELECT winner_name, tourney_id, tourney_name, SUM(PG) as PG, tourney_level FROM TODO4
WHERE winner_name = "Rafael Nadal"
GROUP BY tourney_name, tourney_id
ORDER BY PG DESC



