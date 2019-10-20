// Drawing box
draw_sprite(back_sprite, 0, x, y - (spr_height + top_min));
draw_sprite(top_sprite, 0, x, y - (spr_height + top_yaxis));
draw_sprite(front_sprite, 0, x, y);

// Drawing the gun
if (anim_guncycle) 
{
	draw_sprite(gun_sprites[index], 0, x - gun_xaxis, y - gun_yaxis);
}
