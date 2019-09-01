// Move
x += hspd;
y += vspd;
// Vector
hspd = lengthdir_x(force_applied, force_dir);
vspd = lengthdir_y(force_applied, force_dir);
// Interpolate
force_applied *= 0.9;
// Switch states
if (force_applied <= 0)
{
	state = "Chase";	
}

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

// Animation
sprite_index = sprite_idle;
	