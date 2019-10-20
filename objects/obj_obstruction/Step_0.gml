var player_distance = point_distance(x, y, obj_player.x, obj_player.y);

// If player interacts with the obstruction
if (player_distance < interact_distance) 
{
	draw_interaction_text = true;
	
	if (points >= cost) and (keyboard_check_pressed(ord("E")))
	{
		delete = true;
		points -= cost;
	}
}
// Execute
if (delete)
{
	for (var i = 0; i < array_length_1d(obstructions); i++)
	{
		// Destroy all obstructions
		with (obstructions[i])
		{
			y -= 1
			image_alpha -= 0.05; 
			if (image_alpha <= 0) 
			{
				instance_destroy();
				counter_start = true;
			}
		}
	
		// Destroy self
		if (counter_start) { counter++; } 
		if (counter >= 5)
		{
			delete = false;
			instance_destroy();
		}	
	}
}