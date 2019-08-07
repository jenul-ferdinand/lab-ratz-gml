if (game_stop) exit;

if (hp <= 0) { instance_destroy(); }
if (direction > 120) and (direction < 240) { image_xscale = -1 } else { image_xscale = 1; }

// Artificial Intelligence
var player_distance = point_distance(x, y, target.x, target.y);
var player_direction = point_direction(x, y, target.x, target.y);
switch (state)
{
	case "Idle":
		// Arbitrary judgement
		counter++;
		if (counter >= idle_time)
		{
			var flip = choose(0, 1)
			switch (flip)
			{
				case 0:
					state = "Wander";
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
		
	case "Wander":
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
					state = "Idle";
					counter = 0;
					break;
			}
		}
		
		// Bootstrap states
		if (player_distance < chase_radius) { state = "Chase"; } 
		
		// Animation
		sprite_index = sprite_run;
		break;
		
	case "Chase":
		// Movement 
		mp_potential_step_object(target.x, target.y, chase_speed, colliding);
		
		// Switching states
		if (player_distance < shoot_radius) { state = "Shoot"; }
		if (player_distance > chase_radius) { state = "Idle"; }
		
		// Animation
		sprite_index = sprite_run;
		break;
		
	case "Approach":
		// Move
		mp_potential_step_object(target.x, target.y, chase_speed, colliding);
		
		// Bootstrap state
		if (player_distance < chase_radius) { state = "Chase"; }
		else 
		{
			counter++;
			if (counter >= approach_time) 
			{
				state = "Idle";	
				counter = 0;
			}
		}
		
		// Animation
		sprite_index = sprite_run;
		break;
		
	case "Shoot":
		// Cooldown
		counter++;
		if (counter >= shoot_cooldown)
		{
			// Sound effect
			if (!gunshot_played)
			{
				audio_play_sound(shoot_sound, 0, 0);
				gunshot_played = true;
			}
			
			// Bullet
			var shoot_dir = player_direction;
			var x_buffer = lengthdir_x(bullet_buffer, shoot_dir);
			var y_buffer = lengthdir_y(bullet_buffer, shoot_dir);
			var inst = instance_create_layer(x + x_buffer, (y-gun_ybuffer) + y_buffer, "Instances", bullet_index);
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
		if (player_distance > shoot_radius) { state = "Chase"; }
		
		// Animation
		sprite_index = sprite_idle;
		break;
}

// Bullet collision
//mask_index = spr_enemy_bullet_mask;
if (hit) 
{ 
	// Damage
	var dmg;
	with (obj_player.holding) { dmg = damage; }
	hp -= dmg;
	// Hitmarker
	audio_play_sound(snd_hitmarker, 10, 0);
	
	// State search
	if (state != "Chase") or (state != "Shoot") or (state != "Approach")
	{
		state = "Approach";	
		
		with (collision_circle(x, y, inclusion_radius, obj_enemy, false, true))
		{
			state = "Approach";	
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