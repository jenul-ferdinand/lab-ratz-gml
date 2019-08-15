if (game_stop) exit;

// Shadow
draw_sprite_ext(spr_people_shadow, 0, x, y, image_xscale, image_yscale, image_angle, c_white, 0.3);
draw_self();

// Gun
with (parent_gun) 
{
	if (!destroy) and (other.holding != undefined) and (state != "Dropped")
	{
		draw_sprite_ext(
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

// Lighting
scr_double_circle_lighting(
	0,
	-lighting_height_buffer,
	lighting_inner_colour,
	lighting_outer_colour,
	lighting_inner_radius,
	lighting_outer_radius,
	lighting_shake_amount,
);