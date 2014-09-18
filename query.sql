-- \d users
-- \d play_bricks_users
-- \d play_bricks
-- \d game_plots
\pset x
-- \pset x



-- SELECT * from game_plots where id in (2,4,5, 8, 12);
-- UPDATE game_plots
--   SET selected_by_id = 2 
--   where id in (6,7,11,10);
-- SELECT * from game_plots where id in (2,4,5, 8, 12);

-- SELECT * FROM "users"  WHERE default_play_brick_id = 1;
-- -- SELECT * FROM users;
-- -- SELECT * FROM game_ploys WHERE game_id = 7;
-- -- SELECT  id , game_id, selected_by_id, vertical , horizontal FROM game_plots WHERE game_id = 9 ORDER BY vertical asc, horizontal asc
-- -- UPDATE game_plots 
-- -- SET selected_by_id=0
-- -- WHERE id in (51,   90, 116, 129, 142, 155, 168,  52,  65,  78,  91, 104, 130, 156, 169,   66,  79,  92, 105, 118, 170,  106, 119, 132, 145, 158, 171,  55,  68,  81,  94, 120, 146, 159, 172,  56,  69,  82,  95, 108, 121, 134, 147, 160);

-- SELECT 
--   play_bricks.* FROM play_bricks 
-- INNER JOIN 
--   play_bricks_users 
-- ON
--   play_bricks.id = play_bricks_users.play_brick_id 
-- WHERE
--   play_bricks_users.user_id = 1; 

-- SELECT 
--   users.* FROM users
-- INNER JOIN 
--   play_bricks_users 
-- ON 
--   users.id =  play_bricks_users.user_id
-- WHERE 
--   play_bricks_users.play_brick_id = $1
