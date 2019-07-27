// Set the camera's view size using the view width and height
camera_set_view_size(view, view_width * zoom, view_height * zoom);

if (instance_exists(following)) 
{
	// Follow the player always centered on the screen and clamped between the bounds
	var x_min = following.x - (view_width/2) * zoom;
	var y_min = following.y - (view_height/2) * zoom;
	var x_max = room_width - (view_width * zoom);
	var y_max = room_height - (view_height * zoom);
	var xx = clamp(x_min, 0, x_max);
	var yy = clamp(y_min, 0, y_max);
	
	// Figure out the camera x and y position
	var cx = camera_get_view_x(view);
	var cy = camera_get_view_y(view);
	// Interpolation Magnitude (higher = faster)
	var mag = 0.1;
	// Application to the camera view position with interpolated smoothing
	camera_set_view_pos(view, lerp(cx, xx, mag), lerp(cy, yy, mag));
}