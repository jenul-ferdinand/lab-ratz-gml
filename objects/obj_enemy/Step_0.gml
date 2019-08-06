var player_distance = point_distance(x, y, target.x, target.y);
var player_direction = point_direction(x, y, target.x, target.y);

switch (state)
{
	case "Idle":
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
		mp_potential_step_object(hspd, vspd, wander_speed, parent_enemy_collidables);
		
		counter++;
		if (counter >= wander_time)
		{
			var flip = choose(0, 1);
			switch (flip)
			{
				case 0:
					var dir = random_range(0, 359);
					hspd = lengthdir_x(0, dir);
					vspd = lengthdir_y(0, dir);
					counter = 0;
					break;
					
				case 1: 
					state = "Idle";
					counter = 0;
					break;
			}
		}
		// Switching states
		if (player_distance < chase_radius) { state = "Chase"; } 
		
		// Animation
		sprite_index = sprite_run;
		break;
		
	case "Chase":
		// Movement
		mp_potential_step_object(target.x, target.y, chase_speed, parent_enemy_collidables);
		
		// Switching states
		if (player_distance < shoot_radius) { state = "Shoot"; }
		if (player_distance > chase_radius) { state = "Idle"; }
		
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
		
		// Switching States
		if (player_distance > shoot_radius) { state = "Chase"; }
		
		// Animation
		sprite_index = sprite_idle;
		break;
}

// Flipping
if (direction > 120) and (direction < 240) { image_xscale = -1 } else { image_xscale = 1; }
// Death
if (hp <= 0) { instance_destroy(); }
// Flash
if (hit) 
{ 
	flash_alpha = flash_alpha_max; 
	hit = false; 
}
if (flash_alpha > 0) 
{
	flash_alpha -= flash_reduction;	
}