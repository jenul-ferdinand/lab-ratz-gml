randomise();

// Choose Weapon
var gun_choose = choose(
	gun_type.ak47,
	gun_type.famas,
);
var gun_map = ds_gun[gun_choose];

// Init
hit = false;
hspd = 0;
vspd = 0;
counter = 0;
state = "Idle";
dir = random_range(0, 359);
gun_dir = 0;

// Stats
hp = 100;
target = obj_player;
damage = gun_map[? "enemy_damage"];
damage_resistance = 1;

// A.I
colliding = parent_enemy_collidables;
idle_time = 10;
chase_speed = 1;
chase_radius = 128;
wander_time = 30;
wander_speed = 1;
approach_time = room_speed * 10;
inclusion_radius = 128;
shoot_radius = gun_map[? "enemy_shoot_radius"];

// Bullet
bullet_buffer = 18;
bullet_speed = gun_map[? "enemy_bullet_speed"];
bullet_index = gun_map[? "bullet_type"];

// Gun
gunshot_played = false;
gun_ybuffer = 10;
gun_xscale = 1;
gun_yscale = 1;
gun_alpha = 1;
gun_imageblend = c_white;
gun_sprite = gun_map[? "sprite"];
shoot_cooldown = gun_map[? "enemy_firerate"];

// Flash
flash_alpha = 0;
flash_alpha_max = 0.75;
flash_colour = c_white;
flash_reduction = 0.05;

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
flash_light_brightness = make_colour_rgb(74, 74, 74);

// Sprite
sprite_idle = spr_scientist_blue;
sprite_run = spr_scientist_blue_run;

// Audio
sound_gain = 0.1;
shoot_sound = gun_map[? "sound_shoot"];
emitter_min = 32;
emitter_max = 64;
emitter = audio_emitter_create();
audio_falloff_set_model(audio_falloff_exponent_distance);
audio_emitter_falloff(emitter, emitter_min, emitter_max, 1);

// Drops
drops = [obj_ammobox, obj_medkit];
drop_chance = 46;