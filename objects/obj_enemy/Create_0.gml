randomise();

hit = false;
hspd = 0;
vspd = 0;
counter = 0;
state = "Idle";
dir = random_range(0, 359);
// Stats
hp = 100;
target = obj_player;
// A.I
colliding = parent_enemy_collidables;
idle_time = 10;
chase_speed = 1;
chase_radius = 128;
wander_time = 30;
wander_speed = 1;
shoot_radius = 76;
approach_time = room_speed * 10;
inclusion_radius = 128;
// Bullet
bullet_speed = 2;
bullet_buffer = 18;
// Gun
gunshot_played = false;
gun_ybuffer = 10;
gun_xscale = 1;
gun_yscale = 1;
gun_alpha = 1;
gun_imageblend = c_white;
// Gun Map
var pick = ds_gun[irandom_range(0, array_length_1d(ds_gun)-1)];
gun_sprite = pick[? "sprite"];
bullet_index = pick[? "bullet_type"];
shoot_sound = pick[? "sound_shoot"];
shoot_cooldown = pick[? "enemy_firerate"];
damage = pick[? "enemy_damage"];
// Flash
flash_alpha = 0;
flash_alpha_max = 0.75;
flash_colour = c_white;
flash_reduction = 0.05;
// Sprite
sprite_idle = spr_enemy_scientist;
sprite_run = spr_enemy_scientist_run;
