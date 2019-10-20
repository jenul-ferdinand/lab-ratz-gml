// Vector
hspd = lengthdir_x(dash_speed, -player_direction);
vspd = lengthdir_y(dash_speed, -player_direction);

// Move
#region Collisions
if (place_meeting(x + hspd, y, colliding))
{
	while (!place_meeting(x + sign(hspd), y, colliding))
	{
		x += sign(hspd);	
	}
	hspd = 0;
}
if (place_meeting(x, y + vspd, colliding))
{
	while (!place_meeting(x, y + sign(vspd), colliding))
	{
		y += sign(vspd);	
	}
	vspd = 0;
} 
#endregion
x += hspd;
y += vspd;

// Stopping
if (player_distance > 76)
{
	state = "Chase";
}

// Animation
sprite_index = sprite_run;