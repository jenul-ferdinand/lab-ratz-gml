if (open) { open_anim = true; }
if (open_anim)
{
	x_scale -= 0.05;
	if (x_scale <= 0)
	{
		x_scale = 0;
		
		open_anim = false;
		enterable = true;
	}
}

if (enterable)
{
	if (instance_place(x, y+1, obj_player))
	{
		room_goto_next();	
		obj_player.x = goto_x;
		obj_player.y = goto_y;
	}	
}