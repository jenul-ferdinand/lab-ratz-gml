if (instance_place(x, y, obj_player)) and (obj_player.holding == undefined)
{
	instance_change(transfer, true);
	obj_player.holding = transfer;
}

sprite_set_offset(spr_ak47, x, y + 10);
y = scr_wave(ystart, ystart + 4, 1, 0);
