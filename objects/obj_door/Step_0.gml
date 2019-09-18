var player_distance = point_distance(x, y, obj_player.x, obj_player.y);

// Normal colour
if (normal)
{
	lighting_type = col.green;
	if (player_distance < interact_distance) { open = true; } 
}
else
{
	// Simon game
	if (simon)
	{
		if (simon_complete)
		{
			simon = false;
			normal = true;
		}
		else
		{
			lighting_type = col.red;
		}	
	}
}

// Lighting colour switch
switch (lighting_type)
{
	case col.red:
		lighting_inner_colour = make_colour_rgb(255, 0, 0);
		lighting_outer_colour = make_colour_rgb(153, 0, 0);
		break;
		
	case col.green:
		lighting_inner_colour = make_colour_rgb(0, 176, 82);
		lighting_outer_colour = make_colour_rgb(0, 105, 49);
		break;
}

// Open anim
if (open)
{
	image_speed = 1;
	if (image_index >= image_number-1)
	{
		image_index = image_number-1;
		image_speed = 0;
		enterable = true;
		open = false;
	}
}


// Entering next room
if (enterable)
{
	if (instance_place(x, y+1, obj_player))
	{
		script_execute(transition, transfer, goal_x, goal_y);
	}	
}