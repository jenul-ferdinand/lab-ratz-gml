// Application of movement
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
		
// Arbitrary judgement
counter++;
if (counter >= wander_time)
{
	var flip = choose(0, 1);
	switch (flip)
	{
		// Choose direction and create vector
		case 0:
			dir = random_range(0, 359);
			hspd = lengthdir_x(wander_speed, dir);
			vspd = lengthdir_y(wander_speed, dir);
			counter = 0;
			break;
				
		// Change state to idle
		case 1: 
			state = "Idle";
			counter = 0;
			break;
	}
}
		
// Bootstrap states
if (player_distance < chase_radius) { state = "Chase"; } 
		
// Animation
sprite_index = sprite_run;