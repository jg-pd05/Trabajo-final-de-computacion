-- Se requiere observar la nacionaliad de los 5 paises con mas matches ganados y el promedio de edad

SELECT 
    players.País_de_Origen AS Nacionalidad,
    COUNT(matches.winner_id) AS "Matches Ganados",
    ROUND(AVG( matches.winner_age),2 )AS "Promedio Edad"
FROM 
    Matches
JOIN 
    players ON Matches.winner_id = players.player_id
GROUP BY 
    players.País_de_Origen
ORDER BY 
    "Matches Ganados" DESC
LIMIT 5;