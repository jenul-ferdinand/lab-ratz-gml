/// @desc scr_guns_stats()

enum gun_type
{
	ak47,
	acr300,
	desert_eagle,
	ray_gun,
	seneca,
	aug,
	ruger,
	awp,
	famas,
	vector,
	flaregun,
	mp5,
	rpg,
	m2_2,
	m1_grand,
}

globalvar ds_gun;
var index;
#region AK47
index = gun_type.ak47;
ds_gun[index] = ds_map_create();
var m = ds_gun[index];
m[? "object"] = obj_ak47
m[? "sprite"] = spr_ak47
m[? "mag"] = 30
m[? "ammo"] = 90
m[? "automatic"] = true
m[? "reload_time"] = room_speed * 1.05
m[? "recoil"] = 7
m[? "recoil_push"] = 1.2
m[? "sound_shoot"] = snd_ak47_shoot
m[? "bullet_type"] = obj_bullet
m[? "bullet_amount"] = 1
m[? "damage"] = 24
m[? "firerate"] = 8
m[? "bullet_speed"] = 3
m[? "bullet_spread"] = 8
m[? "laser_sight"] = true
m[? "bullet_buffer"] = 18
m[? "bullet_vertex"] = 1

m[? "enemy_firerate"] = 24
m[? "enemy_damage"] = 6
m[? "enemy_bullet_speed"] = 2
m[? "enemy_shoot_radius"] = 200
#endregion
#region ACR-300
index = gun_type.acr300;
ds_gun[index] = ds_map_create();
var m = ds_gun[index];
m[? "object"] = obj_acr300
m[? "sprite"] = spr_acr300
m[? "mag"] = 24
m[? "ammo"] = 96
m[? "automatic"] = true
m[? "reload_time"] = room_speed * 1.2
m[? "recoil"] = 4
m[? "recoil_push"] = 0.4
m[? "sound_shoot"] = snd_acr300_shoot
m[? "bullet_type"] = obj_bullet
m[? "bullet_amount"] = 1
m[? "damage"] = 18
m[? "firerate"] = 5
m[? "bullet_speed"] = 3
m[? "bullet_spread"] = 6
m[? "laser_sight"] = true
m[? "bullet_buffer"] = 18
m[? "bullet_vertex"] = 1

m[? "enemy_firerate"] = 18
m[? "enemy_damage"] = 8
m[? "enemy_bullet_speed"] = 2
m[? "enemy_shoot_radius"] = 180
#endregion
#region Vector
index = gun_type.vector;
ds_gun[index] = ds_map_create();
var m = ds_gun[index];
m[? "object"] = obj_vector
m[? "sprite"] = spr_vector
m[? "mag"] = 60
m[? "ammo"] = 180
m[? "automatic"] = true
m[? "reload_time"] = room_speed * 0.8
m[? "recoil"] = 2
m[? "recoil_push"] = 0
m[? "sound_shoot"] = snd_vector_shoot
m[? "bullet_type"] = obj_bullet
m[? "bullet_amount"] = 1
m[? "damage"] = 12
m[? "firerate"] = 2.2
m[? "bullet_speed"] = 4
m[? "bullet_spread"] = 3
m[? "laser_sight"] = true
m[? "bullet_buffer"] = 12
m[? "bullet_vertex"] = 1

m[? "enemy_firerate"] = 18
m[? "enemy_damage"] = 8
m[? "enemy_bullet_speed"] = 2
m[? "enemy_shoot_radius"] = 180
#endregion
#region M1 Grand
index = gun_type.m1_grand;
ds_gun[index] = ds_map_create();
var m = ds_gun[index];
m[? "object"] = obj_m1_grand
m[? "sprite"] = spr_m1_grand
m[? "mag"] = 24
m[? "ammo"] = 96
m[? "automatic"] = false
m[? "reload_time"] = room_speed * 0.94
m[? "recoil"] = 8
m[? "recoil_push"] = 0
m[? "sound_shoot"] = snd_m1_grand_shoot
m[? "bullet_type"] = obj_bullet
m[? "bullet_amount"] = 1
m[? "damage"] = 28
m[? "firerate"] = 8
m[? "bullet_speed"] = 3
m[? "bullet_spread"] = 8
m[? "laser_sight"] = false
m[? "bullet_buffer"] = 19
m[? "bullet_vertex"] = 4

m[? "enemy_firerate"] = 18
m[? "enemy_damage"] = 12
m[? "enemy_bullet_speed"] = 2
m[? "enemy_shoot_radius"] = 270
#endregion
#region AUG
index = gun_type.aug;
ds_gun[index] = ds_map_create();
var m = ds_gun[index];
m[? "object"] = obj_aug
m[? "sprite"] = spr_aug
m[? "mag"] = 31
m[? "ammo"] = 124
m[? "automatic"] = true
m[? "reload_time"] = room_speed * 1.3
m[? "recoil"] = 4
m[? "recoil_push"] = 0.1
m[? "sound_shoot"] = snd_aug_shoot
m[? "bullet_type"] = obj_bullet
m[? "bullet_amount"] = 1
m[? "damage"] = 30
m[? "firerate"] = 8
m[? "bullet_speed"] = 6
m[? "bullet_spread"] = 3
m[? "laser_sight"] = true
m[? "bullet_buffer"] = 16
m[? "bullet_vertex"] = 1

m[? "enemy_firerate"] = 20
m[? "enemy_damage"] = 14
m[? "enemy_bullet_speed"] = 2
m[? "enemy_shoot_radius"] = 220
#endregion
#region Seneca
index = gun_type.seneca;
ds_gun[index] = ds_map_create();
var m = ds_gun[index];
m[? "object"] = obj_seneca
m[? "sprite"] = spr_seneca
m[? "mag"] = 8
m[? "ammo"] = 24
m[? "automatic"] = false
m[? "reload_time"] = room_speed * 2
m[? "recoil"] = 10
m[? "recoil_push"] = 2
m[? "sound_shoot"] = snd_seneca_shoot
m[? "bullet_type"] = obj_bullet
m[? "bullet_amount"] = 2
m[? "damage"] = 24
m[? "firerate"] = 7.4
m[? "bullet_speed"] = 3
m[? "bullet_spread"] = 7
m[? "laser_sight"] = false
m[? "bullet_buffer"] = 20
m[? "bullet_vertex"] = 1

m[? "enemy_firerate"] = 26
m[? "enemy_damage"] = 6
m[? "enemy_bullet_speed"] = 1.5
m[? "enemy_shoot_radius"] = 160;
#endregion
#region Ray Gun
index = gun_type.ray_gun;
ds_gun[index] = ds_map_create();
var m = ds_gun[index];
m[? "object"] = obj_raygun
m[? "sprite"] = spr_raygun
m[? "mag"] = 12
m[? "ammo"] = 48
m[? "automatic"] = false
m[? "reload_time"] = room_speed * 1.7
m[? "recoil"] = 12
m[? "recoil_push"] = 0.4
m[? "sound_shoot"] = snd_raygun_shoot
m[? "bullet_type"] = obj_laser
m[? "bullet_amount"] = 1
m[? "damage"] = 38
m[? "firerate"] = 5
m[? "bullet_speed"] = 3
m[? "bullet_spread"] = 7
m[? "laser_sight"] = false
m[? "bullet_buffer"] = 15
m[? "bullet_vertex"] = 1

m[? "enemy_firerate"] = 17
m[? "enemy_damage"] = 32
m[? "enemy_bullet_speed"] = 2
m[? "enemy_shoot_radius"] = 76
#endregion
#region Desert Eagle
index = gun_type.desert_eagle;
ds_gun[index] = ds_map_create();
var m = ds_gun[index];
m[? "object"] = obj_deserteagle
m[? "sprite"] = spr_deserteagle
m[? "mag"] = 7
m[? "ammo"] = 28
m[? "automatic"] = false
m[? "reload_time"] = room_speed * 1.5
m[? "recoil"] = 12
m[? "recoil_push"] = 2
m[? "sound_shoot"] = snd_desert_eagle
m[? "bullet_type"] = obj_bullet
m[? "bullet_amount"] = 1
m[? "damage"] = 30
m[? "firerate"] = 8.7
m[? "bullet_speed"] = 3
m[? "bullet_spread"] = 7
m[? "laser_sight"] = true
m[? "bullet_buffer"] = 12
m[? "bullet_vertex"] = 1

m[? "enemy_firerate"] = 28
m[? "enemy_damage"] = 23
m[? "enemy_bullet_speed"] = 2
m[? "enemy_shoot_radius"] = 180
#endregion
#region Ruger
index = gun_type.ruger;
ds_gun[index] = ds_map_create();
var m = ds_gun[index];
m[? "object"] = obj_ruger
m[? "sprite"] = spr_ruger
m[? "mag"] = 999999999
m[? "ammo"] = 0
m[? "automatic"] = false
m[? "reload_time"] = room_speed * 0.76
m[? "recoil"] = 4
m[? "recoil_push"] = 0.1
m[? "sound_shoot"] = snd_desert_eagle
m[? "bullet_type"] = obj_bullet
m[? "bullet_amount"] = 1
m[? "damage"] = 17
m[? "firerate"] = 4
m[? "bullet_speed"] = 2
m[? "bullet_spread"] = 10
m[? "laser_sight"] = false
m[? "bullet_buffer"] = 11
m[? "bullet_vertex"] = 1

m[? "enemy_firerate"] = 15
m[? "enemy_damage"] = 4
m[? "enemy_bullet_speed"] = 2
m[? "enemy_shoot_radius"] = 160
#endregion
#region AWP
index = gun_type.awp;
ds_gun[index] = ds_map_create();
var m = ds_gun[index];
m[? "object"] = obj_awp
m[? "sprite"] = spr_awp
m[? "mag"] = 6
m[? "ammo"] = 24
m[? "automatic"] = false
m[? "reload_time"] = room_speed * 2.2
m[? "recoil"] = 12
m[? "recoil_push"] = 3
m[? "sound_shoot"] = snd_seneca_shoot
m[? "bullet_type"] = obj_bullet
m[? "bullet_amount"] = 1
m[? "damage"] = 120
m[? "firerate"] = 12
m[? "bullet_speed"] = 4
m[? "bullet_spread"] = 0
m[? "laser_sight"] = true
m[? "bullet_buffer"] = 37
m[? "bullet_vertex"] = 1

m[? "enemy_firerate"] = 24
m[? "enemy_damage"] = 43
m[? "enemy_bullet_speed"] = 3
m[? "enemy_shoot_radius"] = 300
#endregion
#region Famas
index = gun_type.famas;
ds_gun[index] = ds_map_create();
var m = ds_gun[index];
m[? "object"] = obj_famas
m[? "sprite"] = spr_famas
m[? "mag"] = 28
m[? "ammo"] = 112
m[? "automatic"] = true
m[? "reload_time"] = room_speed * 0.9
m[? "recoil"] = 3
m[? "recoil_push"] = 0.1
m[? "sound_shoot"] = snd_acr300_shoot
m[? "bullet_type"] = obj_bullet
m[? "bullet_amount"] = 1
m[? "damage"] = 28
m[? "firerate"] = 4
m[? "bullet_speed"] = 5
m[? "bullet_spread"] = 5
m[? "laser_sight"] = true
m[? "bullet_buffer"] = 17
m[? "bullet_vertex"] = 1

m[? "enemy_firerate"] = 15
m[? "enemy_damage"] = 14
m[? "enemy_bullet_speed"] = 2
m[? "enemy_shoot_radius"] = 250
#endregion
#region Flare Gun
index = gun_type.flaregun;
ds_gun[index] = ds_map_create();
var m = ds_gun[index];
m[? "object"] = obj_flaregun
m[? "sprite"] = spr_flaregun
m[? "mag"] = 1
m[? "ammo"] = 4
m[? "automatic"] = false
m[? "reload_time"] = room_speed * 2
m[? "recoil"] = 4
m[? "recoil_push"] = 0.1
m[? "sound_shoot"] = snd_desert_eagle
m[? "bullet_type"] = obj_bullet
m[? "bullet_amount"] = 1
m[? "damage"] = 0
m[? "firerate"] = 12
m[? "bullet_speed"] = 3
m[? "bullet_spread"] = 12
m[? "laser_sight"] = false
m[? "bullet_buffer"] = 18
m[? "bullet_vertex"] = 1

m[? "enemy_firerate"] = 14
m[? "enemy_damage"] = 0
m[? "enemy_bullet_speed"] = 2
m[? "enemy_shoot_radius"] = 200
#endregion
#region MP5-K
index = gun_type.mp5;
ds_gun[index] = ds_map_create();
var m = ds_gun[index];
m[? "object"] = obj_mp5
m[? "sprite"] = spr_mp5
m[? "mag"] = 30
m[? "ammo"] = 90
m[? "automatic"] = true
m[? "reload_time"] = room_speed * 0.95
m[? "recoil"] = 6
m[? "recoil_push"] = 0
m[? "sound_shoot"] = snd_acr300_shoot
m[? "bullet_type"] = obj_bullet
m[? "bullet_amount"] = 1
m[? "damage"] = 20
m[? "firerate"] = 4
m[? "bullet_speed"] = 3
m[? "bullet_spread"] = 3
m[? "laser_sight"] = true
m[? "bullet_buffer"] = 16
m[? "bullet_vertex"] = 1

m[? "enemy_firerate"] = 16
m[? "enemy_damage"] = 0
m[? "enemy_bullet_speed"] = 2
m[? "enemy_shoot_radius"] = 220
#endregion
#region RPG
index = gun_type.rpg;
ds_gun[index] = ds_map_create();
var m = ds_gun[index];
m[? "object"] = obj_rpg
m[? "sprite"] = spr_rpg
m[? "mag"] = 1
m[? "ammo"] = 6
m[? "automatic"] = false
m[? "reload_time"] = room_speed * 2
m[? "recoil"] = 15
m[? "recoil_push"] = 2
m[? "sound_shoot"] = snd_rpg_shoot
m[? "bullet_type"] = obj_rpgbullet
m[? "bullet_amount"] = 1
m[? "damage"] = 25
m[? "firerate"] = 6
m[? "bullet_speed"] = 5
m[? "bullet_spread"] = 6
m[? "laser_sight"] = false
m[? "bullet_buffer"] = 36
m[? "bullet_vertex"] = 1

m[? "enemy_firerate"] = 100
m[? "enemy_damage"] = 25
m[? "enemy_bullet"] = obj_rpgbullet
m[? "enemy_bullet_speed"] = 2.7
m[? "enemy_shoot_radius"] = 300
#endregion
#region M2-2
index = gun_type.m2_2;
ds_gun[index] = ds_map_create();
var m = ds_gun[index];
m[? "object"] = obj_m2_2
m[? "sprite"] = spr_m2_2
m[? "mag"] = 50
m[? "ammo"] = 100
m[? "automatic"] = true
m[? "reload_time"] = room_speed * 2
m[? "recoil"] = 3
m[? "recoil_push"] = 0.1
m[? "sound_shoot"] = snd_nothing
m[? "bullet_type"] = obj_m2_2_bullet
m[? "bullet_amount"] = 1
m[? "damage"] = 8
m[? "firerate"] = 1
m[? "bullet_speed"] = 0.2
m[? "bullet_spread"] = 10
m[? "laser_sight"] = false
m[? "bullet_buffer"] = 18
m[? "bullet_vertex"] = 1

m[? "enemy_firerate"] = 0
m[? "enemy_damage"] = 0
m[? "enemy_bullet"] = obj_bullet
m[? "enemy_bullet_speed"] = 1
m[? "enemy_shoot_radius"] = 100
#endregion

