// Draw self
draw_sprite_ext(sprite_index, image_index, x, y, 1, shadow_yscale, image_angle, shadow_colour, shadow_alpha);
var hover = scr_wave(y-hover_y1, y-hover_y2, 1, 0);
draw_sprite(sprite_index, image_index, x, hover);

#region Lighting
surface_set_target(light);
gpu_set_blendmode(bm_subtract);
var shake = lighting_shake_amount;
// Outer Circle
draw_set_colour(lighting_outer_colour);
draw_circle
(
	(x + random_range(-shake, shake)) - camera_get_view_x(view),
	(y + random_range(-shake, shake)) - camera_get_view_y(view),
	lighting_outer_radius + random_range(-shake, shake),
	false
);
// Inner Circle
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
#endregion

