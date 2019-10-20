if (bullet_creator == obj_player) or (game_stop) exit;

// Damage player
other.hp -= damage;
other.hit = true;

// Destroy bullet
instance_destroy();

// Blood splatter
blood_splatter(0, 14);

// Screen shake
shake = 6;