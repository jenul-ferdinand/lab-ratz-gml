holder = obj_player;
pickup = undefined;

automatic = true;
mouse_check = undefined;

muzzle_flash = true;
muzzle_flash_counter_start = false;
muzzle_flash_counter = 0;
muzzle_flash_time = 1;


flash_light = false;
flash_light_fov = 27;
flash_light_toggle = false;
flash_light_distance = 275;
flash_light_brightness = c_ltgray;
laser_sight_toggle = false;
laser_sight = false;
laser_colour = c_red;

first_shot = true;
cooldown_counter = 0;
cooldown_time = 10;
cooldown_counter_start = false;

sound_shoot = snd_ak47_shoot;

bullet = obj_bullet;
bullet_buffer = 18;
bullet_speed = 7;
bullet_spread = 5;
bullet_spread_new = bullet_spread - 2;

recoil = 6;
recoil_push = 2;
current_recoil = -1;

first = true;
ammo = 0;
destroy = false;