// Reseting the light
if (light_counter_start) { light_counter++; }
if (light_counter >= light_time) 
{
	// Set simon_picked colours to false
	for (var i = 0; i < 4; i++)
	{
		simon_picked[i] = false;
		player_picked[i] = false;
	}
	
	// Reset
	added = false;
	light_counter = 0;
	light_counter_start = false;
	incremented_turns = false;
}

// Starting the game
if (point_distance(x, y, obj_player.x, obj_player.y) < interact_distance) and (!interacted)
{
	// Change state
	state = "Pick Colour";
	// Freeze player
	obj_player.freeze = true;
	// Black bars
	bars = instance_create_depth(x, y, -1000, obj_blackbars);
	bars.slide_in = true;
	// Objective Subtitles
	execute_objective(objective_state.simon);
	
	// Reset
	for (var i = 0; i < 4; i++) { simon_picked[i] = false; }
	simon_counter = 0;
	interacted = true;
}
// Cancel
if (keyboard_check_pressed(vk_escape)) and (obj_player.freeze) and (!target_door.complete)
{
	// Clear objective subtitles
	execute_objective(undefined);
	// Bars
	bars.slide_out = true;
	// Change state
	state = "Idle";
	// Buttons slide out animation
	buttons_slide_out = true;
	// Unfreeze player
	obj_player.freeze = false;
	// Restart stage
	stage = 0;
	
	// Knockback player
	with (obj_player)
	{
		force_dir = 270;
		force_applied = 3;
	}
	interacted = false;
}

switch (state)
{
	case "Idle":
		// Sine colour wave
		simon_colour = round(scr_wave(0, 3, 3, 0));
		// Timing
		simon_counter++
		if (simon_counter >= 5) 
		{
			simon_picked[simon_colour] = true;
			simon_counter = 0;
		}
		break;
		
	case "Pick Colour":
		// Choose a colour
		simon_colour = choose(col.green, col.blue, col.red, col.yellow);
		// Debug
		show_debug_message("Simon Picked: " + string(simon_colour));
		
		#region Sound effect (beep)
		var simon_beep = audio_play_sound(snd_simon, 0, 0);
		var simon_pitch;
		switch (simon_colour)
		{
			case col.green: simon_pitch = 0.9; break;
			case col.blue: simon_pitch = 0.95; break;
			case col.red: simon_pitch = 1.05; break;
			case col.yellow: simon_pitch = 1.1; break;
		}
		audio_sound_pitch(simon_beep, simon_pitch);
		#endregion
		
		// Transition
		if (simon_colour != undefined) { state = "Save Colour"; }
		break;
		
	case "Save Colour":
		// Add the colour to the list
		ds_list_add(simon_list, simon_colour);
		// Transition
		state = "Display Colour";
		break;
		
	case "Display Colour":
		// Show the colour
		simon_picked[simon_colour] = true;
		// Transition
		simon_counter++;
		if (simon_counter >= simon_turn_time)
		{
			state = "Loop";
			simon_counter = 0;
		}
		break;
		
	case "Loop":
		// Increment simon's turns
		simon_turns++;
		
		// Transition
		if (simon_turns < simon_max_turns) { state = "Pick Colour"; } 
		else 
		{ 
			state = "Player Pick"; 
			buttons_slide_in = true;
		} 
		break;
		
	case "Player Pick":
		// Loop all 4 colours
		for (var i = 0; i < 4; i++)
		{
			// If the player has picked the current colour (i):
			if (player_picked[i])
			{
				// Adding the pressed colour to the list
				if (!added) 
				{
					// Debug
					show_debug_message("Player Picked: " + string(i));
					// Add to list
					ds_list_add(player_list, i);
					// Approve
					added = true;
				}
				
				// Pressed sprite
				button_sprite[i] = button_sprite_press[i];
				
				#region Sound effect (beep)
				if (!audio_is_playing(snd_simon)) 
				{ 
					var player_beep = audio_play_sound(snd_simon, 0, 0);
					var player_pitch;
					switch (i)
					{
						case col.green: player_pitch = 0.9; break;
						case col.blue: player_pitch = 0.95; break;
						case col.red: player_pitch = 1.05; break;
						case col.yellow: player_pitch = 1.1; break;
					}
					audio_sound_pitch(player_beep, player_pitch);
				} 
				#endregion
				
				// Start light counter
				light_counter_start = true;
				
				// Increment player turns
				if (!incremented_turns)
				{
					player_turns++;
					incremented_turns = true;
				}
			}
			else
			{
				// Default sprite
				button_sprite[i] = button_sprite_default[i];
			}	
		}
		
		// Transitioning
		if (player_turns >= player_max_turns) 
		{
			// Reset
			simon_turns = 0;
			player_turns = 0;
			
			// Animation
			buttons_slide_out = true;
			
			// If all correct
			for (var i = 0; i < 4; i++)
			{
				if (player_list[| i] == simon_list[| i])
				{
					// Changing state
					state_counter_start = true;
					// Clear list
					ds_list_clear(player_list)
					ds_list_clear(simon_list)
				}
				else
				{
					// Kickout player and reset if incorrect
					simon_kickout();
					
					// Clear objective subtitles
					execute_objective(undefined);
				}
			}
			
		}
		
		// Incrementing stage level
		if (state_counter_start) { state_counter++; }
		if (state_counter >= 30)
		{
			// Increment max turns
			simon_max_turns++;
			player_max_turns++;
			// Change state and reset variables
			state = "Pick Colour";
			state_counter = 0;
			state_counter_start = false;
		}
		
		// Finishing
		if (player_max_turns >= max_turns) or (simon_max_turns >= max_turns)
		{
			// Clear objective subtitles
			execute_objective(undefined);
			// Unlock next door
			target_door.complete = true;
			// Execute completion
			interacted = true;
			state = "Idle";
			// Knockback
			apply_force_player(270, 5);
			// Clear lists
			ds_list_clear(player_list);
			ds_list_clear(simon_list);
			
			// Play complete soundtrack
			if (!complete_soundtrack_played)
			{
				audio_play_sound(complete_soundtrack, 0, 0);
				complete_soundtrack_played = true;
			}
		}
		break;
}

// Completion cutscene
if (target_door.complete)
{
	if (audio_is_playing(complete_soundtrack))
	{
		// Draw puzzle complete text
		obj_camera.puzzle_complete = true;
		// Zoom in camera towards player
		obj_camera.zoom_in = true;
		// Freeze player
		obj_player.freeze = true;
	}	
	else
	{
		// Stop drawing the text
		obj_camera.puzzle_complete = false;
		// Slide out black bars
		bars.slide_out = true;
		// Zoom out camera from player
		obj_camera.zoom_out = true;
		// Unfreeze player
		obj_player.freeze = false;
	}
}