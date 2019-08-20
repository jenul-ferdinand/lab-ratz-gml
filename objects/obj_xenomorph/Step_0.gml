if (direction > 120) and (direction < 240) { image_xscale = -1 } else { image_xscale = 1; }
player_distance = point_distance(x, y, target.x, target.y);
player_direction = point_direction(x, y, target.x, target.y);

// Artificial Intelligence
switch (state)
{
	case "Idle":
		enemy_idle();
		dashed = false;
		break;
		
	case "Wander":
		enemy_wander();
		dashed = false;
		break;
		
	case "Chase":
		xenomorph_chase();
		dashed = false;
		break;
		
	case "Approach":
		enemy_approach();
		dashed = false;
		break;
	
	case "Dash Melee": 
		xenomorph_dashmelee(); 
		break;
		
	case "Retreat":
		xenomorph_retreat();
		break;
}

// Bullet collision
enemy_hit(damage_resistance, sfx_hit, true, notify_object);

// Health
enemy_death(points_death, object_dead, sprite_idle, false);