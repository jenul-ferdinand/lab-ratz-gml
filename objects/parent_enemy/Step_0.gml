// Force knockback behaviour
if (force_applied > 0)
{
	hspd_force = lengthdir_x(force_applied, force_dir);
	vspd_force = lengthdir_y(force_applied, force_dir);
	force_applied *= 0.9;
}