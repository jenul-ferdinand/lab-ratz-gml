/// @desc scr_guns_init()
/// @param index

var index = argument[0];
var gun_map = ds_gun[index];
sprite = gun_map[? "sprite"];
pickup = gun_map[? "pickup"];
mag = gun_map[? "mag"];
ammo = gun_map[? "ammo"];
automatic = gun_map[? "automatic"];
recoil = gun_map[? "recoil"];
recoil_push = gun_map[? "recoil_push"];
reload_time = gun_map[? "reload_time"];
bullet = gun_map[? "bullet_type"];
bullet_amount = gun_map[? "bullet_amount"];
bullet_speed = gun_map[? "bullet_speed"];
bullet_spread = gun_map[? "bullet_spread"];
firerate = gun_map[? "firerate"];
sound_shoot = gun_map[? "sound_shoot"];
damage = gun_map[? "damage"];

// Init
holder = obj_player;
destroy = false;
// Muzzle Flash
muzzle_flash = false;
// Flashlight
flash_light = true;
flash_light_fov = 45;
flash_light_toggle = false;
flash_light_distance = 275;
flash_light_brightness = c_ltgray;
// Lasersight
laser_sight_toggle = false;
laser_sight = false;
laser_colour = c_red;
// Cooldowns
cooldown = 0;
cooldown_delay = -1;
cooldown_startup = 2;
// Bullet
bullet_buffer = 18;
bullet_spread_new = bullet_spread - 2;
// Recoil
current_recoil = -1;
// Ammo
reload = false;
reload_counter = 0;
reload_counter_start = false;
mag_max = mag;