state = "Dropped";
holder = obj_player;
room_id = room;
destroy = false;
hspd = 0;
vspd = 0;

// Tossing
toss_dir = undefined;
toss_spd = undefined;
toss_lerp = 0.95;
toss_min = 0.25;
explosion_object = undefined;

// Dropped
drop = false;
drop_dir = undefined;
drop_spd_max = 4;
drop_spd = drop_spd_max;
unpickable = false;
unpickable_counter = 0;
unpickable_time = 30;
shadow_yscale = 0.6;
shadow_colour = c_black;
shadow_alpha = 0.4;
hover_y1 = 10;
hover_y2 = 18;