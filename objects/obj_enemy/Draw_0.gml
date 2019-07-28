draw_self();

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

// Draw lighting
var size = 64;
var colour = c_white;
gpu_set_blendmode(bm_subtract);
surface_set_target(light);
draw_ellipse_colour
(
	x - size/2 - camera_get_view_x(view), 
	(y - 6) - size/2 - camera_get_view_y(view), 
	x + size/2 - camera_get_view_x(view), 
	(y - 6) + size/2 - camera_get_view_y(view), 
	colour, c_black, false
);
surface_reset_target();
gpu_set_blendmode(bm_normal);