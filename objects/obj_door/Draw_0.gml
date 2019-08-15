draw_self()

// Sliding doors
draw_sprite_ext(spr_door_left, 0, x, y, x_scale, image_yscale, image_angle, c_white, image_alpha);
draw_sprite_ext(spr_door_right, 0, x+14, y, x_scale, image_yscale, image_angle, c_white, image_alpha);

// Lighting
//surface_set_target(light);
//gpu_set_blendmode(bm_subtract);
//var _shake = lighting_shake_amount;
//// Outer Circle
//draw_set_colour(lighting_outer_colour);
//draw_circle
//(
//	((x+x_buffer) + random_range(-_shake, _shake)) - camera_get_view_x(view),
//	((y+y_buffer) + random_range(-_shake, _shake)) - camera_get_view_y(view),
//	lighting_outer_radius + random_range(-_shake, _shake),
//	false
//);
//// Inner Circle
//draw_set_colour(lighting_inner_colour)
//draw_circle
//(
//	((x+x_buffer) + random_range(-_shake, _shake)) - camera_get_view_x(view),
//	((y+y_buffer) + random_range(-_shake, _shake)) - camera_get_view_y(view),
//	lighting_inner_radius + random_range(-_shake, _shake),
//	false
//);
//gpu_set_blendmode(bm_normal);
//surface_reset_target();