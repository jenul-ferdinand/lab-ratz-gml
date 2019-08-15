draw_set_font(fnt_floating_points);
draw_set_halign(fa_middle);
var c = text_colour;
draw_text_colour(x, y, "+" + string(amount), c,c,c,c, text_alpha);
draw_set_halign(fa_left);
draw_set_font(-1);