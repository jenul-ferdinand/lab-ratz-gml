randomise();
enum state_type
{
	idle,
	wander,
	approach,
	chase, 
	shoot,
}

var gun_choose = choose(
	gun_type.ak47,
	gun_type.famas,
);
var pick = ds_gun[gun_choose];

hit = false;
hspd = 0;
vspd = 0;
counter = 0;
state = state_type.idle;
dir = random_range(0, 359);
gun_dir = 0;

// Stats
hp = 100;
target = obj_player;
damage = pick[? "enemy_damage"];

// A.I
colliding = parent_enemy_collidables;
idle_time = 10;
chase_speed = 1;
chase_radius = 128;
wander_time = 30;
wander_speed = 1;
approach_time = room_speed * 10;
inclusion_radius = 128;
shoot_radius = pick[? "enemy_shoot_radius"];

// Bullet
bullet_buffer = 18;
bullet_speed = pick[? "enemy_bullet_speed"];
bullet_index = pick[? "bullet_type"];

// Gun
gunshot_played = false;
gun_ybuffer = 10;
gun_xscale = 1;
gun_yscale = 1;
gun_alpha = 1;
gun_imageblend = c_white;
gun_sprite = pick[? "sprite"];
shoot_cooldown = pick[? "enemy_firerate"];
shoot_sound = pick[? "sound_shoot"];

// Flash
flash_alpha = 0;
flash_alpha_max = 0.75;
flash_colour = c_white;
flash_reduction = 0.05;

// Flashlight
flash_light_fov = 35;
flash_light_toggle = false;
flash_light_ybuffer = 8;
flash_light_distance = shoot_radius;
flash_light_brightness = c_ltgray;

// Sprite
sprite_idle = spr_enemy_scientist;
sprite_run = spr_enemy_scientist_run;
