/// @desc scientist_init
/// @param choosing guns

// Init
target = obj_player;
hit = false;
hspd = 0;
vspd = 0;
counter = 0;
state = "Idle";
dir = random_range(0, 359);
gun_dir = 0;
shoot_dir = 0;
force_applied = 0;

// Flash
flash_alpha = 0;
flash_alpha_max = 0.75;
flash_colour = c_white;
flash_reduction = 0.05;

// Gun Map
if (argument[0] != undefined)
{
	var gun_map = ds_gun[argument[0]];
	damage = gun_map[? "enemy_damage"];
	bullet_speed = gun_map[? "enemy_bullet_speed"];
	bullet_index = gun_map[? "bullet_type"];
	shoot_radius = gun_map[? "enemy_shoot_radius"];
	shoot_cooldown = gun_map[? "enemy_firerate"];
	shoot_sound = gun_map[? "sound_shoot"];
	gun_sprite = gun_map[? "sprite"];
}