if (game_stop) exit;

// If the gun is dropped
if (state == "Dropped") and (room == room_id)
{
	// Draw the shadow of the dropped gun
	draw_sprite_ext(sprite, image_index, x, y, 1, shadow_yscale, 0, shadow_colour, shadow_alpha);
	
	// Draw the dropped weapon, hovering.
	var hover = scr_wave(y-hover_y1, y-hover_y2, 1, 0);
	draw_sprite(sprite, image_index, x, hover);
}

// Assign dir var to the direction of the mouse
var dir = point_direction(x, y, mouse_x, mouse_y);

// The buffer between the gun and the laser in the direction of the mouse
var buffer_x = lengthdir_x(bullet_buffer, dir);
var buffer_y = lengthdir_y(bullet_buffer, dir);

// If the lasersight is toggled and it is activated
if (laser_sight) and (laser_sight_toggle)
{
	// Assign c var to the laser_colour
	var c = laser_colour;
	
	// The distance the laser travels in the direction of the mouse
	var length_x = lengthdir_x(1200, dir);
	var length_y = lengthdir_y(1200, dir);
	
	// Activate gpu blendmode bm_subtract
	gpu_set_blendmode(bm_subtract);
	// Set the surface target
	surface_set_target(light);
	
	// Draw the laser
	draw_line_colour
	(
		(x - 2) + buffer_x - camera_get_view_x(view), 
		(y - 2) + buffer_y - camera_get_view_y(view), 
		(x - 2) + length_x - camera_get_view_x(view), 
		(y - 2) + length_y - camera_get_view_y(view), 
		c,c
	);
	
	// Reset the surface
	surface_reset_target();
	// Reset the blendmode to the default 
	gpu_set_blendmode(bm_normal);
}

// If the flashlight is activated and toggled
else if (flash_light) and (flash_light_toggle)
{
	// Assign the distance of the flashlight to light_length
	var light_length = flash_light_distance;
	
	// Assign the fov of the flashlight to light_fov
	var light_fov = flash_light_fov;
	
	// Calculate the directions for the flashlight
	var dir_l = dir + (light_fov / 2);
	var dir_r = dir - (light_fov / 2);
	
	// Set the gpu blendmode to be bm_subtract
	gpu_set_blendmode(bm_subtract);
	
	// Set the surface target to be light
	surface_set_target(light);
	
	// The buffer of the flashlight
	buffer_x = lengthdir_x(0, dir);
	buffer_y = lengthdir_y(0, dir);
	
	// Draw the triangle cone of the flashlight
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

	// Reset the surface target 
	surface_reset_target();
	
	// Reset the blendmode to be the default, bm_normal
	gpu_set_blendmode(bm_normal);
}

// If the muzzle flash is activated
if (muzzle_flash)
{
	// The buffer x and y of the muzzle flash
	buffer_x = lengthdir_x(bullet_buffer + 3, dir);
	buffer_y = lengthdir_y(bullet_buffer + 3, dir);
	
	// The flash of the muzzle flash
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
	
	// Draw lighting if the muzzle has flashed
	double_circle_lighting(
		buffer_x,
		buffer_y,
		lighting_inner_colour,
		lighting_outer_colour,
		lighting_inner_radius,
		lighting_outer_radius,
		lighting_shake_amount,
	);
	
	// Reset the muzzle flash variable, so we can use it again
	muzzle_flash = false;
}