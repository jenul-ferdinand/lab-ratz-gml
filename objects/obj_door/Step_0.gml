if (!keycard)
{
	lighting_inner_colour = make_colour_rgb(0, 176, 82);
	lighting_outer_colour = make_colour_rgb(0, 105, 49);
	if (point_distance(x, y, obj_player.x, obj_player.y) < 76) { open = true; } 
}
else
{
	lighting_inner_colour = make_colour_rgb(255, 0, 0);
	lighting_outer_colour = make_colour_rgb(153, 0, 0);	
}

if (open) { open_anim = true; }
if (open_anim)
{
	x_scale -= 0.05;
	if (x_scale <= 0)
	{
		x_scale = 0;
		
		open_anim = false;
		enterable = true;
	}
}

if (enterable)
{
	if (instance_place(x, y+1, obj_player))
	{
		script_execute(transition, transfer, goal_x, goal_y);
	}	
}