/*definicion de los torneos empleados en el dataframe en R */
select tourney_name, tourney_level, surface,
row_number () OVER ( PARTITION BY surface ORDER by count (surface) DESC ) as conteo
FROM Tourney
WHERE tourney_level in ("M", "G") 
GROUP by tourney_name

/* Creacion del dataframe empleado en R */
CREATE TABLE TODO4 AS SELECT m.winner_id,  m.w_ace,   m.w_df, 
    m.w_svpt,  m.w_bpFaced,  m.w_bpSaved,  m.winner_rank_points, 
    m.winner_ht,  m.winner_hand,  m.winner_age,
	count (m.winner_id) as PG,
    m.winner_name, m.winner_ioc, 
    t.tourney_id,  t.surface,  t.tourney_level,  t.tourney_name 
	FROM Matches m
	JOIN Tourney t ON t.tourney_id = m.tourney_id
	JOIN Players P ON p.player_id = m.winner_id
	WHERE tourney_level IN("M", "G") AND tourney_name IN('US Open',
    'Miami Masters',
    'Indian Wells Masters',
    'Cincinnati Masters',
    'Canada Masters',
    'Paris Masters',
    'Shanghai Masters',
    'Stuttgart Masters',
    'Wimbledon',
    'Roland Garros',
    'Rome Masters',
    'Monte Carlo Masters',
    'Madrid Masters',
    'Hamburg Masters')
	GROUP by t.tourney_id, m.winner_name;
	
