//["1024 x 576", "1280 x 720", "1366 x 768", "1600 x 900", "1920 x 1080"]]

var w, h;
switch (argument[0])
{
	case 0:
		w = 1024; h = 756;
		window_set_size(w, h);
		surface_resize(light, w, h);
		break;
		
	case 1:
		w = 1280; h = 720;
		window_set_size(w, h);
		surface_resize(light, w, h);
		break;
		
	case 2:
		w = 1366; h = 768;
		window_set_size(w, h);
		surface_resize(light, w, h);
		break;
		
	case 3:
		w = 1600; h = 900;
		window_set_size(w, h);
		surface_resize(light, w, h);
		break;
		
	case 4:
		w = 1920; h = 1080;
		window_set_size(w, h);
		surface_resize(light, w, h);
		break;
}

obj_camera.alarm[0] = 1;
