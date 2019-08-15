// Creating the wall_top's
for (var xx = 0; xx < round(image_xscale); xx++)
{
	for (var yy = 0; yy < round(image_yscale); yy++)
	{
		draw_sprite(spr_wall_top, 0, x + 16 * xx, y + 16 * yy);
	}
}
