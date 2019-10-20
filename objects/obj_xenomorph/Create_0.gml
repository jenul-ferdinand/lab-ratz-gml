// Init
hspd = 0;
vspd = 0;
counter = 0;
hit = false;
force_applied = 0;

// A.I
state = "Idle";
target = obj_player;
colliding = parent_enemy_collidables;
idle_time = 10;
// Approach
approach = true;
approach_time = room_speed * 10;
// Wander
wander_time = 30;
wander_speed = 1;
// Chase
chase_radius = 164;
chase_speed = 1.75;
// Dash & melee
dash_speed = 3;
dash_radius = 128;
dashed = false;
melee_radius = 32;
melee_damage = 15;
// Retreat
retreat_radius = 64;
retreat_time = room_speed * 1;
// Notify
notify = true;
notify_radius = 128;
notify_object = parent_enemy;
// Stats
hp = 200;
knockback_power = 4;
points_death = 1000;

// Sprite and Objects
sprite_idle = spr_xenomorph;
sprite_run = spr_xenomorph_run;
object_dead = obj_xenomorph_dead;
ghost_fade_speed = 0.075;

// Lighting
lighting_height_buffer = 19;
lighting_inner_colour = make_colour_rgb(26, 26, 26);
lighting_outer_colour = make_colour_rgb(15, 15, 15);
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
