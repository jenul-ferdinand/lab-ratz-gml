draw_set_font(fnt_main);
draw_set_halign(fa_right);
	var c, str, xx, yy, buffer;
	str = "dev build v1.0"
	xx = window_width - 10;
	yy = window_height - 34;
	buffer = 4;
	
	c = c_black; 
		draw_text_colour(xx+3, yy + buffer, str, c,c,c,c, 1);
	c = make_colour_rgb(255, 222, 92); 
		draw_text_colour(xx, yy, str, c,c,c,c, 1);
draw_set_halign(fa_left);
draw_set_font(-1);