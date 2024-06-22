-- En la siguiente consulta se tomaron los campos de interés para la investigación en la tabla matches

CREATE TABLE partidos_temporal AS SELECT tourney_id, tourney_name, surface, draw_size, 
										 tourney_level, tourney_date, match_num, winner_id, 
										 winner_seed, winner_entry, winner_name, winner_hand,
										 winner_ht, winner_ioc, winner_age, loser_id,
										 loser_seed, loser_entry, loser_name, loser_hand, 
										 loser_ht, loser_ioc, loser_age, score,
										 best_of, round, minutes, w_ace,
										 w_df, w_svpt, w_1stIn, w_1stWon,
							             w_2ndWon, w_SvGms, w_bpSaved, w_bpFaced,
										 l_ace, l_df, l_svpt, l_1stIn,
										 l_1stWon, l_2ndWon, l_SvGms, l_bpSaved, l_bpFaced, 
										 winner_rank, winner_rank_points, loser_rank, loser_rank_points
								FROM matches;

							
DROP TABLE matches;
ALTER TABLE partidos_temporal RENAME TO Matches;



-- Se cambiaron algunos de los datos de Real a Entero

CREATE TABLE temporal_partidos AS
SELECT
           tourney_id, tourney_name, surface, draw_size, tourney_level, 
		   CAST(tourney_date AS INTEGER) AS  tourney_date, match_num,
		   CAST(winner_id AS INTEGER) AS winner_id, winner_seed, winner_entry, winner_name,
		   winner_hand, CAST(winner_ht AS INTEGER) AS winner_ht, winner_ioc,
		   CAST(winner_age AS INTEGER) winner_age, 
		   CAST(loser_id AS INTEGER) AS loser_id, loser_seed, loser_entry,
		   loser_name, loser_hand, CAST(loser_ht AS INTEGER) AS loser_ht,
		   loser_ioc, CAST(loser_age AS INTEGER) AS loser_age, score, best_of,
		   round, minutes, w_ace, w_df, w_svpt, w_1stIn, w_1stWon, w_2ndWon, w_SvGms,
		   w_bpSaved, w_bpFaced, l_ace, l_df, l_svpt, l_1stIn, l_1stWon, l_2ndWon, l_SvGms, 
		   l_bpSaved, l_bpFaced, winner_rank, winner_rank_points, loser_rank, loser_rank_points
	FROM Matches;
	
DROP TABLE Matches;
ALTER TABLE temporal_partidos RENAME TO Matches;

--- En la siguiente consulta se llevan las fechas de Real a formato Date

UPDATE players
SET Fecha_de_Nacimiento = substr(Fecha_de_Nacimiento, 1, 4) || '-' || substr(Fecha_de_Nacimiento, 5, 2) || '-' || substr(Fecha_de_Nacimiento, 7, 2);
UPDATE Matches
SET tourney_date = substr(tourney_date, 1, 4) || '-' || substr(tourney_date, 5, 2) || '-' || substr(tourney_date, 7, 2);

--- En la siguiente consulta se crea una nueva entidad que tiene la informacion referente a los torneos.

CREATE TABLE Tourney AS SELECT tourney_id, tourney_name, surface, draw_size, 
										 tourney_level, tourney_date
										 from Matches;

--- En la siguiente consulta se elimina la informacion refente a los torneos de la tabla Matches.										 
	
CREATE TABLE partidos_temporal AS SELECT tourney_id, match_num, winner_id, 
										 winner_seed,winner_entry, winner_name, winner_hand,
										 winner_ht, winner_ioc, winner_age, loser_id,
										 loser_seed, loser_entry, loser_name, loser_hand, 
										 loser_ht, loser_ioc, loser_age, score,
										 best_of, round, minutes, w_ace,
										 w_df, w_svpt, w_1stIn, w_1stWon,
							             w_2ndWon, w_SvGms, w_bpSaved, w_bpFaced,
										 l_ace, l_df, l_svpt, l_1stIn,
										 l_1stWon, l_2ndWon, l_SvGms, l_bpSaved, l_bpFaced, 
										 winner_rank, winner_rank_points, loser_rank, loser_rank_points
								FROM Matches;					
DROP TABLE Matches;
ALTER TABLE partidos_temporal RENAME TO Matches;

--- En la siguiente consulta se elimina la informacion refente de la entidad ranking antes del año 2000.

 DELETE FROM rankings
WHERE rankings.ranking_date < 20000000;

 DELETE FROM rankings 
 WHERE rankings.rank > 10;

--- En la siguiente consulta se llevan las fechas de Real a formato Date

 UPDATE rankings
SET ranking_date = substr(ranking_date, 1, 4) || '-' || substr(ranking_date, 5, 2) || '-' || substr(ranking_date, 7, 2); 

--- En la siguiente consulta se llevan algunos campos de real a entero.
 
 CREATE TABLE temporal_partidos AS
SELECT
  tourney_id, match_num, winner_id, CAST(winner_seed AS INTEGER) AS winner_seed, winner_entry, winner_name, winner_hand,
  winner_ht, winner_ioc, winner_age, loser_id, CAST(loser_seed AS INTEGER) AS loser_seed, loser_entry, loser_name,
  loser_hand, loser_ht, loser_ioc, loser_age, score, best_of, round, CAST(minutes AS INTEGER) AS minutes,
  CAST(w_ace AS INTEGER) AS w_ace, CAST(w_df AS INTEGER) AS w_df, CAST(w_svpt AS INTEGER) AS w_svpt,
  CAST(w_1stIn AS INTEGER) AS w_1stIn, CAST(w_1stWon AS INTEGER) AS w_1stWon, CAST(w_2ndWon AS INTEGER) AS w_2ndWon,
  CAST(w_SvGms AS INTEGER) AS w_SvGms, CAST(w_bpSaved AS INTEGER) AS w_bpSaved, CAST(w_bpFaced AS INTEGER) AS w_bpFaced,
  CAST(l_ace AS INTEGER) AS l_ace, CAST(l_df AS INTEGER) AS l_df, CAST(l_svpt AS INTEGER) AS l_svpt, CAST(l_1stIn AS INTEGER) AS l_1stIn,
  CAST(l_1stWon AS INTEGER) AS l_1stWon, CAST(l_2ndWon AS INTEGER) AS l_2ndWon, CAST(l_SvGms AS INTEGER) AS l_SvGms, CAST(l_bpSaved AS INTEGER) AS l_bpSaved,
  CAST(l_bpFaced AS INTEGER) AS l_bpFaced, CAST(winner_rank AS INTEGER) AS winner_rank, CAST(winner_rank_points AS INTEGER) AS winner_rank_points,
  CAST(loser_rank AS INTEGER) AS loser_rank, CAST(loser_rank_points AS INTEGER) AS loser_rank_points
FROM Matches;

	
DROP TABLE Matches;
ALTER TABLE temporal_partidos RENAME TO Matches;
 
--- En la siguiente consulta se elimina la informacion refente de la entidad tourney antes del año 2000.

DELETE FROM Tourney WHERE Tourney.tourney_date < '2000-01-01';
 
--- En la siguiente consulta se elimina la informacion refente de la entidad players de aquellos jugadores que no estan el top 10.
  
  DELETE FROM players
WHERE player_id NOT IN (SELECT DISTINCT player FROM rankings)

--- En la siguiente consulta se elimina la informacion refente de la entidad matches de aquellos jugadores que no estan el top 10.
  
  DELETE FROM matches
WHERE winner_id NOT IN (SELECT DISTINCT player FROM rankings) and loser_id NOT IN (SELECT DISTINCT player FROM rankings)
















