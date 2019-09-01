// Inherit the parent event
event_inherited();

// Create the explosion
var expl = instance_create_layer(x, y, "particles", obj_rpg_explosion);
expl.creator = id;
expl.last_direction = image_angle;
expl.target = parent_enemy;
var gun_map = ds_gun[gun_type.rpg];
expl.damage = gun_map[? "damage"];

// Destroy bullet particle
if (instance_exists(bullet_particle)) { bullet_particle.destroy = true; }

// Destroy bullet
instance_destroy();