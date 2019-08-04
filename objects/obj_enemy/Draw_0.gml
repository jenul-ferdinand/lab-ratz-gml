// Shadow
draw_sprite_ext(spr_people_shadow, 0, x, y, image_xscale, image_yscale, image_angle, c_white, 0.3);
draw_self();

// Gun
var gun_dir = point_direction(x, y, obj_player.x, obj_player.y);
if (gun_dir > 120) and (gun_dir < 240) { gun_yscale = -1 } else { gun_yscale = 1; }
draw_sprite_ext(
	gun_sprite, 
	0, 
	x, 
	y - gun_ybuffer, 
	gun_xscale, gun_yscale, 
	gun_dir, 
	gun_imageblend, 
	gun_alpha
);

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