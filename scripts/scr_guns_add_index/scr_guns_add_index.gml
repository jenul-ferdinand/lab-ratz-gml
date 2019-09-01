/// @description scr_guns_add_index()
/// @param index
/// @param object
/// @param sprite
/// @param mag
/// @param ammo
/// @param automatic?
/// @param reload time
/// @param recoil
/// @param recoil push
/// @param shoot sound
/// @param damage
/// @param firerate
/// @param laser sight?
/// @param bullet type
/// @param bullet amount
/// @param bullet speed
/// @param bullet spread
/// @param bullet buffer
/// @param bullet vertex
/// @param enemy firerate
/// @param enemy damage
/// @param enemy bullet speed
/// @param enemy shoot radius
var index = argument[0];
var object = argument[1];
var sprite = argument[2];
var mag = argument[3];
var ammo = argument[4];
var automatic = argument[5];
var reload_time = argument[6];
var recoil = argument[7];
var recoil_push = argument[8];
var shoot_sound = argument[9];
var damage = argument[10];
var firerate = argument[11];
var laser_sight = argument[12];
var bullet_type = argument[13];
var bullet_amount = argument[14];
var bullet_speed = argument[15];
var bullet_spread = argument[16];
var bullet_buffer = argument[17];
var bullet_vertex = argument[18];
var enemy_firerate = argument[20];
var enemy_damage = argument[21];
var enemy_bullet_speed = argument[22];
var enemy_shoot_radius = argument[23];

ds_gun[index] = ds_map_create();
ds_map_add(ds_gun[index], "object",	object);
ds_map_add(ds_gun[index], "sprite",	sprite);
ds_map_add(ds_gun[index], "mag", mag);
ds_map_add(ds_gun[index], "ammo", ammo);
ds_map_add(ds_gun[index], "automatic", automatic);
ds_map_add(ds_gun[index], "reload_time", reload_time);
ds_map_add(ds_gun[index], "recoil", recoil);
ds_map_add(ds_gun[index], "recoil_push", recoil_push);
ds_map_add(ds_gun[index], "sound_shoot", shoot_sound);
ds_map_add(ds_gun[index], "damage", damage);
ds_map_add(ds_gun[index], "firerate", firerate);
ds_map_add(ds_gun[index], "laser_sight", laser_sight);
ds_map_add(ds_gun[index], "bullet_type", bullet_type);
ds_map_add(ds_gun[index], "bullet_amount", bullet_amount);
ds_map_add(ds_gun[index], "bullet_speed", bullet_speed);
ds_map_add(ds_gun[index], "bullet_spread", bullet_spread);
ds_map_add(ds_gun[index], "bullet_buffer", bullet_buffer);
ds_map_add(ds_gun[index], "bullet_vertex", bullet_vertex);

ds_map_add(ds_gun[index], "enemy_firerate", enemy_firerate);
ds_map_add(ds_gun[index], "enemy_damage", enemy_damage);
ds_map_add(ds_gun[index], "enemy_bullet_speed", enemy_bullet_speed);
ds_map_add(ds_gun[index], "enemy_shoot_radius",	enemy_shoot_radius);