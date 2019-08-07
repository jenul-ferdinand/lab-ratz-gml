if (game_stop) exit;

if (instance_place(x, y, obj_player)) and (obj_player.holding == undefined) and (!unpickable)
{
	instance_change(transfer, true);
	obj_player.holding = transfer;
}

// If dropping
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
	if (place_meeting(x + hspd, y, obj_wall_bottom))
	{
		while (!place_meeting(x + sign(hspd), y, obj_wall_bottom))
		{
			x += sign(hspd);	
		}
		hspd = 0;
	}
	if (place_meeting(x, y + vspd, obj_wall_bottom))
	{
		while (!place_meeting(x, y + sign(vspd), obj_wall_bottom))
		{
			y += sign(vspd);
		}	
		vspd = 0;
	}
	#endregion
	// Apply movement
	x += hspd;
	y += vspd;
	// Stop
	if (drop_spd <= 0)
	{
		drop = false;
		drop_spd = 10;
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
}