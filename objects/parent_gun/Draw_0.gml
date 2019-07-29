if (holder == noone) exit;
// Gun is drawn in the player draw event!

// Laser
var dir = point_direction(x, y, mouse_x, mouse_y);
var buffer_x = lengthdir_x(bullet_buffer, dir);
var buffer_y = lengthdir_y(bullet_buffer, dir);
if (laser_sight) and (laser_sight_toggle)
{
	var c = make_colour_rgb(255, 0, 0);
	var length_x = lengthdir_x(1200, dir);
	var length_y = lengthdir_y(1200, dir);
	gpu_set_blendmode(bm_subtract);
	surface_set_target(light);
	draw_line_colour
	(
		(x - 2) + buffer_x - camera_get_view_x(view), 
		(y - 2) + buffer_y - camera_get_view_y(view), 
		(x - 2) + length_x - camera_get_view_x(view), 
		(y - 2) + length_y - camera_get_view_y(view), 
		c,c
	);
	surface_reset_target();
	gpu_set_blendmode(bm_normal);
}

// Flashlight
if (flash_light) and (flash_light_toggle)
{
	var c = make_colour_rgb(255, 255, 255);
	var dir = point_direction(x, y, mouse_x, mouse_y);
	var buffer_x = lengthdir_x(18, dir);
	var buffer_y = lengthdir_y(18, dir);
	var length_x = lengthdir_x(200, dir);
	var length_y = lengthdir_y(200, dir);
	gpu_set_blendmode(bm_subtract);
	surface_set_target(light);
	draw_triangle_colour
	(
		(x-2) + buffer_x - camera_get_view_x(view), 
		(y-2) + buffer_y - camera_get_view_y(view),
		(x-2) + length_x - camera_get_view_x(view),
		(y-2) + length_y - camera_get_view_y(view),
		(x-2) + length_x - camera_get_view_x(view),
		(y-2) - length_y - camera_get_view_y(view),
		c,c,c, false
	)
	surface_reset_target();
	gpu_set_blendmode(bm_normal);
}

// Draw muzzle flash
if (muzzle_flash_counter_start) { muzzle_flash_counter++ }
if (mouse_check) and (ammo != 0) and (muzzle_flash)
{
	muzzle_flash_counter_start = true;
	buffer_x = lengthdir_x(bullet_buffer + 3, dir);
	buffer_y = lengthdir_y(bullet_buffer + 3, dir);
	draw_sprite_ext
	(
		spr_muzzle_flash, 
		irandom_range(0,9), 
		x + buffer_x, 
		(y - 1) + buffer_y, 
		.5, .5, 
		random_range(0, 359), 
		c_white, 
		random_range(0.5, 1), 
	);
	
	if (muzzle_flash_counter >= muzzle_flash_time)
	{
		muzzle_flash = false;
		muzzle_flash_counter = 0;
		muzzle_flash_counter_start = false;
	}
}

