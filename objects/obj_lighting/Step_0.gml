depth = -999;

if (surface_exists(light))
{
	// Create darkness
	surface_set_target(light);
	draw_set_colour(colour);
	draw_rectangle(0, 0, view_width, view_height, false);
	surface_reset_target();
}
else
{
	// If the surface doesn't exist, create it!
	light = surface_create(room_width, room_height);
	surface_set_target(light);
}