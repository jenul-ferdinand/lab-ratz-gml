if (instance_place(x, y, obj_player))
{
	instance_change(transfer, true);
	obj_player.holding = transfer;
}

y = scr_wave(y_loc, y_loc-4, 1, 0);