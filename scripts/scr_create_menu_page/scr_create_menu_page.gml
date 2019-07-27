/// @desc scr_create_menu_page
/// @param ["Name1", type1, entries1...]
/// @param ["Name2", type2, entries2...]

var arg;
for (var i = 0; i < argument_count; i++)
{
	arg[i] = argument[i];
}

// Create the grid which will store the id of the cell
var ds_grid_id = ds_grid_create(5, argument_count);

// Store every value in each cell into a grid
for (var i = 0; i < argument_count; i++)
{
	var array = arg[i];
	var array_len = array_length_1d(array);
	
	for (var xx = 0; xx < array_len; xx++)
	{
		ds_grid_id[# xx, i] = array[xx];
	}
}	

// Return the id of the cell
return ds_grid_id;