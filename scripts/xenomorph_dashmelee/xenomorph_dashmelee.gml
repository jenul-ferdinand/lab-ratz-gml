// Dash at the player
mp_potential_step_object(target.x, target.y, dash_speed, colliding);

// Player damage and knockback
if (player_distance < melee_radius) and (!dashed)
{
	with (obj_player)
	{
		hp -= other.melee_damage;
		force_dir = other.player_direction;
		force_applied = other.knockback_power;
		hit = true;
	}
			
	// Reset
	dashed = true;
}
		
// Create ghosts
counter++
if (counter >= 2)
{
	var ghost = instance_create_layer(x, y, "instances", obj_xenomorph_ghost);
	ghost.image_xscale = image_xscale;
	ghost.fade_speed = ghost_fade_speed;
	counter = 0;
}
		
// Switching states
if (player_distance > dash_radius) { state = "Chase"; }
if (player_distance > chase_radius) { state = "Wander"; }
if (player_distance < retreat_radius) and (dashed) { state = "Retreat"; }
		
// Audio
if (!audio_is_playing(snd_xenomorph_hiss))
{
	var dash_sound = audio_play_sound(snd_xenomorph_hiss, 0, 0);
	audio_sound_pitch(dash_sound, random_range(0.9, 1.1));
}

// Animation
sprite_index = sprite_run;