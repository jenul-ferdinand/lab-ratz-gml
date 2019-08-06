if (holder == noone) exit;

var dir = point_direction(x, y, mouse_x, mouse_y);
// Origin
x = holder.x - lengthdir_x(current_recoil, dir);
y = (holder.y - 9) - lengthdir_y(current_recoil, dir);
// Rotation
image_angle = dir;
// Flipping
if (dir > 90) and (dir < 270) { image_yscale = -1; } else { image_yscale = 1; } 

// Shooting
var mouseb;
if (automatic) { mouseb = mouse_check_button(bind_shoot); } 
else { mouseb = mouse_check_button_pressed(bind_shoot); }
if (mouseb) 
{
	if (cooldown == 0)
	{
		cooldown = firerate;
		cooldown_delay = cooldown_startup;
	}
}
if (cooldown_delay == 0) and (mag != 0)
{
	// Muzzle flash activate
	if (muzzle_flash == false) { muzzle_flash = true; } 
	
	// Audio
	audio_play_sound(sound_shoot, 10, 0);
		
	for (var i = 0; i < bullet_amount; i++)
	{
		// Bullet
		var buffer_x = lengthdir_x(bullet_buffer, dir);
		var buffer_y = lengthdir_y(bullet_buffer, dir);
		var inst = instance_create_layer(x + buffer_x, (y-1) + buffer_y, "Instances", bullet);
		inst.direction = dir;
		inst.image_angle = inst.direction;
		inst.speed = bullet_speed;
		inst.creator = obj_player;
			
		if (bullet_amount == 1) 
		{ 
			// Random Recoil
			inst.direction += random_range(-bullet_spread, bullet_spread+1); 
		}
		else 
		{
			// Double Shot
			var bspread;
			switch (i)
			{
				case 0: bspread = -bullet_spread; break;
				case 1: bspread = bullet_spread; break;
			}
			inst.direction += bspread;
		}
		
		// Ammo and recoil
		mag--;
		current_recoil = recoil;
	}
		
	// Recoil push back player
	with (obj_player)
	{
		force_dir = -inst.direction;
		force_applied = other.recoil_push;
	}
}

// Calculations
cooldown_delay = max(-1, cooldown_delay-1);
if (cooldown_delay == -1) { cooldown = max(0, cooldown-1); }
current_recoil = max(0, floor(current_recoil * 0.8));

// Reloading
if (mag <= 0) and (!reload) and (ammo != 0)
{ 
	if (keyboard_check_pressed(bind_reload)) 
	{ 
		reload_counter_start = true;
	}
}
if (reload_counter_start) { reload_counter++; }
if (reload_counter >= reload_time) { reload = true; }
if (reload)
{
	mag = mag_max;
	ammo -= mag_max;
	reload = false;
	reload_counter = 0;
	reload_counter_start = false;
}

// Dropping gun
with (obj_player)
{
	if (holding != undefined)
	{
		if (keyboard_check_pressed(bind_drop))
		{
			var ent = instance_create_layer(x, y-4, "Instances", holding.pickup);
			if (!ent.drop) { ent.drop = true; } 
			ent.unpickable = true;
			ent.gun_id = other.id;
		
			holding.destroy = true;
			holding.holder = noone;
			holding = undefined;
		}
	}
}

// Flashlight and Lasersight
if (keyboard_check_pressed(bind_flashlight))
{
	if (laser_sight) { laser_sight_toggle = !laser_sight_toggle; }
	if (flash_light) { flash_light_toggle = !flash_light_toggle; }
}
if (laser_sight) { flash_light = false; }	
if (flash_light) { laser_sight = false; }

// Laser sight accuracy increase
if (laser_sight_toggle) 
{
	bullet_spread = bullet_spread_new; 
	recoil_push = 0; 
}


// Destroy
if (destroy) { instance_destroy(); }
