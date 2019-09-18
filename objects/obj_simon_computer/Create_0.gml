randomise();

depth = obj_depth.depth-1;



// State
turns = 2;
max_turns = 5;
state = "Idle";
state_counter = 0;
state_counter_start = false;
added = false;

// Sound
complete_soundtrack = snd_soundtrack_complete_simon;
complete_soundtrack_played = false;

// Interaction
target_door = undefined;
interacted = false;
interact_distance = 64;

// Buttons
button_sprite[col.green] = spr_simon_green;
button_sprite[col.blue] = spr_simon_blue;
button_sprite[col.red] = spr_simon_red;
button_sprite[col.yellow] = spr_simon_yellow;
button_sprite_default[col.green] = spr_simon_green;
button_sprite_default[col.blue] = spr_simon_blue;
button_sprite_default[col.red] = spr_simon_red;
button_sprite_default[col.yellow] = spr_simon_yellow;
button_sprite_press[col.green] = spr_simon_green_pressed;
button_sprite_press[col.blue] = spr_simon_blue_pressed;
button_sprite_press[col.red] = spr_simon_red_pressed;
button_sprite_press[col.yellow] = spr_simon_yellow_pressed;
button_width = sprite_get_width(spr_simon_green);
button_height = sprite_get_height(spr_simon_green);
button_xbuffer = button_width + 20;
button_ybuffer = -100;
button_height_max = 300;
button_height_min = button_ybuffer;
buttons_slide_in = false;
buttons_slide_out = false;

// Player
player_list = ds_list_create();
player_max_turns = turns;
player_turns = 0;
incremented_turns = false;
player_picked[col.green] = false;
player_picked[col.blue] = false;
player_picked[col.red] = false;
player_picked[col.yellow] = false;

// Simon
simon_list = ds_list_create();
simon_colour = undefined;
simon_counter = 0;
simon_turns = 0;
simon_turn_time = 120;
simon_max_turns = turns;
simon_picked[col.green] = false;
simon_picked[col.blue] = false;
simon_picked[col.red] = false;
simon_picked[col.yellow] = false;

// Lighting
buffer = 16;
xcoord = 7;
ycoord = 7;
inner_radius = 5;
outer_radius = 10;
shake_amount = 1;
light_counter_start = false;
light_counter = 0;
light_time = 23;
green_light_xbuffer = xcoord;
green_light_ybuffer = ycoord;
green_light_low_inner_colour = make_colour_rgb(0, 43, 6);
green_light_low_outer_colour = make_colour_rgb(0, 26, 4);
green_light_high_inner_colour = make_colour_rgb(34, 255, 0);
green_light_high_outer_colour = make_colour_rgb(24, 179, 0);
blue_light_xbuffer = xcoord + buffer;
blue_light_ybuffer = ycoord;
blue_light_low_inner_colour = make_colour_rgb(0, 22, 46);
blue_light_low_outer_colour = make_colour_rgb(0, 15, 31);
blue_light_high_inner_colour = make_colour_rgb(0, 128, 255);
blue_light_high_outer_colour = make_colour_rgb(0, 77, 153);
red_light_xbuffer = xcoord + (buffer*2);
red_light_ybuffer = ycoord;
red_light_low_inner_colour = make_colour_rgb(25, 0, 0);
red_light_low_outer_colour = make_colour_rgb(15, 0, 0);
red_light_high_inner_colour = make_colour_rgb(255, 8, 0);
red_light_high_outer_colour = make_colour_rgb(163, 5, 0);
yellow_light_xbuffer = xcoord + (buffer*3);
yellow_light_ybuffer = ycoord;
yellow_light_low_inner_colour = make_colour_rgb(38, 41, 0);
yellow_light_low_outer_colour = make_colour_rgb(26, 28, 0);
yellow_light_high_inner_colour = make_colour_rgb(255, 247, 0);
yellow_light_high_outer_colour = make_colour_rgb(156, 151, 0);



