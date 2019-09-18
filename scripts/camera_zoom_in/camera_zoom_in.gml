/// @desc camera_zoom_in()

if (zoom_in)
{
	zoom = lerp(zoom, zoom_min, 0.05);
	if (zoom <= zoom_min)
	{
		zoom = zoom_min;
		zoom_in = false;	
	}
}