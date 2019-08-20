// Move towards the player
mp_potential_step_object(target.x, target.y, chase_speed, colliding);
		
// Bootstrap state
if (player_distance < chase_radius) { state = "Chase"; }
else 
{
	counter++;
	if (counter >= approach_time) 
	{
		state = "Idle";	
		counter = 0;
	}
}
		
// Animation
sprite_index = sprite_run;