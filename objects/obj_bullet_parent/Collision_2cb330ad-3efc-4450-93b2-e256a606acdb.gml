if (bullet_creator == obj_player) or (game_stop) exit;
// Damage player
other.hp -= damage;
// Destroy bullet
instance_destroy();

shake = 6;