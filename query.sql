\d game_plots
-- pset x
-- pset x


-- SELECT * FROM games;
-- SELECT * FROM game_ploys WHERE game_id = 7;
SELECT  id , game_id , vertical , horizontal FROM game_plots WHERE game_plots.game_id = 7 ORDER BY vertical asc, horizontal asc
