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

if (force_applied > 0)
{
	hspd = lengthdir_x(force_applied, dir);
	vspd = lengthdir_y(force_applied, dir);
	force_applied *= 0.9;
}

if (force_applied <= 0)
{
	state = "Approach"
}