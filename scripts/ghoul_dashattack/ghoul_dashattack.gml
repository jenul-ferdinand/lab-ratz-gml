// Hurt player
with (target)
{
	// Damage
	hp -= other.dash_damage;
	// Knockback
	force_applied = 5;
	force_dir = other.player_direction;
	// Blood splatter
	blood_splatter(0, 14);
}

// Reset
dashed = false;
state = "Dash Back";