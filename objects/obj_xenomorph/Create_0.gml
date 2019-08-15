// Init
hspd = 0;
vspd = 0;
counter = 0;
hit = false;

// A.I
target = obj_player;
hp = 100;
damage_resistance = 0.9;
state = state_type.chase;
colliding = parent_enemy_collidables;
idle_time = 10;
chase_speed = 1.75;
chase_radius = 128;
wander_time = 30;
wander_speed = 1;
approach_time = room_speed * 10;
inclusion_radius = 128;

// Sprite
sprite_idle = spr_xenomorph;
sprite_run = spr_xenomorph_run;

// Lighting
lighting_height_buffer = 19;
lighting_inner_colour = make_colour_rgb(40, 40, 40);
lighting_outer_colour = make_colour_rgb(20, 20, 20);
lighting_inner_radius = 20;
lighting_outer_radius = 40;
lighting_shake_amount = 3;

// Flash
flash_alpha = 0;
flash_alpha_max = 0.75;
flash_colour = c_white;
flash_reduction = 0.05;
