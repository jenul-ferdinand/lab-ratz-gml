// Dash at the player
mp_potential_step_object(target.x, target.y, dash_speed, colliding);

// Player damage and knockback
if (player_distance < melee_radius) and (!dashed)
{
	// Damaging player
	with (obj_player)
	{
		// Remove hp
		hp -= other.melee_damage;
		// Knockback
		force_dir = other.player_direction;
		force_applied = other.knockback_power;
		// Blood splatter
		blood_splatter(0, 14);
		
		// Executed
		hit = true;
	}
			
	// Executed
	dashed = true;
}
		
// Create ghosts
counter++;
if (counter >= 2)
{
	var ghost = instance_create_layer(x, y, "instances", obj_xenomorph_ghost);
	ghost.sprite_index = sprite_index;
	ghost.image_xscale = image_xscale;
	ghost.fade_speed = ghost_fade_speed;
	counter = 0;
}
		
// Switching states
if (player_distance > dash_radius) { state = "Chase"; }
if (player_distance > chase_radius) { state = "Wander"; }
if (player_distance < retreat_radius) and (dashed) { state = "Retreat"; }

// Animation
sprite_index = sprite_run;