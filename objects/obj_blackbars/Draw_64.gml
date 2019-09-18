// Debug
if (debug)
{
	if (keyboard_check_pressed(ord("G"))) { slide_in = true; }
	if (keyboard_check_pressed(ord("H"))) { slide_out = true; }
}

// Drawing bars
draw_set_colour(bar_colour);
draw_rectangle(0, 0, window_width, bar_height, false);
draw_rectangle(0, window_height, window_width, window_height - bar_height, false);
draw_set_colour(c_white);

// Drawing objective subtitles
if (bar_height >= bar_height_max/2) { camera_subtitles(); }