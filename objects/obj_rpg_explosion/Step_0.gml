if (target == undefined) exit;

// Increment lighing radius
lighting_inner_radius += lighting_inner_radius_increase;
lighting_outer_radius += lighting_outer_radius_increase;
lighting_inner_radius = clamp(lighting_inner_radius, 0, lighting_inner_radius_max);
lighting_outer_radius = clamp(lighting_outer_radius, 0, lighting_outer_radius_max);

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
				//var _creator = other.bullet_creator;
				//force_dir = _creator.shoot_dir;
				force_applied = 4;
			}	
		}	
	}
}