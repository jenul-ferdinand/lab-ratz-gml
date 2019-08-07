// Changing window mode from fullscreen to windowed or windowed to fullscreen.
switch (argument[0])
{
	case 0: 
		window_set_fullscreen(true); 
		break;
	case 1: 
		window_set_fullscreen(false); 
		window_set_size(1280, 720);
		surface_resize(light, 1280, 720);
		break;
}

window_center();