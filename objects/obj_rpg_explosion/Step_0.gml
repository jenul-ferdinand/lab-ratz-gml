if (target == undefined) exit;
// Damage others
var hit_damage = ds_list_create();
var hits = instance_place_list(x, y, target, hit_damage, false);
if (hits > 0)
{
	for (var i = 0; i < hits; i++)
	{
		var hit_id = hit_damage[| i];
		if (ds_list_find_index(others_hit, hit_id) == -1)
		{
			ds_list_add(others_hit, hit_id);
			with (hit_id)
			{
				// Screen shake
				shake = 5;
				
				// Play sound
				audio_play_sound(hit_sfx, 0, 0);
				
				// Change values
				hp -= other.damage;
				state = "Knockback"
				dir = other.last_direction;
				force_dir = other.last_direction;
				force_applied = 4;

			}	
		}	

	}
}