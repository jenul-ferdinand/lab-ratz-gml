// Shadow
draw_sprite_ext(spr_player_shadow, 0, x, y, image_xscale, image_yscale, image_angle, c_white, 0.3);
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