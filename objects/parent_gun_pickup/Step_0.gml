if (instance_place(x, y, obj_player)) and (obj_player.holding == undefined) and (!unpickable)
{
	var inst = instance_change(transfer, true);
	obj_player.holding = transfer;
	inst.ammo = 90;
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