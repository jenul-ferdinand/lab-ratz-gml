if (creator != obj_enemy) or (!instance_exists(obj_enemy)) or (game_stop) exit;
// Damage player
other.hp -= creator.damage;
// Destroy bullet
instance_destroy();