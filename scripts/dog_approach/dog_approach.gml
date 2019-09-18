/// @desc dog_approach()

// Move
if (instance_exists(target_enemy))
{
	mp_potential_step_object(target_enemy.x, target_enemy.y, approach_spd, colliding);

	// Switching states
	if (enemy_distance > approach_radius) { state = "Follow"; }
	if (enemy_distance < attack_radius) { state = "Attack"; }
}
else 
{ 
	state = "Follow";
} 