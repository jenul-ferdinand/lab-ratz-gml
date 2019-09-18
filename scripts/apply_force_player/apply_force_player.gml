/// @desc apply_force_player()
/// @param direction
/// @param force
/// @param shake?

with (obj_player)
{
	// Force direction
	force_dir = argument[0];
	// Force application amount
	force_applied = argument[1];
	// Optional argument for screen shake
	if (argument_count >= 3) { shake = argument[2]; }
}