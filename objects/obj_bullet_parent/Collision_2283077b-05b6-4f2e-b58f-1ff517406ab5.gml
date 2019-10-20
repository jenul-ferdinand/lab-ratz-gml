if (!instance_exists(obj_player)) 
or (obj_player.holding == undefined) 
or (bullet_creator != obj_player) 
or (game_stop) exit;

// Blood splatter
blood_splatter(0, 14);

other.hit = true;
var _holding = obj_player.holding
other.hit_damage = _holding.damage;
instance_destroy();