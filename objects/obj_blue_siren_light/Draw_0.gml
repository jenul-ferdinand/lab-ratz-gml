draw_self();

surface_set_target(light);
gpu_set_blendmode(bm_subtract);

// Center Light Emit
var shake = center_light_shake_amount;
draw_set_colour(center_light_outer_colour);
draw_circle(
	(x + random_range(-shake, shake)) - camera_get_view_x(view),
	(y + random_range(-shake, shake)) - camera_get_view_y(view),
	center_light_outer_radius + random_range(-shake, shake),
	false
);
draw_set_colour(center_light_inner_colour)
draw_circle(
	(x + random_range(-shake, shake)) - camera_get_view_x(view),
	(y + random_range(-shake, shake)) - camera_get_view_y(view),
	center_light_inner_radius + random_range(-shake, shake),
	false
);

// Double Triangles
var dir_l, dir_r;
dir_l = light_dir + (light_fov / 2);
dir_r = light_dir - (light_fov / 2);
draw_triangle_colour(
	(x-2) + lengthdir_x(0, light_dir) - camera_get_view_x(view),
	(y-2) + lengthdir_y(0, light_dir) - camera_get_view_y(view),
	(x-2) + lengthdir_x(light_length, dir_l) - camera_get_view_x(view),
	(y-2) + lengthdir_y(light_length, dir_l) - camera_get_view_y(view),
	(x-2) + lengthdir_x(light_length, dir_r) - camera_get_view_x(view),
	(y-2) + lengthdir_y(light_length, dir_r) - camera_get_view_y(view),
	light_colour, c_black, c_black, false,
)
dir_l = light_dir + (light_fov / 2);
dir_r = light_dir - (light_fov / 2);
draw_triangle_colour(
	x + lengthdir_x(0, light_dir) - camera_get_view_x(view),
	y + lengthdir_y(0, light_dir) - camera_get_view_y(view),
	x - lengthdir_x(light_length, dir_l) - camera_get_view_x(view),
	y - lengthdir_y(light_length, dir_l) - camera_get_view_y(view),
	x - lengthdir_x(light_length, dir_r) - camera_get_view_x(view),
	y - lengthdir_y(light_length, dir_r) - camera_get_view_y(view),
	light_colour, c_black, c_black, false,
)

surface_reset_target();
gpu_set_blendmode(bm_normal);
