if (game_stop) and (holding != parent_gun) exit;

// Destroy
if (destroy) { instance_destroy(); }

var player_direction = point_direction(x, y, obj_player.x, obj_player.y);

switch (state)
{
	#region Normal
	case "Normal":
		var dir = point_direction(x, y, mouse_x, mouse_y);
		// Origin
		x = holder.x - lengthdir_x(current_recoil, dir);
		y = (holder.y - 9) - lengthdir_y(current_recoil, dir);
		// Rotation
		image_angle = dir;
		// Vertical flipping
		if (dir > 90) and (dir < 270) { image_yscale = -1; } else { image_yscale = 1; } 

		#region Shooting
		var mouseb;
		if (automatic) { mouseb = mouse_check_button(bind_shoot); } 
		else { mouseb = mouse_check_button_pressed(bind_shoot); }
		if (mouseb) 
		{
			if (cooldown == 0)
			{
				cooldown = firerate;
				cooldown_delay = cooldown_startup;
			}
		}
		if (cooldown_delay == 0) 
		{
			if (mag != 0)
			{
				// Audio
				var _audio_shoot = audio_play_sound(sound_shoot, 10, false);
				audio_sound_gain(_audio_shoot, 0.5, 0);
				
		
				for (var i = 0; i < bullet_amount; i++)
				{
					// Bullet
					var buffer_x = lengthdir_x(bullet_buffer, dir);
					var buffer_y = lengthdir_y(bullet_buffer, dir);
					var inst = instance_create_layer(x + buffer_x, (y - bullet_vertex) + buffer_y, "instances", bullet);
					inst.direction = dir;
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
		
		#region Reloading
		if (mag <= 0) and (!reload) and (ammo > 0) and (!reload_counter_start) and (!mouse_check_button(mb_left))
		{ 
			if (keyboard_check_pressed(bind_reload))
			{
				// Start reloading counter
				reload_counter_start = true;
	
				// Sound start
				audio_play_sound(snd_reload_start, 0, false);
			}
		}
		if (reload_counter_start) { reload_counter++; }
		if (reload_counter >= reload_time/2) 
		{
			if (!reload_played)
			{
				// Sound middle
				audio_play_sound(snd_reload_middle, 0, false);
				reload_played = true;
			}
		}
		if (reload_counter >= reload_time) { reload = true; }
		if (reload)
		{
			// Ammo removal
			mag = mag_max;
			ammo -= mag_max;
	
			// Sound end
			audio_play_sound(snd_reload_end, 0, false);
	
			// Reset variables
			reload = false;
			reload_played = false;
			reload_counter = 0;
			reload_counter_start = false;
			mag_save = 0;
		}	
		#endregion
		
		#region Flashlight and Lasersight
		if (keyboard_check_pressed(bind_flashlight))
		{
			if (laser_sight) { laser_sight_toggle = !laser_sight_toggle; }
			if (flash_light) { flash_light_toggle = !flash_light_toggle; }
		}
		if (laser_sight) { flash_light = false; }	
		if (flash_light) { laser_sight = false; }
		// Laser sight accuracy increase
		if (laser_sight_toggle) 
		{
			bullet_spread = bullet_spread_new; 
			recoil_push = 0; 
		}
		#endregion
		
		#region Dropping gun
		if (obj_player.holding != undefined)
		{
			if (keyboard_check_pressed(bind_drop))
			{
				state = "Dropped";
				drop = true;
				unpickable = true;
				holder = noone;
				flash_light_toggle = false;
				laser_sight_toggle = false;
				obj_player.holding = undefined;
			}
		}
		#endregion
		break;
	#endregion
	
	#region Dropped
	case "Dropped":
		image_angle = 0;
		// Pickup
		if (instance_place(x, y, obj_player)) and (obj_player.holding == undefined) and (!unpickable)
		{
			state = "Normal";
			drop = false;
			obj_player.holding = object;
		
			holder = obj_player;
			hspd = 0;
			vspd = 0;
			drop_dir = undefined;
			drop_spd = drop_spd_max;
		}
	
		// Movement
		if (drop)
		{
			// Direction
			drop_dir = point_direction(x, y, mouse_x, mouse_y);
			// Vector
			hspd = lengthdir_x(drop_spd, drop_dir);
			vspd = lengthdir_y(drop_spd, drop_dir);
			// Ease out
			drop_spd *= 0.9;
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
			// Stop
			if (drop_spd <= 0)
			{
				drop = false;
				drop_spd = drop_spd_max;
			}
		}
	
		// Un-pickable time
		if (unpickable)
		{
			unpickable_counter++;
			if (unpickable_counter >= unpickable_time)
			{
				unpickable = false;
				unpickable_counter = 0;
			}
		}
		break;
	#endregion
}