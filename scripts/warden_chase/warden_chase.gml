// Movement 
mp_potential_step_object(target.x, target.y, chase_speed, colliding);
		
// Switching states
if (player_distance < shoot_radius) { state = "Shoot"; }
if (player_distance > chase_radius) { state = "Idle"; }
		
// Animation
sprite_index = sprite_run;