randomise();
holder = obj_player;
destroy = false;
pickup = undefined;
mouse_check = undefined;
// Muzzle Flash
muzzle_flash = false;
// Flashlight
flash_light = false;
flash_light_fov = 27;
flash_light_toggle = false;
flash_light_distance = 275;
flash_light_brightness = c_ltgray;
// Lasersight
laser_sight_toggle = false;
laser_sight = false;
laser_colour = c_red;
// Cooldowns
cooldown = 0;
cooldown_time = 10;
cooldown_delay = -1;
cooldown_startup = 2;
// Sounds
sound_shoot = snd_ak47_shoot;
// Bullet
automatic = true;
bullet = obj_bullet;
bullet_amount = 1;
bullet_buffer = 18;
bullet_speed = 7;
bullet_spread = 5;
bullet_spread_new = bullet_spread - 2;
// Recoil
recoil = 6;
recoil_push = 2;
current_recoil = -1;
// Ammo
reload = false;
reload_time = room_speed * 1.5;
reload_counter = 0;
reload_counter_start = false;
mag = 0;
mag_max = mag;
ammo = 0