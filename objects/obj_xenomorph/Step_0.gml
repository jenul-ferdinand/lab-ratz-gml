if (direction > 120) and (direction < 240) { image_xscale = -1 } else { image_xscale = 1; }

// Artificial Intelligence
player_distance = point_distance(x, y, target.x, target.y);
player_direction = point_direction(x, y, target.x, target.y);

switch (state)
{
	case state_type.idle:
	// Arbitrary judgement
		counter++;
		if (counter >= idle_time)
		{
			var flip = choose(0, 1)
			switch (flip)
			{
				case 0:
					state = state_type.wander;
					counter = 0;
					break;
				
				case 1:
					counter = 0;
					break;
			}
		}
		
		// Animation
		sprite_index = sprite_idle;
		break;
		
	case state_type.wander:
		// Application of movement
		#region Collisions
		if (place_meeting(x + hspd, y, colliding))
		{
			while (!place_meeting(x + sign(hspd), y, colliding))
			{
				x += sign(hspd);	
			}
			hspd = 0;
		}
		if (place_meeting(x, y + vspd, colliding))
		{
			while (!place_meeting(x, y + sign(vspd), colliding))
			{
				y += sign(vspd);	
			}
			vspd = 0;
		} 
		#endregion
		x += hspd;
		y += vspd;
		
		// Arbitrary judgement
		counter++;
		if (counter >= wander_time)
		{
			var flip = choose(0, 1);
			switch (flip)
			{
				case 0:
					dir = random_range(0, 359);
					hspd = lengthdir_x(wander_speed, dir);
					vspd = lengthdir_y(wander_speed, dir);
					counter = 0;
					break;
					
				case 1: 
					state = state_type.idle;
					counter = 0;
					break;
			}
		}
		
		// Bootstrap states
		if (player_distance < chase_radius) { state = state_type.chase; } 
		
		// Animation
		sprite_index = sprite_run;
		break;
		
	case state_type.chase:
		// Movement 
		mp_potential_step_object(target.x, target.y, chase_speed, colliding);
		
		// Switching states
		//if (player_distance < shoot_radius) { state = state_type.shoot; }
		if (player_distance > chase_radius) { state = state_type.idle; }
		
		// Animation
		sprite_index = sprite_run;
		break;
}

// Bullet collision
if (hit) 
{ 
	// Damage
	var dmg;
	with (obj_player.holding) { dmg = damage; }
	hp -= dmg * 0.5;
	// Hitmarker
	audio_play_sound(snd_hitmarker, 10, 0);
	
	// State search
	with (collision_circle(x, y, inclusion_radius, obj_enemy, false, true))
	{
		state = state_type.approach;	
	}
	
	// Flash
	flash_alpha = flash_alpha_max; 
	// Reset
	hit = false; 
}

// Health
if (hp <= 0) { 
	// Create floating points
	var points = instance_create_layer(x, y, "particles", obj_floating_points);
	points.amount = 1000;
	
	// Create dead body
	instance_create_layer(x, y, "instances", obj_xenomorph_dead);
	
	// Destroy
	instance_destroy(); 
}