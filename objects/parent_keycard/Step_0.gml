depth = -999;
var mouse_direction = point_direction(x, y, mouse_x, mouse_y);
var player_direction = point_direction(x, y, obj_player.x, obj_player.y);

switch (state)
{
	case "Normal":
		x = holder.x + xbuffer;
		y = holder.y - ybuffer;
		image_angle = mouse_direction-90;
		if (image_angle > 90) and (image_angle < 270) { image_yscale = -1; } 
		else { image_yscale = 1; }
		
		if (instance_exists(obj_door))
		{
			var door = instance_nearest(x, y, obj_door);
			var door_distance = point_distance(x, y, door.x, door.y);
			if (mouse_check_button_pressed(bind_shoot)) and (door_distance < interact_distance) 
			{
				audio_play_sound(snd_hitmarker, 0, 0);
				door.open = true;
			}
		}
		
		if (obj_player.holding != undefined)
		{
			if (keyboard_check_pressed(bind_drop))
			{
				state = "Dropped";
				drop = true;
				unpickable = true;
				holder = noone;
				obj_player.holding = undefined;
			}
		}
		break;
		
	case "Dropped":
		image_angle = 0;
		// Pickup
		if (instance_place(x, y, obj_player)) and (obj_player.holding == undefined) and (!unpickable)
		{
			state = "Normal";
			drop = false;
			obj_player.holding = parent_keycard;
		
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
			for (var i = 0; i < array_length_1d(colliding); i++)
			{
				if (place_meeting(x + hspd, y, colliding[i]))
				{
					while (!place_meeting(x + sign(hspd), y, colliding[i]))
					{
						x += sign(hspd);
					}
					hspd = lengthdir_x(1, player_direction);
				}
				if (place_meeting(x, y + vspd, colliding[i]))
				{
					while (!place_meeting(x, y + sign(vspd), colliding[i]))
					{
						y += sign(vspd);
					}	
					vspd = lengthdir_y(1, player_direction);
				}
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
}
