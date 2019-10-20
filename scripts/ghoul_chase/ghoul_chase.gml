// Chase the player
mp_potential_step_object(target.x, target.y, chase_speed, colliding);
		
// Switching states
if (player_distance < dash_radius) { state = "Dash"; }
if (player_distance > chase_radius) { state = "Idle"; }
		
// Animation
sprite_index = sprite_run;