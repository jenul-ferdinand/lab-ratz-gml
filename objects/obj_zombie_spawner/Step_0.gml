// Increment counter
spawn_counter++;

// Timing the counter
if (spawn_counter >= spawn_time) if (zombie_amount >= 1)
{
	// If player is in range
	if (point_distance(x, y, obj_player.x, obj_player.y) < spawn_radius)
	{
		// Spawn the zombie
		var zombie = instance_create_layer(x, y, "instances", obj_zombie);
		zombie.spawn_dir = spawn_dir;
	
		// Decrement spawned amount of zombies
		zombie_amount -= 1;
	
		// Bootstrap the zombie_counter
		spawn_counter = 0;
	}
}