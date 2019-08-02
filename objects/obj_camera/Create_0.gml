#macro view view_camera[0]
following = obj_player;

// Camera view width and height
globalvar view_width, view_height;
view_width = 640 * 1.5;
view_height = 360 * 1.5;
// Window scale
window_scale = 2;
// Figure out the window width and height
globalvar window_width, window_height;
window_width = view_width * window_scale;
window_height = view_height * window_scale;
// Set the window size
window_set_size(window_width, window_height);
alarm[0] = 1;
// Resize the application surface
surface_resize(application_surface, window_width, window_height);
// Zoom
zoom = 0.75;