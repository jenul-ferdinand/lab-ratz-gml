var mouse_dir = point_direction(x, y, mouse_x, mouse_y);
var player_direction = point_direction(x, y, obj_player.x, obj_player.y);

switch (state)
{
	case "Throwable":
		// Origin
		x = holder.x;
		y = holder.y - 9;
		// Rotation
		image_angle = mouse_dir;
		// Vertical flipping
		if (mouse_dir > 90) and (mouse_dir < 270) { image_yscale = -1 } else { image_xscale = 1; } 
	
		// Mechanics
		var mouseb = mouse_check_button_pressed(bind_shoot);
		if (mouseb)
		{
			// Throwing grenade
			state = "Tossed";
			toss_dir = mouse_dir;
			toss_spd = 5;
		}
		
		if (obj_player.holding != undefined)
		{
			if (keyboard_check_pressed(bind_drop))
			{
				state = "Dropped";
				room_id = room;
				drop = true;
				unpickable = true;
				holder = noone;
				obj_player.holding = undefined;
			}
		}
		break;
		
	case "Tossed":
		// Vector
		hspd = lengthdir_x(toss_spd, toss_dir);
		vspd = lengthdir_y(toss_spd, toss_dir);
		#region Collisions
		if (place_meeting(x + hspd, y, parent_environment))
		{
			while (!place_meeting(x + sign(hspd), y, parent_environment))
			{
				x += sign(hspd);	
			}
			hspd = 0;
		}
		if (place_meeting(x, y + vspd, parent_environment))
		{
			while (!place_meeting(x, y + sign(vspd), parent_environment))
			{
				y += sign(vspd);
			}
			vspd = 0;
		}
		#endregion
		// Move 
		x += hspd;
		y += vspd;
		// Interpolate
		toss_spd *= toss_lerp;
		
		// Explode
		if (toss_spd <= toss_min)
		{
			// Create the explosion object	
			var expl = instance_create_layer(x, y, "particles", obj_rpg_explosion);
			expl.creator = id;
			expl.bullet_creator = obj_player;
			expl.last_direction = direction;
			expl.target = parent_enemy;
			expl.damage = 100;
			
			// Destroy instance
			destroy = true;
			obj_player.holding = undefined;
		}
		break;
		
	case "Dropped":
		if (room == room_id)
		{
			image_angle = 0;
			#region Pickup
			if (instance_place(x, y, obj_player)) and (obj_player.holding == undefined) and (!unpickable)
			{
				state = "Throwable";
				drop = false;
				obj_player.holding = obj_f2grenade;
			
				holder = obj_player;
				hspd = 0;
				vspd = 0;
				drop_dir = undefined;
				drop_spd = drop_spd_max;
			}
			#endregion
			
			#region Movement
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
			#endregion
	
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
		}
		break;
}

// Destruction
if (destroy) { instance_destroy(); } 