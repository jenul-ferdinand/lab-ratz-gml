/// @desc Draw event

if (laser_sight) and (laser_sight_toggle)
{
	var dir = point_direction(x, y, mouse_x, mouse_y);
	var buffer_x = lengthdir_x(bullet_buffer, dir);
	var buffer_y = lengthdir_y(bullet_buffer, dir);
	var c = laser_colour;
	var length_x = lengthdir_x(300, dir);
	var length_y = lengthdir_y(300, dir);
	draw_line_colour
	(
		(x - 2) + buffer_x, 
		(y - 2) + buffer_y, 
		(x - 2) + length_x, 
		(y - 2) + length_y, 
		c,c
	);
}