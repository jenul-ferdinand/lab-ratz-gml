draw_self();

// Lighting
surface_set_target(light);
gpu_set_blendmode(bm_subtract);

var shake = lighting_shake_amount;
draw_set_colour(lighting_outer_colour);
draw_circle
(
	(x + random_range(-shake, shake)) - camera_get_view_x(view),
	(y + random_range(-shake, shake)) - camera_get_view_y(view),
	lighting_outer_radius + random_range(-shake, shake),
	false
);

draw_set_colour(lighting_inner_colour)
draw_circle
(
	(x + random_range(-shake, shake)) - camera_get_view_x(view),
	(y + random_range(-shake, shake)) - camera_get_view_y(view),
	lighting_inner_radius + random_range(-shake, shake),
	false
);

gpu_set_blendmode(bm_normal);
surface_reset_target();