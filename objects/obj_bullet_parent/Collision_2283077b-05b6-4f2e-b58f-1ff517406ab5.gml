if (!instance_exists(obj_player)) 
or (obj_player.holding == undefined) 
or (creator != obj_player) 
or (game_stop) exit;

instance_create_layer(x, y, "particles", obj_small_explosion);

other.hit = true;
instance_destroy();