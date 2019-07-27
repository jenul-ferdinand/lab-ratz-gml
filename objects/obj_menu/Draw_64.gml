if (!pause) exit;

var g_width = window_width;
var g_height = window_height;

var ds_grid = menu_pages[page];
var ds_height = ds_grid_height(ds_grid);

var x_buffer = 100;
var y_buffer = 128;
var y_start = (g_height/2) - (((ds_height -  1) / 2) * y_buffer)
var x_start = g_width / 2;

// Draw menu back
var c = c_black;
draw_rectangle_colour(0, 0, g_width, g_height, c,c,c,c, false);

// Draw elements on the left side
draw_set_halign(fa_right);
draw_set_valign(fa_middle);

var ltx = x_start - x_buffer;
var x_offset;

for (var yy = 0; yy < ds_height; yy++)
{
	var lty = y_start + (yy * y_buffer);
	draw_set_font(fnt_menu)
	x_offset = 0;
	c = c_white;
	if (yy == menu_option[page])
	{
		c = c_orange;
		x_offset = x_buffer/2;
	}
	draw_text_colour(ltx - x_offset, lty, ds_grid[# 0, yy], c,c,c,c, 1);
}

// Draw dividing line
draw_line(x_start, y_start - y_buffer, x_start, lty + y_buffer);

// Draw elements on right side
draw_set_halign(fa_left);

var rtx = x_start + x_buffer;
var rty;
for (var yy = 0; yy < ds_height; yy++)
{
	rty = y_start + (yy * y_buffer);

	switch (ds_grid[# 1, yy])
	{
		case menu_type.shift:
			var current_val = ds_grid[# 3, yy];
			var current_array = ds_grid[# 4, yy];
			var left_shift = "<< ";
			var right_shift = " >>";

			if (current_val == 0) { left_shift = ""; }
			if (current_val == array_length_1d(ds_grid[# 4, yy]) - 1) { right_shift = ""; }
			//current_val = clamp(current_val, 0, array_length_1d(ds_grid[# 4, yy]) - 1);

			c = c_white;
			if (inputting) and (yy == menu_option[page]) { c = c_yellow };
			draw_text_colour(rtx, rty, left_shift + current_array[current_val] + right_shift, c,c,c,c, 1);
			break;

		case menu_type.slider:
			var len = 250;
			var current_val = ds_grid[# 3, yy];
			var current_array = ds_grid[# 4, yy];
			var circle_pos = ((current_val - current_array[0]) / (current_array[1] - current_array[0]));
			c = c_white;

			draw_line_width(rtx, rty, rtx + len, rty, 6);
			if (inputting) and (yy == menu_option[page]) { c = c_yellow };
			draw_circle_colour(rtx + (circle_pos * len), rty, 18, c,c, false);
			draw_text_colour(rtx + (len * 1.2), rty, string(floor(circle_pos * 100)) + "%", c,c,c,c, 1);
			break;

		case menu_type.toggle:
			var current_val = ds_grid[# 3, yy];
			var c1, c2;
			c = c_white;
			if (inputting) and (yy == menu_option[page]) { c = c_yellow };
			
			if (current_val == 0) { c1 = c; c2 = c_dkgray; }
			else { c1 = c_dkgray; c2 = c; }

			draw_text_colour(rtx, rty, "ON", c1,c1,c1,c1, 1);
			draw_text_colour(rtx + 128, rty, "OFF", c2,c2,c2,c2, 1);
			break;

		case menu_type.input:
			var current_val = ds_grid[# 3, yy];
			var string_val;

			switch (current_val)
			{
				case vk_up: string_val = "UP KEY"; break;
				case vk_left: string_val = "LEFT KEY"; break;
				case vk_down: string_val = "DOWN KEY"; break;
				case vk_right: string_val = "RIGHT KEY"; break;
				case mb_left: string_val = "MOUSE_LEFT"; break;
				default: string_val = chr(current_val); break;
			}

			c = c_white;
			if (inputting) and (yy == menu_option[page]) { c = c_yellow };
			draw_text_colour(rtx, rty, string_val, c,c,c,c, 1);

			break;
	}
}

draw_set_font(-1);
draw_set_valign(fa_top);
