if (direction > 120) and (direction < 240) { image_xscale = -1 } else { image_xscale = 1; }
player_distance = point_distance(x, y, target.x, target.y);
player_direction = point_direction(x, y, target.x, target.y);
image_speed = chase_speed * 1.5;

switch (state)
{
	case "Spawn":
		x += hspd;
		y += vspd;
		
		hspd = lengthdir_x(chase_speed, spawn_dir);
		vspd = lengthdir_y(chase_speed, spawn_dir);
		
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
		
		counter++;
		if (counter >= 10)
		{
			state = "Chase";
			counter = 0;	
		}
		
		break;
	
	case "Chase":
		// Move towards the player
		mp_potential_step_object(target.x, target.y, chase_speed, colliding);
		
		// Bootstrapping states
		if (player_distance < attack_radius)
		{
			state = "Attack";
			attack_counter = attack_time;
		}
		
		// Animation
		sprite_index = sprite_run;
		break;
		
	case "Attack":
		// Attacking
		attack_counter++;
		if (attack_counter >= attack_time)
		{
			if (collision_circle(x, y, attack_radius, obj_player, true, true))
			{
				obj_player.hp -= attack_damage;
				shake = 5;
				attack_counter = 0;
			}
		}
		
		// Bootstrap
		if (player_distance > attack_radius)
		{
			state = "Chase";	
		}
		
		// Animation
		sprite_index = sprite_attack;
		break;
}

// Hit & Death
enemy_death(reward_points, obj_scientist_dead, sprite_idle, false);
enemy_hit(snd_hitmarker, false, false, undefined, false, undefined, undefined);