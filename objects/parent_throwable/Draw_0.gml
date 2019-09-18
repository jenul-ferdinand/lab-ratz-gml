if (state == "Dropped") and (room == room_id)
{
	draw_sprite_ext(sprite_index, image_index, x, y, 1, shadow_yscale, 0, shadow_colour, shadow_alpha);
	var hover = scr_wave(y-hover_y1, y-hover_y2, 1, 0);
	draw_sprite(sprite_index, image_index, x, hover);
}