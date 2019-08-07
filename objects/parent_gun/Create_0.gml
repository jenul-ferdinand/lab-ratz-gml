randomise();
scr_guns_init(gun_type.ak47);

// Init
holder = obj_player;
destroy = false;
// Muzzle Flash
muzzle_flash = false;
// Flashlight
flash_light = true;
flash_light_fov = 45;
flash_light_toggle = false;
flash_light_distance = 425;
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