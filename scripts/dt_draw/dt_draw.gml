// Sort the list
dtListSize = ds_list_size(DT_LIST);

ds_grid_resize(DT_GRID, 2, max(1, dtListSize));

for (var i = 0; i < dtListSize; i++)
{
	var array = DT_LIST[| i];
	
	DT_GRID[# 0, i] = array;
	DT_GRID[# 1, i] = array[9];
}

ds_grid_sort(DT_GRID, 1, true);

// Draw the stuff
var yy = 0;
repeat (dtListSize)
{
	var a = DT_GRID[# 0, yy];
	
	if (sprite_exists(a[0]))
	{
		draw_sprite_ext(a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8]);
	}
	
	yy++;
}