switch (state)
{
	case "Idle":
		sprite_index = spr_enemy_scientist;
		break;
		
	case "Move":
	
		break;
		
	case "Chase":
		mp_potential_step_object(obj_player.x, obj_player.y, chase_speed, parent_enemy_collidables);
		
		if (point_distance(x, y, obj_player.x, obj_player.y) < shoot_radius) { state = "Shoot"; }
		sprite_index = spr_enemy_scientist_run;
		break;
		
	case "Shoot":
		counter++;
		if (counter >= 30)
		{
			if (!gunshot_played)
			{
				audio_play_sound(snd_ak47_shoot, 0, 0);
				gunshot_played = true;
			}
			
			var inst, x_buffer, y_buffer, shoot_dir;
			shoot_dir = point_direction(x, y, obj_player.x, obj_player.y);
			x_buffer = lengthdir_x(bullet_buffer, shoot_dir);
			y_buffer = lengthdir_y(bullet_buffer, shoot_dir);
			inst = instance_create_layer(x + x_buffer, (y-gun_ybuffer) + y_buffer, "Instances", obj_bullet);
			inst.direction = shoot_dir;
			inst.image_angle = inst.direction;
			inst.speed = bullet_speed;
			inst.creator = obj_enemy;
			counter = 0;
		}
		else
		{
			gunshot_played = false;	
		}
		
		if (point_distance(x, y, obj_player.x, obj_player.y) > shoot_radius) { state = "Chase"; }
		sprite_index = spr_enemy_scientist;
		break;
}

if (direction > 120) and (direction < 240) { image_xscale = -1 } else { image_xscale = 1; }

// Death
if (hp <= 0) { instance_destroy(); }

// Flash
if (hit) 
{ 
	flash_alpha = 0.75; 
	hit = false; 
}
if (flash_alpha > 0) 
{
	flash_alpha -= 0.05;	
}