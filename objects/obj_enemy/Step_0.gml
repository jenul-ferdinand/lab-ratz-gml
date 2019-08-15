if (game_stop) or (pause) exit;

// Health
if (hp <= 0) { 
	// Create floating points
	var points = instance_create_layer(x, y, "particles", obj_floating_points);
	points.amount = 200;
	
	// Create dead body
	instance_create_layer(x, y, "instances", obj_enemy_dead);
	
	// Destroy
	instance_destroy(); 
}

// Direction flipping
if (direction > 120) and (direction < 240) { image_xscale = -1 } else { image_xscale = 1; }
if (gun_dir > 120) and (gun_dir < 240) { gun_yscale = -1 } else { gun_yscale = 1; }

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
		gun_dir = dir;
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
		gun_dir = dir;
		break;
		
	case state_type.chase:
		
		// Movement 
		mp_potential_step_object(target.x, target.y, chase_speed, colliding);
		
		// Switching states
		if (player_distance < shoot_radius) { state = state_type.shoot; }
		if (player_distance > chase_radius) { state = state_type.idle; }
		
		// Animation
		sprite_index = sprite_run;
		gun_dir = player_direction;
		break;
		
	case state_type.approach:
		
		// Move
		mp_potential_step_object(target.x, target.y, chase_speed, colliding);
		
		// Bootstrap state
		if (player_distance < chase_radius) { state = state_type.chase; }
		else 
		{
			counter++;
			if (counter >= approach_time) 
			{
				state = state_type.idle;	
				counter = 0;
			}
		}
		
		// Animation
		sprite_index = sprite_run;
		gun_dir = player_direction;
		break;
		
	case state_type.shoot:
		gun_dir = player_direction;
		// Cooldown
		counter++;
		
		if (counter >= shoot_cooldown) and (!collision_line(x, y, obj_player.x, obj_player.y, parent_environment, false, false))
		{
			// Sound
			if (!gunshot_played)
			{
				audio_emitter_position(emitter, x, y-gun_ybuffer, 0);
				var sound = audio_play_sound_on(emitter, shoot_sound, 0, 0);
				audio_sound_gain(sound, sound_gain, 0);
				gunshot_played = true;
			}
			
			// Bullet
			var shoot_dir = player_direction;
			var x_buffer = lengthdir_x(bullet_buffer, shoot_dir);
			var y_buffer = lengthdir_y(bullet_buffer, shoot_dir);
			var inst = instance_create_layer(x + x_buffer, (y-gun_ybuffer) + y_buffer, "instances", bullet_index);
			inst.direction = shoot_dir;
			inst.image_angle = inst.direction;
			inst.speed = bullet_speed;
			inst.creator = obj_enemy;
			
			// Reset cooldown
			counter = 0;
		}
		else
		{
			// Reset sound effect variable
			gunshot_played = false;	
		}
		
		// Bootstrapping states
		if (player_distance > shoot_radius) { state = state_type.chase; }
		
		// Animation
		sprite_index = sprite_idle;
		break;
}

// Bullet collision
if (hit) 
{ 
	// Damage
	var dmg;
	with (obj_player.holding) { dmg = damage; }
	hp -= dmg;
	// Hitmarker
	audio_play_sound(snd_hitmarker, 10, 0);
	
	// State search
	if (state != state_type.chase) or (state != state_type.shoot) or (state != state_type.approach)
	{
		state = state_type.approach;	
		
		with (collision_circle(x, y, inclusion_radius, obj_enemy, false, true))
		{
			state = state_type.approach;	
		}
	}
	
	// Flash
	flash_alpha = flash_alpha_max; 
	// Reset
	hit = false; 
}

// Flash Reduction
if (flash_alpha > 0) 
{
	flash_alpha -= flash_reduction;	
}