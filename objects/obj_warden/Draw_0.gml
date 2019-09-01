draw_self();

// Gun
if (state == "Shoot")
{
	draw_sprite_ext(
		sprite_gun, 
		0,
		x + gun_xbuffer,
		y - gun_ybuffer,
		1,
		gun_yscale,
		gun_dir,
		c_white,
		1,
	);
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