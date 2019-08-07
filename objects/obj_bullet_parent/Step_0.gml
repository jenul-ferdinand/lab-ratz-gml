if (game_stop) exit;

// Destroy on collision with walls
var walls = [obj_wall_bottom, obj_wall_top];
for (var i = 0; i < array_length_1d(walls); i++)
{
	if (instance_place(x, y, walls[i]))
	{
		instance_destroy();	
	}
}

// Destroy
if (destroy) { instance_destroy(); destroy = false;}