draw_set_colour(c_black);

// Size and locations of the rectangle
var x1, x2, y1, y2;
x1 = camera_get_view_x(view) + left;
x2 = camera_get_view_x(view) + right;
y1 = camera_get_view_y(view);
y2 = camera_get_view_y(view) + camera_get_view_height(view);
// Move the rectangle
right += spd;
left += spd * stage_two;
// Draw the rectangle
draw_rectangle(x1, y1, x2, y2, false);

// If right side is off view transfer player if the player collides
if (right > camera_get_view_width(view) + buffer) && (stage_two != 1) 
{
	stage_two = 1;
	if (script)
	{
		// Change rooms
		room_goto(goal);
		obj_player.x = goal_x;
		obj_player.y = goal_y;
		// Play sound
		if (!audio_is_playing(snd_transition)) 
		{
			var sound = audio_play_sound(snd_transition, 0, 0);
			audio_sound_gain(sound, 0, 750);
		}
	}
}

// If left side is off view destroy the transition
if (left > camera_get_view_width(view) + buffer) && (stage_two == 1) { instance_destroy(); } 

draw_set_colour(c_white);