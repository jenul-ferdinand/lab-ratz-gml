counter++;
if (counter >= shoot_cooldown) and (!collision_line(x, y, obj_player.x, obj_player.y, parent_environment, false, false))
{
	for (var i = 0; i < bullet_amount; i++)
	{
		var x_buffer = lengthdir_x(bullet_buffer, player_direction);
		var y_buffer = lengthdir_y(bullet_buffer, player_direction);
		var bullet = instance_create_layer(x + x_buffer, (y-gun_ybuffer) + y_buffer, "instances", bullet_index);
		bullet.direction = player_direction;
		bullet.image_angle = bullet.direction;
		bullet.speed = bullet_speed;
		bullet.damage = damage;
	
		// Bullet Amount
		if (bullet_amount <= 1) 
		{ 
			// Random Recoil
			bullet.direction += random_range(-bullet_spread, bullet_spread+1); 
		}
		else 
		{
			// Double Shot
			var bspread;
			switch (i)
			{
				case 0: bspread = -bullet_spread; break;
				case 1: bspread = bullet_spread; break;
			}
			bullet.direction += bspread;
		}
	}
	
	counter = 0;
}

// Switching states
if (player_distance > shoot_radius) { state = "Chase"; }
if (player_distance > chase_radius) { state = "Idle"; }

// Animation
sprite_index = sprite_shoot;