// Shadow
draw_sprite_ext(spr_people_shadow, 0, x, y, image_xscale, image_yscale, image_angle, c_white, 0.3);
draw_self();

// Gun
draw_sprite_ext(
	gun_sprite, 
	0, 
	x, 
	y - gun_ybuffer, 
	gun_xscale, gun_yscale, 
	gun_dir, 
	gun_imageblend, 
	gun_alpha
);

// Flash shader
if (flash_alpha > 0)
{
	shader_set(sh_flash);
	draw_sprite_ext
	(
		sprite_index, 
		image_index, 
		x, 
		y, 
		image_xscale, image_yscale, 
		image_angle, 
		flash_colour, 
		flash_alpha
	);
	shader_reset();
}

// Flashlight
if (state == state_type.approach) or (state == state_type.chase) or (state == state_type.shoot)
{
	var dir = player_direction;
	var buffer_x = lengthdir_x(bullet_buffer, dir);
	var buffer_y = lengthdir_y(bullet_buffer, dir);
	
	var light_length = flash_light_distance;
	var light_fov = flash_light_fov;
	
	var dir_l = dir + (light_fov / 2);
	var dir_r = dir - (light_fov / 2);

	gpu_set_blendmode(bm_subtract);
	surface_set_target(light);
	draw_triangle_colour
	(
	    (x) + buffer_x - camera_get_view_x(view),
	    (y-flash_light_ybuffer) + buffer_y - camera_get_view_y(view),
	    (x) + lengthdir_x(light_length, dir_l) - camera_get_view_x(view),
	    (y-flash_light_ybuffer) + lengthdir_y(light_length, dir_l) - camera_get_view_y(view),
	    (x) + lengthdir_x(light_length, dir_r) - camera_get_view_x(view),
	    (y-flash_light_ybuffer) + lengthdir_y(light_length, dir_r) - camera_get_view_y(view),
	    flash_light_brightness, 
		c_black, c_black, 
		false
	)

	surface_reset_target();
	gpu_set_blendmode(bm_normal);
}

// Lighting
scr_double_circle_lighting(
	0, 
	0, 
	lighting_inner_colour, 
	lighting_outer_colour, 
	lighting_inner_radius, 
	lighting_outer_radius,
	lighting_shake_amount,
);