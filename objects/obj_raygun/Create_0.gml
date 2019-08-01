event_inherited();

sound_shoot = snd_raygun_shoot;

cooldown_time = 3;

automatic = false;

flashlight = false;
laser_sight = false;

bullet = obj_laser;
bullet_buffer = 18;
bullet_speed = 7;
bullet_spread = 4;
bullet_spread_new = bullet_spread - 2;

recoil = 4;
recoil_push = 0.2;
current_recoil = -1;

ammo = 90;
damage = 73;

pickup = obj_raygun_pickup;