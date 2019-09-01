state = "Idle";
target = obj_player;
colliding = parent_enemy_collidables;
counter = 0;
hspd = 0;
vspd = 0;
hit = false;
dir = random_range(0, 359);
knockback_player = false;
force_applied = 0;
force_dir = 0;

idle_time = 10
wander_time = 30;

shoot_radius = 64;
chase_radius = 128;
notify_radius = 148;

wander_speed = 1;
chase_speed = 2;

// Stats
hp = 100;
damage = 20;
damage_resistance = 0.5;
gun_xbuffer = 0;
gun_ybuffer = 22;
bullet_amount = 1;
bullet_buffer = 51;
bullet_index = obj_bullet;
bullet_speed = 3;
bullet_spread = 2;
shoot_cooldown = 20;

// Lighting
lighting_height_buffer = 19;
lighting_inner_colour = make_colour_rgb(40, 40, 40);
lighting_outer_colour = make_colour_rgb(20, 20, 20);
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

// Sprite
sprite_idle = spr_warden_idle;
sprite_run = spr_warden_walk;
sprite_shoot = spr_warden_shoot;
sprite_gun = spr_warden_gun;
gun_yscale = 1;
gun_dir = 0;