event_inherited();
// Sound effect
sound_shoot = snd_raygun_shoot;
// Cooldown
cooldown_time = 8;
// Mode
automatic = false;
// Attachments
flashlight = false;
laser_sight = false;
// Bullet
bullet = obj_laser;
bullet_buffer = 18;
bullet_speed = 4;
bullet_spread = 0;
bullet_spread_new = bullet_spread - 2;
// Recoil
recoil = 8;
recoil_push = 0.2;
current_recoil = -1;
// Ammo
mag = 10;
mag_max = 10;
ammo = 40;
// Damage
damage = 27;
// Pickup
pickup = obj_raygun_pickup;