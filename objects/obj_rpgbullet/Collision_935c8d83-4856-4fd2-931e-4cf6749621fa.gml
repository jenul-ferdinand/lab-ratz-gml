// Inherit the parent event
event_inherited();

// Create the explosion
var expl = instance_create_layer(x, y, "particles", obj_rpg_explosion);
expl.creator = id;
expl.bullet_creator = bullet_creator;
expl.last_direction = direction;
expl.target = obj_player;
var gun_map = ds_gun[gun_type.rpg];
expl.damage = gun_map[? "enemy_damage"];

// Destroy bullet particle
if (instance_exists(bullet_particle)) { bullet_particle.destroy = true; }

// Destroy bullet
instance_destroy();