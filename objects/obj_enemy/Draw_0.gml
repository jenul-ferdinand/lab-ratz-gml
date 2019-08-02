// Shadow
draw_sprite_ext(spr_player_shadow, 0, x, y, image_xscale, image_yscale, image_angle, c_white, 0.3);
draw_self();

// Gun
var gun_dir = point_direction(x, y, obj_player.x, obj_player.y);
draw_sprite_ext(spr_ak47, 0, x, y-8, 1, image_xscale, gun_dir, c_white, 1);

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