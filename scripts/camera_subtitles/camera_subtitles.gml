/// @desc camera_subtitles()

with (obj_camera)
{
	if (draw_subtitles)
	{
		// Setting colour, font, and halignment
		draw_set_colour(subtitle_colour);
		draw_set_font(fnt_subtitle);
		draw_set_halign(fa_center);
		// Drawing subtitles
		for (var i = 0; i < array_length_1d(subtitle); i++) 
		{
			if (objective == i) { draw_text(subtitle_x, subtitle_y, "objective: " + subtitle[i]); } 
		}
		// Reset
		draw_set_halign(fa_left);
		draw_set_font(-1);
		draw_set_colour(c_white);
	}
}