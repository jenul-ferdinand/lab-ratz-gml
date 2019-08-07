/// @desc scr_guns_init()
/// @param index

var index = argument[0];
var gun_map = ds_gun[index];
sprite = gun_map[? "sprite"];
pickup = gun_map[? "pickup"];
mag = gun_map[? "mag"];
ammo = gun_map[? "ammo"];
automatic = gun_map[? "automatic"];
recoil = gun_map[? "recoil"];
recoil_push = gun_map[? "recoil_push"];
reload_time = gun_map[? "reload_time"];
bullet = gun_map[? "bullet_type"];
bullet_amount = gun_map[? "bullet_amount"];
bullet_speed = gun_map[? "bullet_speed"];
bullet_spread = gun_map[? "bullet_spread"];
firerate = gun_map[? "firerate"];
sound_shoot = gun_map[? "sound_shoot"];
damage = gun_map[? "damage"];

