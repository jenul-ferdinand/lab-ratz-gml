if (game_stop) or (pause) exit;

// Variables
player_distance = point_distance(x, y, target.x, target.y);
player_direction = point_direction(x, y, target.x, target.y);

// Direction flipping
if (direction > 120) and (direction < 240) { image_xscale = -1 } else { image_xscale = 1; }
if (gun_dir > 120) and (gun_dir < 240) { gun_yscale = -1 } else { gun_yscale = 1; }

// Artificial Intelligence
switch (state)
{
	case "Idle": enemy_idle(); break;
	case "Wander": 
		enemy_wander(); 
		gun_dir = dir;
		break;
	case "Chase": 
		scientist_chase(); 
		gun_dir = player_direction;
		break;
	case "Approach": 
		enemy_approach(); 
		gun_dir = player_direction;
		break;
	case "Shoot": 
		scientist_shoot(id); 
		gun_dir = player_direction;
		break;
	case "Knockback":
		scientist_knockback();
		gun_dir = player_direction;
		break;
}

// RPG reloaded image index
if (gun_sprite_index == 0) and (index_change)
{
	counter++
	if (counter >= shoot_cooldown)
	{
		gun_sprite_index = 1;	
	}
}

// Bullet collision
enemy_hit(hit_sfx, approach, notify, notify_object, false, -1, -1);
// Death
enemy_death(death_points, death_object, sprite_idle, create_drop);
// Flash Reduction
if (flash_alpha > 0) 
{
	flash_alpha -= flash_reduction;	
}