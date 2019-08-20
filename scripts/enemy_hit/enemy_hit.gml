/// @desc enemy_hit()
/// @param damage_resistance
/// @param sound_effect
/// @param notify?
/// @param notify_object

var damage_resistance = argument[0];
var sound_effect = argument[1];
var notify = argument[2];
if (notify == true)
	var notify_object = argument[3];
else 
	var notify_object = undefined;

if (hit) 
{ 
	// Damage
	var dmg;
	with (obj_player.holding) { dmg = damage; }
	hp -= dmg * damage_resistance;
	
	// Hitmarker
	audio_play_sound(sound_effect, 10, 0);
	
	// Notify nearby enemies
	if (notify)
	{
		if (state != "Chase") or (state != "Shoot") or (state != "Approach")
		{
			state = "Approach";	
		
			with (collision_circle(x, y, inclusion_radius, notify_object, false, true))
			{
				state = "Approach";	
			}
		}
	}
	
	// Flash
	flash_alpha = flash_alpha_max; 
	// Reset
	hit = false; 
}