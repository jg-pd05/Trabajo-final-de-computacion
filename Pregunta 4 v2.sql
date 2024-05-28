--Pregunta 4: Se requiere observar si los 5 mejores jugadores de cada superficie son los mismos 

--idea 1

/* SELECT matches.surface, count(matches.winner_id) as X, matches.winner_id
FROM matches 
WHERE winner_id > 0 and surface is not NULL and surface = 'Hard'
group by matches.surface, matches.winner_id
ORDER by X DESC 
LIMIT 5 */

/* En base a la consulta que se encuentra un poco antes de este texto se creo las demas para las otras superficies, posterior
a eso se unio cada una de las consultas y se creo un join para traer la informacion restante acerca de los tenistas
Ventaja: Usa clausulas mas sencillas ; Las consultas unidas son sencillas
Desventajas: Debido a como se comportan los campos no es posible ordenar los puntos de mayor a menor ; Su sintaxis es extensa */

SELECT players.name_first as Nombre, players.name_last as Apellido, subquery.total_wins as "Partidos ganados", subquery.surface as Superficie
FROM (
    SELECT surface, total_wins, winner_id
    FROM (
    SELECT m.surface, count(m.winner_id) as total_wins, m.winner_id
    FROM matches m
    WHERE m.winner_id > 0 and m.surface is not NULL and m.surface = 'Carpet'
    GROUP BY m.surface, m.winner_id
    ORDER BY total_wins DESC 
    LIMIT 5)
UNION
SELECT surface, total_wins, winner_id
FROM (
    SELECT m.surface, count(m.winner_id) as total_wins, m.winner_id
    FROM matches m
    WHERE m.winner_id > 0 and m.surface is not NULL and m.surface = 'Hard'
    GROUP BY m.surface, m.winner_id
    ORDER BY total_wins DESC 
    LIMIT 5)
UNION
SELECT surface, total_wins, winner_id
FROM (
    SELECT m.surface, count(m.winner_id) as total_wins, m.winner_id
    FROM matches m
    WHERE m.winner_id > 0 and m.surface is not NULL and m.surface = 'Grass'
    GROUP BY m.surface, m.winner_id
    ORDER BY total_wins DESC 
    LIMIT 5)
UNION
SELECT surface, total_wins, winner_id
FROM (
    SELECT m.surface, count(m.winner_id) as total_wins, m.winner_id
    FROM matches m
    WHERE m.winner_id > 0 and m.surface is not NULL and m.surface = 'Clay'
    GROUP BY m.surface, m.winner_id
    ORDER BY total_wins DESC 
    LIMIT 5) 
	) as subquery
	JOIN
	players on players.player_id = subquery.winner_id
	ORDER by Superficie ASC;
	




-----------------------------------------------------------------------------------------

--idea 2

/* En este caso tambien se usa como base la misma consulta que se utilizo para la idea 1, sin embargo aqui se utiliza la funcion
row_number con el proposito de numerar los registros corespondientes a la superficie, condicionado a que esa numeracion dependera del 
orden del conteo de los winner_id, que en este caso se toma para saber los partidos ganados por uno de los tenistas. Finalmente se crea 
un join para traer la informacion restante del tenista
Ventajas: Sintaxis mas corta; Mayor rendimiento; Mayor orden
Desventajas: Hace falta un mayor entendimiento de las particaciones en sql */

SELECT NT.Superficie, NT.top, players.name_first as Nombre, players.name_last as Apellido
FROM (
SELECT winner_id, surface as Superficie,
row_number () OVER ( PARTITION BY surface ORDER by count (winner_id) DESC ) top
FROM matches 
WHERE winner_id > 0 and surface is not NULL
GROUP by surface, winner_id ) as NT
JOIN 
players on players.player_id = NT.winner_id
WHERE top <= 5
ORDER by Superficie, top ASC ; 



















