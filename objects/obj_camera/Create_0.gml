// Camera init
camera_init();

// Zoom
zoom_default = 0.5;
zoom_min = 0.1;
zoom = zoom_default;
zoom_in = false;
zoom_out = false;

// Shake
globalvar shake;
shake = 0;

// Other
hp_draw = 0;
points_draw = 0;
ammo_draw = 0;
puzzle_complete = false;

// Subtitles
objective = undefined;
draw_subtitles = false;
subtitle_colour = make_colour_rgb(255, 216, 0);
subtitle_ybuffer = 100;
subtitle_x = window_width / 2;
subtitle_y = window_height - subtitle_ybuffer;
subtitle[objective_state.annihilate] = "\"annihilate all enemy scientists!\"";
subtitle[objective_state.simon] = "\"click the colours in order\"";
subtitle[objective_state.door_locked] = "\"this door is locked\"";

// Interaction text
draw_interaction_text = false;
interact_cost = undefined;

