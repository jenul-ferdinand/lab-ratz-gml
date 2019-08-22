// Inherit the parent event
event_inherited();

// Create Fire 
if (cooldown_delay == 0) 
{
	if (mag != 0)
	{
		if (!instance_exists(obj_m2_2_fire))
		{
			fire_particle = instance_create_layer(x, y, "particles", obj_m2_2_fire);
		}
	}
	else
	{	
		if (instance_exists(obj_m2_2_fire))
		{
			fire_particle.destroy = true;	
		}
	}
}

