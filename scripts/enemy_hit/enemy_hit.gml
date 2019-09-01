/// @desc enemy_hit()
/// @param damage_resistance
/// @param sound_effect
/// @param approach?
/// @param notify?
/// @param notify_object
/// @param knockback?
/// @param knockback_power
/// @param knockback_direction

var damage_resistance = argument[0];
var sound_effect = argument[1];
var approach = argument[2]
var notify = argument[3];
if (notify == true)
	var notify_object = argument[4];
else 
	var notify_object = undefined;
var knockback = argument[5];
var knockback_force = argument[6];
var knockback_direction = argument[7];

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
		state = "Knockback";
		force_applied = knockback_force;
		force_dir = knockback_direction;	
	}
	
	// Flash
	flash_alpha = flash_alpha_max; 
	// Reset
	hit = false; 
}