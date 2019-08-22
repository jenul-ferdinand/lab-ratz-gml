/// @desc scientist_shoot
/// @param id

var _id = argument[0];

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
	
	for (var i = 0; i < bullet_amount; i++)
	{
		// Bullet
		shoot_dir = player_direction;
		var x_buffer = lengthdir_x(bullet_buffer, shoot_dir);
		var y_buffer = lengthdir_y(bullet_buffer, shoot_dir);
		var inst = instance_create_layer(x + x_buffer, (y-gun_ybuffer) + y_buffer, "instances", bullet_index);
		inst.direction = shoot_dir;
		inst.image_angle = inst.direction;
		inst.speed = bullet_speed;
		inst.bullet_creator = _id;
		inst.damage = damage;
	
		// Unloaded index or other
		if (index_change)
		{
			if (counter >= shoot_cooldown) and (!collision_line(x, y, obj_player.x, obj_player.y, parent_environment, false, false))	
			{
				gun_sprite_index = 0;
			}	
		}
		
		// Bullet Amount
		for (var i = 0; i < bullet_amount; i++)
		{
			if (bullet_amount == 1) 
			{ 
				// Random Recoil
				inst.direction += random_range(-bullet_spread, bullet_spread+1); 
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
				inst.direction += bspread;
			}
		}
	}
	
	
			
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