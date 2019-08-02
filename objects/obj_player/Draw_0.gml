// Shadow
draw_sprite_ext(spr_player_shadow, 0, x, y, image_xscale, image_yscale, image_angle, c_white, 0.3);
draw_self();

// Gun
with (parent_gun) 
{
	if (!destroy) and (other.holding != undefined)
	{
		draw_sprite_ext
		(
			sprite_index, 
			image_index, 
			x, y, 
			image_xscale, 
			image_yscale, 
			image_angle, 
			c_white, 
			image_alpha
		);
	}
}

#region Lighting
surface_set_target(light);
gpu_set_blendmode(bm_subtract);
var shake = lighting_shake_amount;
// Outer Circle
draw_set_colour(lighting_outer_colour);
draw_circle
(
	(x + random_range(-shake, shake)) - camera_get_view_x(view),
	((y-center_buffer) + random_range(-shake, shake)) - camera_get_view_y(view),
	lighting_outer_radius + random_range(-shake, shake),
	false
);
// Inner Circle
draw_set_colour(lighting_inner_colour)
draw_circle
(
	(x + random_range(-shake, shake)) - camera_get_view_x(view),
	((y-center_buffer) + random_range(-shake, shake)) - camera_get_view_y(view),
	lighting_inner_radius + random_range(-shake, shake),
	false
);
gpu_set_blendmode(bm_normal);
surface_reset_target();
#endregion