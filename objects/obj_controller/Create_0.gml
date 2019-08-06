#macro RIGHT 0
#macro UP 1
#macro LEFT 2
#macro DOWN 3
// Binds
globalvar pause, bind_drop, bind_flashlight, bind_revert, bind_enter, bind_left, bind_right, bind_up, bind_down, bind_shoot, bind_reload;
pause = true;
bind_drop = ord("Q");
bind_flashlight = ord("F");
bind_revert = ord("X");
bind_enter = vk_enter;
bind_left = ord("A");
bind_right = ord("D");
bind_up = ord("W");
bind_down = ord("S");
bind_shoot = mb_left;
bind_reload = ord("R");
// Play soundtrack
audio_play_sound(snd_soundtrack, 0, 0);

// Gun Map
globalvar ds_gun;
enum gun_type
{
	ak47,
	acr300,
	desert_eagle,
	ray_gun,
	seneca,
}
var index;
// AK47
index = gun_type.ak47;
ds_gun[index] = ds_map_create();
ds_map_add(ds_gun[index], "sprite", spr_ak47);
ds_map_add(ds_gun[index], "pickup", obj_ak47_pickup);
ds_map_add(ds_gun[index], "mag", 30);
ds_map_add(ds_gun[index], "ammo", 90);
ds_map_add(ds_gun[index], "automatic", true);
ds_map_add(ds_gun[index], "reload_time", room_speed * 1.5);
ds_map_add(ds_gun[index], "recoil", 8);
ds_map_add(ds_gun[index], "recoil_push", 1.7);
ds_map_add(ds_gun[index], "sound_shoot", snd_ak47_shoot);
ds_map_add(ds_gun[index], "bullet_type", obj_bullet);
ds_map_add(ds_gun[index], "bullet_amount", 1);
ds_map_add(ds_gun[index], "damage", 47);
ds_map_add(ds_gun[index], "firerate", 8);
ds_map_add(ds_gun[index], "bullet_speed", 3);
ds_map_add(ds_gun[index], "bullet_spread", 7);

ds_map_add(ds_gun[index], "enemy_firerate", 20);
ds_map_add(ds_gun[index], "enemy_damage", 16);
// ACR-300
index = gun_type.acr300;
ds_gun[index] = ds_map_create();
ds_map_add(ds_gun[index], "sprite", spr_acr300);
ds_map_add(ds_gun[index], "pickup", obj_acr300_pickup);
ds_map_add(ds_gun[index], "mag", 24);
ds_map_add(ds_gun[index], "ammo", 96);
ds_map_add(ds_gun[index], "automatic", true);
ds_map_add(ds_gun[index], "reload_time", room_speed * 1.5);
ds_map_add(ds_gun[index], "recoil", 4);
ds_map_add(ds_gun[index], "recoil_push", 0.4);
ds_map_add(ds_gun[index], "sound_shoot", snd_acr300_shoot);
ds_map_add(ds_gun[index], "bullet_type", obj_bullet);
ds_map_add(ds_gun[index], "bullet_amount", 1);
ds_map_add(ds_gun[index], "damage", 43);
ds_map_add(ds_gun[index], "firerate", 5);
ds_map_add(ds_gun[index], "bullet_speed", 3);
ds_map_add(ds_gun[index], "bullet_spread", 7);

ds_map_add(ds_gun[index], "enemy_firerate", 23);
ds_map_add(ds_gun[index], "enemy_damage", 14);
// Seneca
index = gun_type.seneca;
ds_gun[index] = ds_map_create();
ds_map_add(ds_gun[index], "sprite", spr_seneca);
ds_map_add(ds_gun[index], "pickup", obj_seneca_pickup);
ds_map_add(ds_gun[index], "mag", 8);
ds_map_add(ds_gun[index], "ammo", 24);
ds_map_add(ds_gun[index], "automatic", false);
ds_map_add(ds_gun[index], "reload_time", room_speed * 1.5);
ds_map_add(ds_gun[index], "recoil", 10);
ds_map_add(ds_gun[index], "recoil_push", 2);
ds_map_add(ds_gun[index], "sound_shoot", snd_seneca_shoot);
ds_map_add(ds_gun[index], "bullet_type", obj_bullet);
ds_map_add(ds_gun[index], "bullet_amount", 2);
ds_map_add(ds_gun[index], "damage", 47);
ds_map_add(ds_gun[index], "firerate", 5);
ds_map_add(ds_gun[index], "bullet_speed", 3);
ds_map_add(ds_gun[index], "bullet_spread", 7);

ds_map_add(ds_gun[index], "enemy_firerate", 20);
ds_map_add(ds_gun[index], "enemy_damage", 16);
// Ray Gun
index = gun_type.ray_gun;
ds_gun[index] = ds_map_create();
ds_map_add(ds_gun[index], "sprite", spr_raygun);
ds_map_add(ds_gun[index], "pickup", obj_raygun_pickup);
ds_map_add(ds_gun[index], "mag", 12);
ds_map_add(ds_gun[index], "ammo", 48);
ds_map_add(ds_gun[index], "automatic", false);
ds_map_add(ds_gun[index], "reload_time", room_speed * 1.5);
ds_map_add(ds_gun[index], "recoil", 12);
ds_map_add(ds_gun[index], "recoil_push", 0.4);
ds_map_add(ds_gun[index], "sound_shoot", snd_raygun_shoot);
ds_map_add(ds_gun[index], "bullet_type", obj_laser);
ds_map_add(ds_gun[index], "bullet_amount", 1);
ds_map_add(ds_gun[index], "damage", 64);
ds_map_add(ds_gun[index], "firerate", 5);
ds_map_add(ds_gun[index], "bullet_speed", 3);
ds_map_add(ds_gun[index], "bullet_spread", 7);

ds_map_add(ds_gun[index], "enemy_firerate", 20);
ds_map_add(ds_gun[index], "enemy_damage", 16);
// Desert Eagle
index = gun_type.desert_eagle;
ds_gun[index] = ds_map_create();
ds_map_add(ds_gun[index], "sprite",	spr_deserteagle);
ds_map_add(ds_gun[index], "pickup", obj_deserteagle_pickup);
ds_map_add(ds_gun[index], "mag", 7);
ds_map_add(ds_gun[index], "ammo", 14);
ds_map_add(ds_gun[index], "automatic", false);
ds_map_add(ds_gun[index], "reload_time", room_speed * 1.5);
ds_map_add(ds_gun[index], "recoil", 12);
ds_map_add(ds_gun[index], "recoil_push", 2);
ds_map_add(ds_gun[index], "sound_shoot", snd_desert_eagle);
ds_map_add(ds_gun[index], "bullet_type", obj_bullet);
ds_map_add(ds_gun[index], "bullet_amount", 1);
ds_map_add(ds_gun[index], "damage", 65);
ds_map_add(ds_gun[index], "firerate", 8);
ds_map_add(ds_gun[index], "bullet_speed", 3);
ds_map_add(ds_gun[index], "bullet_spread", 7);

ds_map_add(ds_gun[index], "enemy_firerate", 30);
ds_map_add(ds_gun[index], "enemy_damage", 23);