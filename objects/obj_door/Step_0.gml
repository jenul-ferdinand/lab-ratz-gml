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
	if (locked)
	{
		if (complete)
		{
			locked = false;
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
		
		// Subtitle objective message
		if (player_distance < interact_distance/2) 
		{
			if (!freezed)
			{
				// Freeze player
				obj_player.freeze = true;
				// Zoom in to player
				obj_camera.zoom_in = true;
				// Black bars
				blackbars = instance_create_depth(x, y, -1000, obj_blackbars);
				blackbars.slide_in = true;
				// Execute text type
				execute_objective(objective_state.door_locked); 
				
				// Activate
				freezed = true;
				freeze_counter_start = true;
			}
			
			// Start counter
			if (freeze_counter_start) { freeze_counter++; } 
			// Timing
			if (freeze_counter >= freeze_time)
			{
				// Un-Freeze player
				obj_player.freeze = false;
				// Zoom out from player
				obj_camera.zoom_out = true;
				// Black bars
				blackbars.slide_out = true;
				// Execute text type
				execute_objective(undefined); 
				// Bootstrap
				freeze_counter_start = false;
				freeze_counter = 0;
			}	
		}
		else
		{
			// Allow the player to activate it again
			freezed = false;	
		}
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