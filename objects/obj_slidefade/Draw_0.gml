draw_set_colour(c_black);
var x1, x2, y1, y2;
x1 = camera_get_view_x(view) + left;
x2 = camera_get_view_x(view) + right;
y1 = camera_get_view_y(view);
y2 = camera_get_view_y(view) + camera_get_view_height(view);
right += spd;
left += spd * stage_two;
draw_rectangle(x1, y1, x2, y2, false);

if (right > camera_get_view_width(view) + 50) && (stage_two != 1) 
{
	stage_two = 1;
	if (script)
	{
		room_goto(goal);
		obj_player.x = goal_x;
		obj_player.y = goal_y;
	}
}

if (left > camera_get_view_width(view) + 50) && (stage_two == 1) { instance_destroy(); } 

draw_set_colour(c_white);