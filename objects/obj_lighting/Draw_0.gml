var cx = camera_get_view_x(view);
var cy = camera_get_view_y(view);

// Draw the surface
gpu_set_blendmode(bm_subtract);
draw_surface(light, cx, cy);
gpu_set_blendmode(bm_normal);