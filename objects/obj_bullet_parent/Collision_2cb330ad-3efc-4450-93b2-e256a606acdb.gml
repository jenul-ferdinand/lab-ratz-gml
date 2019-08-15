if (creator != obj_enemy) or (!instance_exists(obj_enemy)) or (game_stop) exit;
instance_create_layer(x, y, "particles", obj_small_explosion);
// Damage player
other.hp -= creator.damage;
// Destroy bullet
instance_destroy();