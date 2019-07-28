draw_self();

var size = 16;
var colour = make_colour_rgb(255, 163, 51);
gpu_set_blendmode(bm_subtract);
surface_set_target(light);
draw_ellipse_colour
(
	x - size/2 - camera_get_view_x(view), 
	y - size/2 - camera_get_view_y(view), 
	x + size/2 - camera_get_view_x(view), 
	y + size/2 - camera_get_view_y(view), 
	colour, c_black, false
);
surface_reset_target();
gpu_set_blendmode(bm_normal);