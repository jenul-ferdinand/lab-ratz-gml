if (!console_open) exit;

var vw = window_get_width(); 
var vh = window_get_height();

draw_rectangle_colour(0, 0, vw, console_height, console_colour, console_colour, console_colour, console_colour, false);

draw_set_font(fnt_console);
draw_text(10, 10, "> " + console_text);
draw_set_font(-1);