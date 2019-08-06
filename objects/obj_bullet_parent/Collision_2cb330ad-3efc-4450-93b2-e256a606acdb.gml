if (creator != obj_enemy) or (!instance_exists(obj_enemy)) exit;
// Damage player
other.hp -= creator.damage;
// Destroy bullet
instance_destroy();