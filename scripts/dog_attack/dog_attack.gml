/// @desc dog_attack()

// Attacking

// Switching states
if (instance_exists(target_enemy))
{
	counter++;
	if (counter >= attack_time)
	{
		target_enemy.hp -= attack_damage;
		target_enemy.state = "Knockback";
		target_enemy.force_applied = attack_knockback;
		target_enemy.force_dir = enemy_direction;
		
		counter = 0;
	}
	
	if (enemy_distance > attack_radius) { state = "Approach Enemy"; }
	if (enemy_distance > approach_radius) { state = "Follow"; } 
}
else 
{ 
	state = "Follow"; 
} 