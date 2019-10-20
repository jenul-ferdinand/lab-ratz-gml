if (game_stop) exit;

// Destroy
if (destroy) { instance_destroy(); }

var player_direction = point_direction(x, y, obj_player.x, obj_player.y);
var mouse_dir = point_direction(x, y, mouse_x, mouse_y);

switch (state)
{
	case "Normal":
		// Make the gun centered on the player
		x = holder.x - lengthdir_x(current_recoil, mouse_dir);
		y = (holder.y - 9) - lengthdir_y(current_recoil, mouse_dir);
		
		// Rotate the gun towards the mouse's angle
		image_angle = mouse_dir;
		
		// Flip the gun depending on the players horizontal axis
		if (mouse_dir > 90) and (mouse_dir < 270) { image_yscale = -1; } else { image_yscale = 1; } 
		
		#region Shooting
		// Inputting mouse
		var mouseb;
		if (automatic) { mouseb = mouse_check_button(bind_shoot); } 
		else { mouseb = mouse_check_button_pressed(bind_shoot); }
		// Trigger
		if (mouseb) 
		{
			// Activate cooldown
			if (cooldown == 0)
			{
				cooldown = firerate;
				cooldown_delay = cooldown_startup;
			}
		}
		if (cooldown_delay == 0) and (!obj_player.freeze)
		{
			if (mag != 0)
			{
				// Audio
				var _audio_shoot = audio_play_sound(sound_shoot, 10, false);
				audio_sound_gain(_audio_shoot, 0.5, 0);
				
		
				for (var i = 0; i < bullet_amount; i++)
				{
					// Bullet
					var buffer_x = lengthdir_x(bullet_buffer, mouse_dir);
					var buffer_y = lengthdir_y(bullet_buffer, mouse_dir);
					var inst = instance_create_layer(x + buffer_x, (y - bullet_vertex) + buffer_y, "instances", bullet);
					inst.direction = mouse_dir;
					inst.image_angle = inst.direction;
					inst.speed = bullet_speed;
					inst.bullet_creator = obj_player;
					
					if (bullet_amount == 1) 
					{ 
						// Random Recoil
						inst.direction += random_range(-bullet_spread, bullet_spread+1); 
					}
					else 
					{
						// Double Shot
						var bspread;
						switch (i)
						{
							case 0: bspread = -bullet_spread; break;
							case 1: bspread = bullet_spread; break;
						}
						inst.direction += bspread;
					}
		
					// Ammo
					mag--;
				}
		
				// Recoil push back player
				with (obj_player)
				{
					if (force_applied <= 0)
					{
						force_dir = -inst.direction;
						force_applied = other.recoil_push;
					}
				}
				
				// Screen shake
				shake = recoil/2;
				
				// Muzzle flash activate
				if (do_muzzle_flash) 
				{
					if (muzzle_flash == false) { muzzle_flash = true; } 
				}
			}
			else
			{
				// No ammo sound
				audio_play_sound(snd_noammo, 0, false);	
			}
	
			// Recoil
			current_recoil = recoil;
		}

		// Calculations
		cooldown_delay = max(-1, cooldown_delay-1);
		if (cooldown_delay == -1) { cooldown = max(0, cooldown-1); }
		current_recoil = max(0, floor(current_recoil * 0.8));
		#endregion
		
		// Reloading
		if (mag <= 0) and (!reload) and (ammo > 0) and (!reload_counter_start) and (!mouse_check_button(mb_left))
		{ 
			// If the player pressed the reload key
			if (keyboard_check_pressed(bind_reload))
			{
				// Start the reloading counter
				reload_counter_start = true;
	
				// Player the starting sound of the reload
				audio_play_sound(snd_reload_start, 0, false);
				
				// Slow down player movement
				with (obj_player) { spd = slow_speed; } 
			}
		}
		
		// If the reload_counter_start variable is set to true, increment the reload_counter 
		if (reload_counter_start) { reload_counter++; }
		
		// If the reload_counter has reached the set amount of time
		if (reload_counter >= reload_time/2) 
		{
			// and if the reload has not played
			if (!reload_played)
			{
				// Play the middle sound effect
				audio_play_sound(snd_reload_middle, 0, false);
				
				// Make sure it only plays once
				reload_played = true;
			}
		}
		
		// If the reload_counter has reaches the reload_time
		if (reload_counter >= reload_time) { reload = true; }
		
		// If the reload variable is set to true
		if (reload)
		{
			// Set mag to its max amount
			mag = mag_max;
			// Remove the maximum mag amount from the reserve ammunition
			ammo -= mag_max;
	
			// Play the ending sound effect of the reload
			audio_play_sound(snd_reload_end, 0, false);
			
			// Reset the player's speed, to its default
			with (obj_player) { spd = default_speed; } 
	
			// Reset the reload variable to false
			reload = false;
			// Reset the reload_played sound variable to false
			reload_played = false;
			// Reset the counter variables
			reload_counter = 0;
			reload_counter_start = false;
			// Set mag_save to 0
			mag_save = 0;
		}	
		
		// Flashlight and lasersight toggling
		if (keyboard_check_pressed(bind_flashlight))
		{
			// Toggle laser sight
			if (laser_sight) { laser_sight_toggle = !laser_sight_toggle; }
			// Toggle flash light
			if (flash_light) { flash_light_toggle = !flash_light_toggle; }
		}
		
		// If the gun has a lasersight the gun wont have a flashlight
		if (laser_sight) { flash_light = false; }	
		// If the gun has a flashlight the gun wont have a lasersight
		if (flash_light) { laser_sight = false; }
		
		// Laser sight accuracy increase
		if (laser_sight_toggle) 
		{
			// Make the bulletspread easier
			bullet_spread = bullet_spread_new; 
			
			// Zero recoil push if the laser sight is on
			recoil_push = 0; 
		}
		
		// Dropping gun
		if (droppable) and (!reload_counter_start) and (obj_player.holding != undefined) and (keyboard_check_pressed(bind_drop))
		{
			// Set state to dropped
			state = "Dropped";
					
			// Specifiy which room the gun was dropped in
			room_id = room;
					
			// Drop interpolation activated
			drop = true;
			// Drop interpolation direction
			drop_dir = point_direction(x, y, mouse_x, mouse_y);
					
			// Make the gun unable to be picked up for a short amount of time
			unpickable = true;
					
			// Make the holder noone
			holder = noone;
					
			// Turn off flashlight
			flash_light_toggle = false;
			// Turn off laser sight
			laser_sight_toggle = false;
					
			// Make the player holding variable undefined
			obj_player.holding = undefined;
		}
		break;
	
	case "Dropped":
		// If the current room is the room which the gun was first dropped in.
		if (room == room_id)
		{
			// Reset the image_angle of the dropped weapon to 0
			image_angle = 0;
			
			// Picking up weapon
			if (instance_place(x, y, obj_player)) and (obj_player.holding == undefined) and (!unpickable)
			{
				// Set state to normal
				state = "Normal";
				
				// Set player holding to the dropped object
				obj_player.holding = object;
				// Make the holder of the dropped object, the player
				holder = obj_player;
				
				// Reset vector variables
				hspd = 0;
				vspd = 0;
				
				// Turn off drop interpolation effect
				drop = false;
				// Make the drop interpolation direction undefined
				drop_dir = undefined;
				// Reset the drop_spd variable, to its max amount
				drop_spd = drop_spd_max;
			}
			
			// Drop movement
			if (drop)
			{
				// Create a vector in the direction and speed of the target
				hspd = lengthdir_x(drop_spd, drop_dir);
				vspd = lengthdir_y(drop_spd, drop_dir);
				
				// Interpolate the drop_spd variable until it reaches 0
				drop_spd *= 0.9;
				
				// Collide with other objects when the gun is dropped
				#region Collisions
				if (place_meeting(x + hspd, y, parent_environment))
				{
					while (!place_meeting(x + sign(hspd), y, parent_environment))
					{
						x += sign(hspd);
					}
					hspd = lengthdir_x(1, player_direction);
				}
				if (place_meeting(x, y + vspd, parent_environment))
				{
					while (!place_meeting(x, y + sign(vspd), parent_environment))
					{
						y += sign(vspd);
					}	
					vspd = lengthdir_y(1, player_direction);
				}
				#endregion
				
				// Apply movement
				x += hspd;
				y += vspd;
				
				// Stop interpolating if the drop_spd reaches zero
				if (drop_spd <= 0)
				{
					// Set the drop variable to false
					drop = false;
					
					// Reset the drop_spd to its max amount
					drop_spd = drop_spd_max;
				}
			}
			
			// Unable to pickup time
			if (unpickable)
			{
				// Increment the counter
				unpickable_counter++;
				
				// If the counter has reaches the set amount of time
				if (unpickable_counter >= unpickable_time)
				{
					// Set the unpickable variable to false
					unpickable = false;
					
					// Reset the counter
					unpickable_counter = 0;
				}
			}
		}
		break;
}