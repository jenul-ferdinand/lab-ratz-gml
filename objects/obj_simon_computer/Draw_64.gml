// Slide in
if (buttons_slide_in)
{
	// Increase button y location
	button_ybuffer += 10;
	// Stopping at specified limit
	if (button_ybuffer >= button_height_max)
	{
		button_ybuffer = button_height_max;
		buttons_slide_in = false;
	}
}
// Slide out
if (buttons_slide_out)
{
	// Decrease button y location
	button_ybuffer -= 10;
	// Stopping at specified limit
	if (button_ybuffer <= button_height_min)
	{
		button_ybuffer = button_height_min;
		buttons_slide_out = false;
	}
}

// Drawing the buttons
button_x = (window_width/2) - (button_width*2)-28;
button_y = window_height - button_ybuffer;
draw_sprite(button_sprite[col.green], 0, button_x, button_y);
draw_sprite(button_sprite[col.blue], 0, button_x + button_xbuffer, button_y);
draw_sprite(button_sprite[col.red], 0, button_x + (button_xbuffer*2), button_y);
draw_sprite(button_sprite[col.yellow], 0, button_x + (button_xbuffer*3), button_y);

// Mouse tracking and pressing
var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);
var mouseb = mouse_check_button_pressed(mb_left);
if (state == "Player Pick")
{
	if (point_in_rectangle(mx, my, button_x, button_y, button_x + button_width, button_y + button_height)) 
	{
		if (mouseb) and (!player_picked[col.green])
		{
			player_picked[col.green] = true;
		}
	}
	if (point_in_rectangle(mx, my, (button_x + button_xbuffer), button_y, (button_x + button_xbuffer) + button_width, button_y + button_height)) 
	{
		if (mouseb) and (!player_picked[col.blue])
		{
			player_picked[col.blue] = true;
		}
	}
	if (point_in_rectangle(mx, my, (button_x + button_xbuffer*2), button_y, (button_x + button_xbuffer*2) + button_width, button_y + button_height)) 
	{
		if (mouseb) and (!player_picked[col.red])
		{
			player_picked[col.red] = true;
		}
	}
	if (point_in_rectangle(mx, my, (button_x + button_xbuffer*3), button_y, (button_x + button_xbuffer*3) + button_width, button_y + button_height)) 
	{
		if (mouseb) and (!player_picked[col.yellow])
		{
			player_picked[col.yellow] = true;
		}
	}
}