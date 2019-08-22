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
}

globalvar ds_gun;
var index;
#region AK47
index = gun_type.ak47;
ds_gun[index] = ds_map_create();
ds_map_add(ds_gun[index], "object",			obj_ak47);
ds_map_add(ds_gun[index], "sprite",			spr_ak47);
ds_map_add(ds_gun[index], "mag",			30);
ds_map_add(ds_gun[index], "ammo",			90);
ds_map_add(ds_gun[index], "automatic",		true);
ds_map_add(ds_gun[index], "reload_time",	room_speed * 1.05);
ds_map_add(ds_gun[index], "recoil",			7);
ds_map_add(ds_gun[index], "recoil_push",	1.2);
ds_map_add(ds_gun[index], "sound_shoot",	snd_ak47_shoot);
ds_map_add(ds_gun[index], "bullet_type",	obj_bullet);
ds_map_add(ds_gun[index], "bullet_amount",	1);
ds_map_add(ds_gun[index], "damage",			34);
ds_map_add(ds_gun[index], "firerate",		8);
ds_map_add(ds_gun[index], "bullet_speed",	3);
ds_map_add(ds_gun[index], "bullet_spread",	8);
ds_map_add(ds_gun[index], "laser_sight",	true);

ds_map_add(ds_gun[index], "enemy_firerate", 24);
ds_map_add(ds_gun[index], "enemy_damage",	6);
ds_map_add(ds_gun[index], "enemy_bullet_speed", 2);
ds_map_add(ds_gun[index], "enemy_shoot_radius", 200);
#endregion
#region ACR-300
index = gun_type.acr300;
ds_gun[index] = ds_map_create();
ds_map_add(ds_gun[index], "object",			obj_acr300);
ds_map_add(ds_gun[index], "sprite",			spr_acr300);
ds_map_add(ds_gun[index], "mag",			24);
ds_map_add(ds_gun[index], "ammo",			96);
ds_map_add(ds_gun[index], "automatic",		true);
ds_map_add(ds_gun[index], "reload_time",	room_speed * 1.2);
ds_map_add(ds_gun[index], "recoil",			4);
ds_map_add(ds_gun[index], "recoil_push",	0.4);
ds_map_add(ds_gun[index], "sound_shoot",	snd_acr300_shoot);
ds_map_add(ds_gun[index], "bullet_type",	obj_bullet);
ds_map_add(ds_gun[index], "bullet_amount",	1);
ds_map_add(ds_gun[index], "damage",			24);
ds_map_add(ds_gun[index], "firerate",		5);
ds_map_add(ds_gun[index], "bullet_speed",	3);
ds_map_add(ds_gun[index], "bullet_spread",	6);
ds_map_add(ds_gun[index], "laser_sight",	true);

ds_map_add(ds_gun[index], "enemy_firerate", 18);
ds_map_add(ds_gun[index], "enemy_damage",	8);
ds_map_add(ds_gun[index], "enemy_bullet_speed", 2);
ds_map_add(ds_gun[index], "enemy_shoot_radius", 180);
#endregion
#region Vector
index = gun_type.vector;
ds_gun[index] = ds_map_create();
ds_map_add(ds_gun[index], "object",			obj_vector);
ds_map_add(ds_gun[index], "sprite",			spr_vector);
ds_map_add(ds_gun[index], "mag",			60);
ds_map_add(ds_gun[index], "ammo",			180);
ds_map_add(ds_gun[index], "automatic",		true);
ds_map_add(ds_gun[index], "reload_time",	room_speed * 0.8);
ds_map_add(ds_gun[index], "recoil",			2);
ds_map_add(ds_gun[index], "recoil_push",	0);
ds_map_add(ds_gun[index], "sound_shoot",	snd_acr300_shoot);
ds_map_add(ds_gun[index], "bullet_type",	obj_bullet);
ds_map_add(ds_gun[index], "bullet_amount",	1);
ds_map_add(ds_gun[index], "damage",			12);
ds_map_add(ds_gun[index], "firerate",		2.2);
ds_map_add(ds_gun[index], "bullet_speed",	4);
ds_map_add(ds_gun[index], "bullet_spread",	3);
ds_map_add(ds_gun[index], "laser_sight",	true);

ds_map_add(ds_gun[index], "enemy_firerate", 18);
ds_map_add(ds_gun[index], "enemy_damage",	8);
ds_map_add(ds_gun[index], "enemy_bullet_speed", 2);
ds_map_add(ds_gun[index], "enemy_shoot_radius", 180);
#endregion
#region AUG
index = gun_type.aug;
ds_gun[index] = ds_map_create();
ds_map_add(ds_gun[index], "object",			obj_aug);
ds_map_add(ds_gun[index], "sprite",			spr_aug);
ds_map_add(ds_gun[index], "mag",			31);
ds_map_add(ds_gun[index], "ammo",			124);
ds_map_add(ds_gun[index], "automatic",		true);
ds_map_add(ds_gun[index], "reload_time",	room_speed * 1.3);
ds_map_add(ds_gun[index], "recoil",			4);
ds_map_add(ds_gun[index], "recoil_push",	0.1);
ds_map_add(ds_gun[index], "sound_shoot",	snd_aug_shoot);
ds_map_add(ds_gun[index], "bullet_type",	obj_bullet);
ds_map_add(ds_gun[index], "bullet_amount",	1);
ds_map_add(ds_gun[index], "damage",			65);
ds_map_add(ds_gun[index], "firerate",		8);
ds_map_add(ds_gun[index], "bullet_speed",	6);
ds_map_add(ds_gun[index], "bullet_spread",	3);
ds_map_add(ds_gun[index], "laser_sight",	true);

ds_map_add(ds_gun[index], "enemy_firerate", 20);
ds_map_add(ds_gun[index], "enemy_damage",	14);
ds_map_add(ds_gun[index], "enemy_bullet_speed", 2);
ds_map_add(ds_gun[index], "enemy_shoot_radius", 220);
#endregion
#region Seneca
index = gun_type.seneca;
ds_gun[index] = ds_map_create();
ds_map_add(ds_gun[index], "object",			obj_seneca);
ds_map_add(ds_gun[index], "sprite",			spr_seneca);
ds_map_add(ds_gun[index], "mag",			8);
ds_map_add(ds_gun[index], "ammo",			24);
ds_map_add(ds_gun[index], "automatic",		false);
ds_map_add(ds_gun[index], "reload_time",	room_speed * 2);
ds_map_add(ds_gun[index], "recoil",			10);
ds_map_add(ds_gun[index], "recoil_push",	2);
ds_map_add(ds_gun[index], "sound_shoot",	snd_seneca_shoot);
ds_map_add(ds_gun[index], "bullet_type",	obj_bullet);
ds_map_add(ds_gun[index], "bullet_amount",	2);
ds_map_add(ds_gun[index], "damage",			47);
ds_map_add(ds_gun[index], "firerate",		5);
ds_map_add(ds_gun[index], "bullet_speed",	3);
ds_map_add(ds_gun[index], "bullet_spread",	7);
ds_map_add(ds_gun[index], "laser_sight",	false);

ds_map_add(ds_gun[index], "enemy_firerate", 26);
ds_map_add(ds_gun[index], "enemy_damage",	16);
ds_map_add(ds_gun[index], "enemy_bullet_speed", 2);
ds_map_add(ds_gun[index], "enemy_shoot_radius", 76);
#endregion
#region Ray Gun
index = gun_type.ray_gun;
ds_gun[index] = ds_map_create();
ds_map_add(ds_gun[index], "object",			obj_raygun);
ds_map_add(ds_gun[index], "sprite",			spr_raygun);
ds_map_add(ds_gun[index], "mag",			12);
ds_map_add(ds_gun[index], "ammo",			48);
ds_map_add(ds_gun[index], "automatic",		false);
ds_map_add(ds_gun[index], "reload_time",	room_speed * 1.7);
ds_map_add(ds_gun[index], "recoil",			12);
ds_map_add(ds_gun[index], "recoil_push",	0.4);
ds_map_add(ds_gun[index], "sound_shoot",	snd_raygun_shoot);
ds_map_add(ds_gun[index], "bullet_type",	obj_laser);
ds_map_add(ds_gun[index], "bullet_amount",	1);
ds_map_add(ds_gun[index], "damage",			64);
ds_map_add(ds_gun[index], "firerate",		5);
ds_map_add(ds_gun[index], "bullet_speed",	3);
ds_map_add(ds_gun[index], "bullet_spread",	7);
ds_map_add(ds_gun[index], "laser_sight",	false);

ds_map_add(ds_gun[index], "enemy_firerate", 17);
ds_map_add(ds_gun[index], "enemy_damage",	32);
ds_map_add(ds_gun[index], "enemy_bullet_speed", 2);
ds_map_add(ds_gun[index], "enemy_shoot_radius", 64);
#endregion
#region Desert Eagle
index = gun_type.desert_eagle;
ds_gun[index] = ds_map_create();
ds_map_add(ds_gun[index], "object",			obj_deserteagle);
ds_map_add(ds_gun[index], "sprite",			spr_deserteagle);
ds_map_add(ds_gun[index], "mag",			7);
ds_map_add(ds_gun[index], "ammo",			14);
ds_map_add(ds_gun[index], "automatic",		false);
ds_map_add(ds_gun[index], "reload_time",	room_speed * 2);
ds_map_add(ds_gun[index], "recoil",			12);
ds_map_add(ds_gun[index], "recoil_push",	2);
ds_map_add(ds_gun[index], "sound_shoot",	snd_desert_eagle);
ds_map_add(ds_gun[index], "bullet_type",	obj_bullet);
ds_map_add(ds_gun[index], "bullet_amount",	1);
ds_map_add(ds_gun[index], "damage",			65);
ds_map_add(ds_gun[index], "firerate",		8);
ds_map_add(ds_gun[index], "bullet_speed",	3);
ds_map_add(ds_gun[index], "bullet_spread",	7);
ds_map_add(ds_gun[index], "laser_sight",	true);

ds_map_add(ds_gun[index], "enemy_firerate", 28);
ds_map_add(ds_gun[index], "enemy_damage",	23);
ds_map_add(ds_gun[index], "enemy_bullet_speed", 2);
ds_map_add(ds_gun[index], "enemy_shoot_radius", 128);
#endregion
#region Ruger
index = gun_type.ruger;
ds_gun[index] = ds_map_create();
ds_map_add(ds_gun[index], "object",			obj_ruger);
ds_map_add(ds_gun[index], "sprite",			spr_ruger);
ds_map_add(ds_gun[index], "mag",			9999999999);
ds_map_add(ds_gun[index], "ammo",			0);
ds_map_add(ds_gun[index], "automatic",		false);
ds_map_add(ds_gun[index], "reload_time",	room_speed * 0.76);
ds_map_add(ds_gun[index], "recoil",			4);
ds_map_add(ds_gun[index], "recoil_push",	0.1);
ds_map_add(ds_gun[index], "sound_shoot",	snd_desert_eagle);
ds_map_add(ds_gun[index], "bullet_type",	obj_bullet);
ds_map_add(ds_gun[index], "bullet_amount",	1);
ds_map_add(ds_gun[index], "damage",			17);
ds_map_add(ds_gun[index], "firerate",		4);
ds_map_add(ds_gun[index], "bullet_speed",	5);
ds_map_add(ds_gun[index], "bullet_spread",	3);
ds_map_add(ds_gun[index], "laser_sight",	true);

ds_map_add(ds_gun[index], "enemy_firerate", 15);
ds_map_add(ds_gun[index], "enemy_damage",	4);
ds_map_add(ds_gun[index], "enemy_bullet_speed", 2);
ds_map_add(ds_gun[index], "enemy_shoot_radius", 70);
#endregion
#region AWP
index = gun_type.awp;
ds_gun[index] = ds_map_create();
ds_map_add(ds_gun[index], "object",			obj_awp);
ds_map_add(ds_gun[index], "sprite",			spr_awp);
ds_map_add(ds_gun[index], "mag",			6);
ds_map_add(ds_gun[index], "ammo",			24);
ds_map_add(ds_gun[index], "automatic",		false);
ds_map_add(ds_gun[index], "reload_time",	room_speed * 2);
ds_map_add(ds_gun[index], "recoil",			12);
ds_map_add(ds_gun[index], "recoil_push",	3);
ds_map_add(ds_gun[index], "sound_shoot",	snd_seneca_shoot);
ds_map_add(ds_gun[index], "bullet_type",	obj_bullet);
ds_map_add(ds_gun[index], "bullet_amount",	1);
ds_map_add(ds_gun[index], "damage",			100);
ds_map_add(ds_gun[index], "firerate",		12);
ds_map_add(ds_gun[index], "bullet_speed",	12);
ds_map_add(ds_gun[index], "bullet_spread",	0);
ds_map_add(ds_gun[index], "laser_sight",	true);

ds_map_add(ds_gun[index], "enemy_firerate", 24);
ds_map_add(ds_gun[index], "enemy_damage",	50);
ds_map_add(ds_gun[index], "enemy_bullet_speed", 3);
ds_map_add(ds_gun[index], "enemy_shoot_radius", 156);
#endregion
#region Famas
index = gun_type.famas;
ds_gun[index] = ds_map_create();
ds_map_add(ds_gun[index], "object",			obj_famas);
ds_map_add(ds_gun[index], "sprite",			spr_famas);
ds_map_add(ds_gun[index], "mag",			28);
ds_map_add(ds_gun[index], "ammo",			112);
ds_map_add(ds_gun[index], "automatic",		true);
ds_map_add(ds_gun[index], "reload_time",	room_speed * 1.2);
ds_map_add(ds_gun[index], "recoil",			3);
ds_map_add(ds_gun[index], "recoil_push",	0.1);
ds_map_add(ds_gun[index], "sound_shoot",	snd_acr300_shoot);
ds_map_add(ds_gun[index], "bullet_type",	obj_bullet);
ds_map_add(ds_gun[index], "bullet_amount",	1);
ds_map_add(ds_gun[index], "damage",			32);
ds_map_add(ds_gun[index], "firerate",		4);
ds_map_add(ds_gun[index], "bullet_speed",	5);
ds_map_add(ds_gun[index], "bullet_spread",	0);
ds_map_add(ds_gun[index], "laser_sight",	true);

ds_map_add(ds_gun[index], "enemy_firerate", 15);
ds_map_add(ds_gun[index], "enemy_damage",	14);
ds_map_add(ds_gun[index], "enemy_bullet_speed", 2);
ds_map_add(ds_gun[index], "enemy_shoot_radius", 200);
#endregion
#region Flare Gun
index = gun_type.flaregun;
ds_gun[index] = ds_map_create();
ds_map_add(ds_gun[index], "object",			obj_flaregun);
ds_map_add(ds_gun[index], "sprite",			spr_flaregun);
ds_map_add(ds_gun[index], "mag",			4);
ds_map_add(ds_gun[index], "ammo",			0);
ds_map_add(ds_gun[index], "automatic",		true);
ds_map_add(ds_gun[index], "reload_time",	room_speed * 1.5);
ds_map_add(ds_gun[index], "recoil",			4);
ds_map_add(ds_gun[index], "recoil_push",	0.1);
ds_map_add(ds_gun[index], "sound_shoot",	snd_desert_eagle);
ds_map_add(ds_gun[index], "bullet_type",	obj_flare);
ds_map_add(ds_gun[index], "bullet_amount",	1);
ds_map_add(ds_gun[index], "damage",			0);
ds_map_add(ds_gun[index], "firerate",		6);
ds_map_add(ds_gun[index], "bullet_speed",	3);
ds_map_add(ds_gun[index], "bullet_spread",	6);
ds_map_add(ds_gun[index], "laser_sight",	false);

ds_map_add(ds_gun[index], "enemy_firerate", 16);
ds_map_add(ds_gun[index], "enemy_damage",	0);
ds_map_add(ds_gun[index], "enemy_bullet_speed", 2);
ds_map_add(ds_gun[index], "enemy_shoot_radius", 100);
#endregion
#region MP5-K
index = gun_type.mp5;
ds_gun[index] = ds_map_create();
ds_map_add(ds_gun[index], "object",			obj_mp5);
ds_map_add(ds_gun[index], "sprite",			spr_mp5);
ds_map_add(ds_gun[index], "mag",			30);
ds_map_add(ds_gun[index], "ammo",			90);
ds_map_add(ds_gun[index], "automatic",		true);
ds_map_add(ds_gun[index], "reload_time",	room_speed * 0.95);
ds_map_add(ds_gun[index], "recoil",			6);
ds_map_add(ds_gun[index], "recoil_push",	0.1);
ds_map_add(ds_gun[index], "sound_shoot",	snd_acr300_shoot);
ds_map_add(ds_gun[index], "bullet_type",	obj_bullet);
ds_map_add(ds_gun[index], "bullet_amount",	1);
ds_map_add(ds_gun[index], "damage",			20);
ds_map_add(ds_gun[index], "firerate",		4);
ds_map_add(ds_gun[index], "bullet_speed",	3);
ds_map_add(ds_gun[index], "bullet_spread",	3);
ds_map_add(ds_gun[index], "laser_sight",	true);

ds_map_add(ds_gun[index], "enemy_firerate", 16);
ds_map_add(ds_gun[index], "enemy_damage",	0);
ds_map_add(ds_gun[index], "enemy_bullet_speed", 2);
ds_map_add(ds_gun[index], "enemy_shoot_radius", 100);
#endregion
#region RPG
index = gun_type.rpg;
ds_gun[index] = ds_map_create();
ds_map_add(ds_gun[index], "object",			obj_rpg);
ds_map_add(ds_gun[index], "sprite",			spr_rpg);
ds_map_add(ds_gun[index], "mag",			1);
ds_map_add(ds_gun[index], "ammo",			4);
ds_map_add(ds_gun[index], "automatic",		false);
ds_map_add(ds_gun[index], "reload_time",	room_speed * 2);
ds_map_add(ds_gun[index], "recoil",			10);
ds_map_add(ds_gun[index], "recoil_push",	2);
ds_map_add(ds_gun[index], "sound_shoot",	snd_rpg_shoot);
ds_map_add(ds_gun[index], "bullet_type",	obj_rpgbullet);
ds_map_add(ds_gun[index], "bullet_amount",	1);
ds_map_add(ds_gun[index], "damage",			25);
ds_map_add(ds_gun[index], "firerate",		6);
ds_map_add(ds_gun[index], "bullet_speed",	5);
ds_map_add(ds_gun[index], "bullet_spread",	6);
ds_map_add(ds_gun[index], "laser_sight",	false);

ds_map_add(ds_gun[index], "enemy_firerate", 100);
ds_map_add(ds_gun[index], "enemy_damage",	25);
ds_map_add(ds_gun[index], "enemy_bullet",   obj_rpgbullet);
ds_map_add(ds_gun[index], "enemy_bullet_speed", 2.7);
ds_map_add(ds_gun[index], "enemy_shoot_radius", 180);
#endregion
#region M2-2
index = gun_type.m2_2;
ds_gun[index] = ds_map_create();
ds_map_add(ds_gun[index], "object",			obj_m2_2);
ds_map_add(ds_gun[index], "sprite",			spr_m2_2);
ds_map_add(ds_gun[index], "mag",			50);
ds_map_add(ds_gun[index], "ammo",			50);
ds_map_add(ds_gun[index], "automatic",		true);
ds_map_add(ds_gun[index], "reload_time",	room_speed * 2);
ds_map_add(ds_gun[index], "recoil",			3);
ds_map_add(ds_gun[index], "recoil_push",	0.1);
ds_map_add(ds_gun[index], "sound_shoot",	snd_nothing);
ds_map_add(ds_gun[index], "bullet_type",	obj_m2_2_bullet);
ds_map_add(ds_gun[index], "bullet_amount",	1);
ds_map_add(ds_gun[index], "damage",			8);
ds_map_add(ds_gun[index], "firerate",		1);
ds_map_add(ds_gun[index], "bullet_speed",	0.2);
ds_map_add(ds_gun[index], "bullet_spread",	10);
ds_map_add(ds_gun[index], "laser_sight",	false);

ds_map_add(ds_gun[index], "enemy_firerate", 0);
ds_map_add(ds_gun[index], "enemy_damage",	0);
ds_map_add(ds_gun[index], "enemy_bullet",   obj_bullet);
ds_map_add(ds_gun[index], "enemy_bullet_speed", 1);
ds_map_add(ds_gun[index], "enemy_shoot_radius", 100);
#endregion

