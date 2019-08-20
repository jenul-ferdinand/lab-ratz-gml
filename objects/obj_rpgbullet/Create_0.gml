event_inherited();
// Particle
particle = instance_create_layer(x, y, "particles", obj_rpg_fire);
particle.creator = id;

// Lighting
lighting_inner_colour = make_colour_rgb(181, 145, 0);
lighting_outer_colour = make_colour_rgb(102, 82, 0);
lighting_inner_radius = 12;
lighting_outer_radius = 18;
lighting_shake_amount = 2;