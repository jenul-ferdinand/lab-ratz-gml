/// @desc enemy_hit()
/// @param sound_effect
/// @param approach?
/// @param notify?
/// @param notify_object
/// @param knockback?
/// @param knockback_power
/// @param knockback_direction

var sound_effect = argument[0];
var approach = argument[1]
var notify = argument[2];
if (notify == true)
	var notify_object = argument[3];
else 
	var notify_object = undefined;
var knockback = argument[4];
var knockback_force = argument[5];
var knockback_direction = argument[6];

if (hit) 
{ 
	// Damage
	var dmg = hit_damage;
	hp -= dmg;
	
	// Hitmarker
	audio_play_sound(sound_effect, 10, 0);
	
	// Notify nearby enemies
	if (notify)
	{
		if (state != "Chase") or (state != "Shoot") or (state != "Approach")
		{
			if (approach) state = "Approach";	
		
			with (collision_circle(x, y, notify_radius, notify_object, false, true))
			{
				state = "Approach";	
			}
		}
	}
	
	// Knockback
	if (knockback)
	{
		force_applied = knockback_force;
		force_dir = knockback_direction;	
	}
	
	// Flash
	flash_alpha = flash_alpha_max; 
	// Reset
	hit = false; 
}