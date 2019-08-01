if (!surface_exists(light))
{
	light = surface_create(view_width, view_height);
}

surface_set_target(light);
var c = 0;
draw_set_colour(make_color_rgb(c, c, c));
draw_rectangle(0, 0, view_width, view_height, false);
surface_reset_target();