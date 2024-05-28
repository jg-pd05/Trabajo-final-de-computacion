/* Pregunta 5: Cuantos partidos han disputados los 15 jugadores con mayor puntaje
en los diferentes niveles de torneos */

--Primer subquery (top 15 de los tenistas con mas puntos)

SELECT max (rankings.points) as Puntos, min (rankings.rank) as PosicionActual, rankings.player as Tenista
FROM rankings
WHERE points is not NULL and rank <= 15
GROUP by rank
ORDER by puntos DESC;

--Consulta final (Partidos jugados por el top 15 de los tenistas con mas puntos en cada nivel de torneo)

SELECT players.name_first as Nombre, players.name_last as Apellido, TECN.Puntos, TECN.nivel, TECN.PartidosTotales as "Partidos Totales"
FROM (
SELECT count (matches.tourney_level) as PartidosTotales, 
matches.tourney_level as nivel,
top15.Tenista,
top15.Puntos
FROM (SELECT max (rankings.points) as Puntos, min (rankings.rank) as PosicionActual, rankings.player as Tenista
FROM rankings
WHERE points is not NULL and rank <= 15
GROUP by rank
ORDER by puntos DESC) as top15
JOIN
matches on matches.winner_id = top15.Tenista
GROUP by top15.Tenista, matches.tourney_level
) as TECN  /*TECN: Tenista en cada nivel*/
JOIN
players on players.player_id = TECN.Tenista
ORDER by Puntos DESC;

 /* SELECT count (matches.tourney_level) as cuenta,
matches.tourney_level as nivel
FROM matches
GROUP by nivel
HAVING cuenta > 100 and cuenta <> 31717 and cuenta <> 18634; */




