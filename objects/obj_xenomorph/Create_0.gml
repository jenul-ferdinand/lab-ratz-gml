// Init
hspd = 0;
vspd = 0;
counter = 0;
hit = false;
force_applied = 0;

// Stats
hp = 100;
damage_resistance = 0.5;
knockback_power = 4;
melee_damage = 15;
dash_speed = 3;
wander_speed = 1;
points_death = 1000;

// A.I
state = "Idle";
target = obj_player;
colliding = parent_enemy_collidables;
dashed = false;
approach_time = room_speed * 10;
wander_time = 30;
idle_time = 10;
notify_radius = 128;
chase_radius = 164;
chase_speed = 1.75;
dash_radius = 128;
melee_radius = 32;
retreat_radius = 64;
retreat_time = room_speed * 1;
notify_object = parent_enemy;

// Sprite and Objects
sprite_idle = spr_xenomorph;
sprite_run = spr_xenomorph_run;
object_dead = obj_xenomorph_dead;
ghost_fade_speed = 0.075;

// Lighting
lighting_height_buffer = 19;
lighting_inner_colour = make_colour_rgb(150, 150, 150);
lighting_outer_colour = make_colour_rgb(74, 74, 74);
lighting_inner_radius = 20;
lighting_outer_radius = 40;
lighting_shake_amount = 3;

// Flash
flash_alpha = 0;
flash_alpha_max = 0.75;
flash_colour = c_white;
flash_reduction = 0.05;

// Audio
hit_sfx = snd_hitmarker;
