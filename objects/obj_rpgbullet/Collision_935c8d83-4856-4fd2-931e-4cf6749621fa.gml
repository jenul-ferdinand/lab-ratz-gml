// Inherit the parent event
event_inherited();

// Particle
var expl = instance_create_layer(x, y, "particles", obj_rpg_explosion);
expl.creator = id;
expl.last_direction = image_angle;
particle.destroy = true;