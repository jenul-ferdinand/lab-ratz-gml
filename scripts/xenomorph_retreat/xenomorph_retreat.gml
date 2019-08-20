// Vector
hspd = lengthdir_x(chase_speed, -player_direction);
vspd = lengthdir_y(chase_speed, -player_direction);
// Move and Collide
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
		
// Switching States
if (player_distance > retreat_radius) { state = "Chase"; } 
counter++
if (counter >= retreat_time) { 
	state = "Wander";
	counter = 0;
}
		
// Animation
sprite_index = sprite_run;
		
// Reset
dashed = false;