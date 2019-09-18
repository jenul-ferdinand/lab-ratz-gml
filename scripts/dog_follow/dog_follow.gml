/// @desc dog_follow()

// Move
mp_potential_step_object(follow.x, follow.y, follow_spd, colliding);

// Switching states
if (follow_distance < idle_radius) { state = "Idle"; }
if (instance_exists(target_enemy))
{
	if (enemy_distance < approach_radius) { state = "Approach Enemy"; } 
	if (enemy_distance < attack_radius) { state = "Attack"; }
}
