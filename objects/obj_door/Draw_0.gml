draw_self()

// Sliding doors
draw_sprite_ext(spr_door_left, 0, x, y, x_scale, image_yscale, image_angle, c_white, image_alpha);
draw_sprite_ext(spr_door_right, 0, x+14, y, x_scale, image_yscale, image_angle, c_white, image_alpha);

// Lighting
scr_double_circle_lighting(
	x_buffer,
	y_buffer,
	lighting_inner_colour,
	lighting_outer_colour,
	lighting_inner_radius,
	lighting_outer_radius,
	lighting_shake_amount,
);