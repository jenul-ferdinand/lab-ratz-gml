if (!surface_exists(light))
{
	light = surface_create(view_width, view_height);
}

surface_set_target(light);
draw_set_colour(make_color_rgb(143, 143, 143));
draw_rectangle(0, 0, view_width, view_height, false);
surface_reset_target();