/// @desc dog_attack()

// Attacking

// Switching states
if (enemy_distance > attack_radius) { state = "Approach Enemy"; }
// If the targetted enemy is further away than the approach radius
if (enemy_distance > approach_radius) 
{ 
	state = "Follow"; 
	targetted_enemy = false;
	target_enemy = undefined;
} 
// If the targetted enemy is dead
if (!instance_exists(target_enemy))
{
	state = "Follow";
	targetted_enemy = false;
	target_enemy = undefined;
}
