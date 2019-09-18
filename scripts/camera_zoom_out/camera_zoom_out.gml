/// @desc camera_zoom_out()

if (zoom_out) and (!zoom_in)
{
	zoom = lerp(zoom, zoom_default, 0.05);
	if (zoom >= zoom_default)
	{
		zoom = zoom_default;
		zoom_out = false;
	}
}