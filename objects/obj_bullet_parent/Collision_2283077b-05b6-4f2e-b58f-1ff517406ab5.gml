if (!instance_exists(obj_player)) 
or (obj_player.holding == undefined) 
or (creator != obj_player) 
or (game_stop) exit;

other.hit = true;
instance_destroy();