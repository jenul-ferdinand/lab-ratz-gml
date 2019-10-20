/// @desc Collision with bullet

// Explosion
var expl = instance_create_depth(x, y, -9999, obj_rpg_explosion);
expl.creator = id;
expl.last_direction = image_angle;
expl.target = parent_enemy;
expl.damage = 50;

// Destroy barrel
instance_destroy();