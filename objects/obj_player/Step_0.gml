if (game_stop) exit;

#region Movement
// Inputs
var down_key = keyboard_check(bind_down);
var right_key = keyboard_check(bind_right);
var left_key = keyboard_check(bind_left);
var up_key = keyboard_check(bind_up);
// Input Change
x_input = right_key - left_key;
y_input = down_key - up_key;

var len;
if (x_input != 0) or (y_input != 0) 
{
	len = spd; 
} 
else 
{ 
	len = 0; 
} 

// Force
if (force_applied > 0)
{
	hspd_force = lengthdir_x(force_applied, force_dir);
	vspd_force = lengthdir_y(force_applied, force_dir);
	force_applied *= 0.9;
}
// Movement
dir = point_direction(0, 0, x_input, y_input);
hspd = lengthdir_x(len, dir) - hspd_force;
vspd = lengthdir_y(len, dir) + vspd_force;

#region Collisions
var collisions = [obj_wall_bottom, obj_wall_top, obj_pod, obj_pod_broken, parent_enemy, obj_wood_table];
for (var i = 0; i < array_length_1d(collisions); i++)
{
	if (place_meeting(x + hspd, y, collisions[i]))
	{
		while (!place_meeting(x + sign(hspd), y, collisions[i]))
		{
			x += sign(hspd);	
		}
		hspd = 0;
	}
	if (place_meeting(x, y + vspd, collisions[i]))
	{
		while (!place_meeting(x, y + sign(vspd), collisions[i]))
		{
			y += sign(vspd);	
		}
		vspd = 0;	
	}
}
#endregion

// Application of movement
x += hspd;
y += vspd;
#endregion

if (hspd != 0) or (vspd != 0) 
{
	// Footsteps
	counter++;
	if (counter >= footstep_time)
	{
		var sound_type = choose(snd_footstep_1, snd_footstep_2, snd_footstep_3, snd_footstep_4);
		if (!audio_is_playing(sound_type)) 
		{ 
			var footstep = audio_play_sound(sound_type, 0, 0); 
			audio_sound_gain(footstep, footstep_volume, 0);
		}
		
		counter = 0;
	}	
	
	// Running animation
	sprite_index = sprite_run;
}
else
{
	// Idle animation
	sprite_index = sprite;
}	

if (hspd != 0) and (hspd_force == 0)
{ 
	// Facing direction
	image_xscale = sign(hspd); 
}
else
{
	var mdir = point_direction(x, y, mouse_x, mouse_y);
	if (mdir > 90) and (mdir < 270) { image_xscale = -1; } 
	else { image_xscale = 1; }
}

// Health
if (hit)
{
	var hurt_sound = audio_play_sound(choose(snd_player_hurt_0, snd_player_hurt_1), 0, 0);
	audio_sound_pitch(hurt_sound, random_range(0.9, 1.1));
	hit = false;
}
if (hp < 0) 
{ 
	game_restart();
	hp = 0;
}
hp = clamp(hp, 0, 100);

// Audio
audio_listener_position(x, y-10, 0);


