// Values
image_speed = 1;

// Movement
hspd = 0;
vspd = 0;
spd = 2;

// Knockback
hspd_force = 0;
vspd_force = 0;
force_applied = 0;
force_dir = undefined;

// Combat
holding = undefined;
hp = 100;

// Lighting
lighting_inner_colour = make_colour_rgb(40, 40, 40);
lighting_outer_colour = make_colour_rgb(10, 10, 10);
lighting_inner_radius = 50;
lighting_outer_radius = 90;
lighting_shake_amount = 1;
lighting_height_buffer = 10;

// Sprites
normal_sprite = spr_player_normal;
normal_sprite_run = spr_player_normal_run;
radsuit_sprite = spr_player_radsuit;
radsuit_sprite_run = spr_player_radsuit_run;
sprite = radsuit_sprite;
sprite_run = radsuit_sprite_run;

// Audio
audio_listener_orientation(0, 1, 0, 0, 0, 1);