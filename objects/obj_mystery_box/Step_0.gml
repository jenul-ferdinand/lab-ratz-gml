var player_distance = point_distance(x, y, obj_player.x, obj_player.y);
var interact_key = keyboard_check_pressed(bind_interact);

// Player interaction
if (player_distance <= interact_distance) 
{
	// Interaction text
	with (obj_camera) 
	{
		draw_interaction_text = true;
		interact_cost = other.interact_cost;
	}
	
	// Interact
	if (interact_key) and (!anim_open_box) and (!anim_close_box) and (points >= interact_cost)
	{
		// Start open box animation
		anim_open_box = true;
		
		// Reduce points
		points -= interact_cost;
	}
}
else
{
	// Stop drawing interaction text
	with (obj_camera)
	{
		draw_interaction_text = false;
		interact_cost = undefined;
	}
}

#region Opening animation
if (anim_open_box) and (!anim_close_box)
{
	// Interpolate yaxis up
	top_yaxis = lerp(top_yaxis, top_vertex, 0.1);
	
	// If yaxis is on vertex
	if (top_yaxis >= top_vertex-1)
	{
		// Execute
		top_yaxis = top_vertex;
		
		// Stop opening animation
		anim_open_box = false;
		
		// Start wave animation
		anim_wave_top = true;
	}	
}
#endregion

#region Closing animation
if (anim_close_box) and (!anim_open_box)
{
	// Interpolate yaxis down
	top_yaxis = lerp(top_yaxis, top_min, 0.1);
	
	// If yaxis is minimum
	if (top_yaxis <= top_min+1)
	{
		// Execute
		top_yaxis = top_min;
		
		// Stop closing animation
		anim_close_box = false;
	}
}
#endregion

#region Floating animation
if (anim_wave_top)
{
	// Start gun cycle animation
	anim_guncycle = true;
	
	// Sine wave yaxis
	top_yaxis = scr_wave(top_vertex, top_vertex-2, 1, 0);	
}
#endregion

#region Gun cycle animation
if (anim_guncycle)
{
	// If we havent looped more than the maximum
	if (index_loop <= index_maxloops)
	{
		// Start incrementation of the counter
		index_counter++;
		
		// Timed loop
		if (index_counter >= index_time)
		{
			// Increment the index
			index++;
			
			// Reset the counter
			index_counter = 0;
			
			// Make sure the index loops after it reaches the max
			if (index > index_max-1)
			{
				// Reset
				index = 0;
				
				// Increment the amount of times the index has looped
				index_loop++;
			}
		}
	}
	else
	{
		// Picking a random gun
		if (!index_choose)
		{
			// Choose a random index
			index = random_range(0, index_max);
			
			// Confirm
			index_choose = true;
		}
		else
		{
			// Take the weapon
			if (player_distance <= interact_distance) and (interact_key)
			{
				// Create the gun
				var gun = instance_create_layer(x, y, "instances", gun_objects[index]);
				gun.drop = true;
				gun.drop_dir = 270;
				
				// Stop gun cycle animation
				anim_guncycle = false;
				
				// Stop wave animation
				anim_wave_top = false;
				
				// Close the box
				anim_open_box = false;
				anim_close_box = true;
				
				// Reset the index variables
				index = 0;
				index_counter = 0;
				index_loop = 0;
				index_choose = false;
			}
		}
	}
}
#endregion
