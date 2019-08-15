/// @desc scr_guns_init()
/// @param index

var index = argument[0];
var gun_map = ds_gun[index];

// Default
holder = obj_player;
destroy = false;
object = gun_map[? "object"];
sprite = gun_map[? "sprite"];
damage = gun_map[? "damage"];
sound_shoot = gun_map[? "sound_shoot"];

// Dropped
state = "Dropped";
drop = false;
drop_dir = undefined;
drop_spd_max = 4;
drop_spd = drop_spd_max;
colliding = [obj_wall_bottom, obj_wall_top];
unpickable = false;
unpickable_counter = 0;
unpickable_time = 30;
shadow_yscale = 0.6;
shadow_colour = c_black;
shadow_alpha = 0.4;
hover_y1 = 10;
hover_y2 = 18;

// Muzzle Flash
muzzle_flash = false;

// Flashlight
flash_light = false;
flash_light_fov = 45;
flash_light_toggle = false;
flash_light_distance = 425;
flash_light_brightness = c_ltgray;

// Lasersight
laser_sight_toggle = false;
laser_sight = gun_map[? "laser_sight"];
laser_colour = c_red;

// Cooldowns
firerate = gun_map[? "firerate"];
cooldown = 0;
cooldown_delay = -1;
cooldown_startup = 2;

// Bullet
automatic = gun_map[? "automatic"];
bullet = gun_map[? "bullet_type"];
bullet_amount = gun_map[? "bullet_amount"];
bullet_speed = gun_map[? "bullet_speed"];
bullet_spread = gun_map[? "bullet_spread"];
bullet_buffer = 18;
bullet_spread_new = bullet_spread - 2;

// Recoil
recoil = gun_map[? "recoil"];
recoil_push = gun_map[? "recoil_push"];
current_recoil = -1;

// Ammo
mag = gun_map[? "mag"];
ammo = gun_map[? "ammo"];
reload = false;
reload_time = gun_map[? "reload_time"];
reload_played = false;
reload_counter = 0;
reload_counter_start = false;
mag_max = mag;
mag_save = undefined;

// Lighting
lighting_inner_colour = c_white;
lighting_outer_colour = c_dkgray;
lighting_inner_radius = 7;
lighting_outer_radius = 14;
lighting_shake_amount = 1;



