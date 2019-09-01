randomise();
event_inherited();

var gun_choose = choose(
	gun_type.ak47,
	gun_type.famas,
);

// Init
scientist_init(gun_choose);

// Stats
hp = 100;
target = obj_player;
damage_resistance = 1;

// A.I
colliding = parent_enemy_collidables;
idle_time = 10;
chase_speed = 1;
chase_radius = 128;
wander_time = 30;
wander_speed = 1;
approach_time = room_speed * 10;
notify_radius = 128;
notify_object = parent_enemy;

// Bullet
bullet_buffer = 18;
bullet_amount = 1;
bullet_spread = 4;

// Gun
gunshot_played = false;
gun_ybuffer = 10;
gun_xscale = 1;
gun_yscale = 1;
gun_alpha = 1;
gun_imageblend = c_white;
gun_sprite_index = 1;

// Lighting
lighting_inner_colour = make_colour_rgb(6, 6, 6);
lighting_outer_colour = make_colour_rgb(3, 3, 3);
lighting_inner_radius = 20;
lighting_outer_radius = 40;
lighting_shake_amount = 1;

// Flashlight
flash_light = true;
flash_light_fov = 35;
flash_light_toggle = false;
flash_light_ybuffer = 8;
flash_light_distance = shoot_radius;
flash_light_colour = make_colour_rgb(74, 74, 74);

// Sprite
sprite_idle = spr_scientist_white;
sprite_run = spr_scientist_white_run;

// Audio
hit_sfx = snd_hitmarker;
sound_gain = 0.1;
emitter_min = 32;
emitter_max = 64;
emitter = audio_emitter_create();
audio_falloff_set_model(audio_falloff_exponent_distance);
audio_emitter_falloff(emitter, emitter_min, emitter_max, 1);

// Drops
drops = [obj_ammobox, obj_medkit];
drop_chance = 46;