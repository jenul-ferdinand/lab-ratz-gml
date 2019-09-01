player_direction = point_direction(x, y, obj_player.x, obj_player.y);
player_distance = point_distance(x, y, obj_player.x, obj_player.y);

if (direction > 120) and (direction < 240) { image_xscale = -1 } else { image_xscale = 1; }
if (gun_dir > 120) and (gun_dir < 240) { gun_yscale = -1 } else { gun_yscale = 1; }

// Artificial Intelligence
switch (state)
{
	case "Idle":
		enemy_idle();
		direction = 0;
		break;
		
	case "Wander":
		enemy_wander();
		direction = dir;
		break;
		
	case "Chase":
		warden_chase();
		direction = player_direction;
		break;
		
	case "Shoot":
		warden_shoot();
		gun_dir = player_direction;
		direction = player_direction;
		break;
		
	case "Knockback":
		warden_knockback();
		direction = force_dir;
		break;
}	

if (player_distance < 48) { knockback_player = true; } 
if (knockback_player) 
{
	with (obj_player)
	{
		force_dir = other.player_direction;
		force_applied = 6;	
	}
	
	state = "Knockback";
	force_applied = 4;
	force_dir = -player_direction;
	knockback_player = false;
}

enemy_hit(damage_resistance, snd_hitmarker, true, false, -1, true, 4, -player_direction);
enemy_death(2000, obj_warden_dead, sprite_idle, false);