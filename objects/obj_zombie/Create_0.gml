hspd = 0;
vspd = 0;
hit = false;
hit_sfx = snd_hitmarker;
counter = 0;
spawn_dir = 0;

state = "Spawn";
target = obj_player;
colliding = parent_enemy_collidables;
// Stats
hp = 100;
reward_points = 100;
// Speed
chase_speed = 0.35;
// Attacking
attack_counter = 0;
attack_damage = 5;
attack_radius = unit;
attack_time = room_speed * 1;

// Sprites
sprite_idle = spr_ghoul;
sprite_run = spr_ghoul_run;
sprite_attack = spr_ghoul;

// Flash
flash_alpha = 0;
flash_alpha_max = 0.75;
flash_colour = c_white;
flash_reduction = 0.05;