if (instance_place(x, y, obj_player)) and (target_room != noone)
{
	room_goto(target_room);	
	obj_player.x = target_x;
	obj_player.y = target_y; 
} 