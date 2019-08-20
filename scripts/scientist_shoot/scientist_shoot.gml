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
	inst.creator = obj_scientist_white;
	inst.damage = damage;
			
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