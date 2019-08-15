/// @desc scr_double_circle_lighting();
/// @param x_buffer
/// @param y_buffer
/// @param inner_colour
/// @param outer_colour
/// @param inner_radius
/// @param outer_radius
/// @param shake_amount

var _xbuffer = argument[0];
var _ybuffer = argument[1];
var _inner_colour = argument[2];
var _outer_colour = argument[3];
var _inner_radius = argument[4];
var _outer_radius = argument[5];
var _shake_amount = argument[6];

// Lighting
surface_set_target(light);
gpu_set_blendmode(bm_subtract);
// Outer Circle
draw_set_colour(_outer_colour);
draw_circle
(
	((x+_xbuffer) + random_range(-_shake_amount, _shake_amount)) - camera_get_view_x(view),
	((y+_ybuffer) + random_range(-_shake_amount, _shake_amount)) - camera_get_view_y(view),
	_outer_radius + random_range(-_shake_amount, _shake_amount),
	false
);
// Inner Circle
draw_set_colour(_inner_colour)
draw_circle
(
	((x+_xbuffer) + random_range(-_shake_amount, _shake_amount)) - camera_get_view_x(view),
	((y+_ybuffer) + random_range(-_shake_amount, _shake_amount)) - camera_get_view_y(view),
	_inner_radius + random_range(-_shake_amount, _shake_amount),
	false
);
draw_set_colour(c_white);
gpu_set_blendmode(bm_normal);
surface_reset_target();