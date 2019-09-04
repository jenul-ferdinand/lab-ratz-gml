if (game_stop) exit;
// Gun is drawn in the player draw event!
if (state == "Dropped") and (room == room_id)
{
	draw_sprite_ext(sprite, image_index, x, y, 1, shadow_yscale, 0, shadow_colour, shadow_alpha);
	var hover = scr_wave(y-hover_y1, y-hover_y2, 1, 0);
	draw_sprite(sprite, image_index, x, hover);
}

// Laser
var dir = point_direction(x, y, mouse_x, mouse_y);
var buffer_x = lengthdir_x(bullet_buffer, dir);
var buffer_y = lengthdir_y(bullet_buffer, dir);
if (laser_sight) and (laser_sight_toggle)
{
	var c = laser_colour;
	
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
else if (flash_light) and (flash_light_toggle)
{
	var light_length = flash_light_distance;
	var light_fov = flash_light_fov;
	
	var dir_l = dir + (light_fov / 2);
	var dir_r = dir - (light_fov / 2);

	gpu_set_blendmode(bm_subtract);
	surface_set_target(light);
	buffer_x = lengthdir_x(0, dir);
	buffer_y = lengthdir_y(0, dir);
	draw_triangle_colour
	(
	    (x-2) + buffer_x - camera_get_view_x(view),
	    (y-2) + buffer_y - camera_get_view_y(view),
	    (x-2) + lengthdir_x(light_length, dir_l) - camera_get_view_x(view),
	    (y-2) + lengthdir_y(light_length, dir_l) - camera_get_view_y(view),
	    (x-2) + lengthdir_x(light_length, dir_r) - camera_get_view_x(view),
	    (y-2) + lengthdir_y(light_length, dir_r) - camera_get_view_y(view),
	    flash_light_colour, 
		c_black, c_black, 
		false
	)

	surface_reset_target();
	gpu_set_blendmode(bm_normal);
}

// Draw muzzle flash
if (muzzle_flash)
{
	buffer_x = lengthdir_x(bullet_buffer + 3, dir);
	buffer_y = lengthdir_y(bullet_buffer + 3, dir);
	// Flash
	draw_sprite_ext
	(
		spr_muzzle_flash, 
		irandom_range(0,9), 
		x + buffer_x, 
		(y - bullet_vertex) + buffer_y, 
		.5, .5, 
		random_range(0, 359), 
		c_white, 
		random_range(0.5, 1), 
	);
	
	// Lighting
	scr_double_circle_lighting(
		buffer_x,
		buffer_y,
		lighting_inner_colour,
		lighting_outer_colour,
		lighting_inner_radius,
		lighting_outer_radius,
		lighting_shake_amount,
	);
	
	// Reset
	muzzle_flash = false;
}