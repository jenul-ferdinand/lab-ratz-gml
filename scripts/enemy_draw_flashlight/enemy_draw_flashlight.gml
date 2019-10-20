/// @desc enemy_draw_flashlight()
/// @param draw flashlight?
if (argument[0]) and (!collision_line(x, y, obj_player.x, obj_player.y, parent_environment, false, false))
{
	if (state == "Approach") or (state == "Chase") or (state == "Shoot")
	{
		var dir = player_direction;
		var buffer_x = lengthdir_x(bullet_buffer, dir);
		var buffer_y = lengthdir_y(bullet_buffer, dir);
	
		var light_length = flash_light_distance;
		var light_fov = flash_light_fov;
	
		var dir_l = dir + (light_fov / 2);
		var dir_r = dir - (light_fov / 2);

		gpu_set_blendmode(bm_subtract);
		surface_set_target(light);
		draw_triangle_colour
		(
		    (x) + buffer_x - camera_get_view_x(view),
		    (y-flash_light_ybuffer) + buffer_y - camera_get_view_y(view),
		    (x) + lengthdir_x(light_length, dir_l) - camera_get_view_x(view),
		    (y-flash_light_ybuffer) + lengthdir_y(light_length, dir_l) - camera_get_view_y(view),
		    (x) + lengthdir_x(light_length, dir_r) - camera_get_view_x(view),
		    (y-flash_light_ybuffer) + lengthdir_y(light_length, dir_r) - camera_get_view_y(view),
		    flash_light_colour, 
			c_black, c_black, 
			false
		)

		surface_reset_target();
		gpu_set_blendmode(bm_normal);
	}
}