// Inputs
var down_key = keyboard_check(bind_down);
var right_key = keyboard_check(bind_right);
var left_key = keyboard_check(bind_left);
var up_key = keyboard_check(bind_up);
// Input Change
x_input = right_key - left_key;
y_input = down_key - up_key;

var len;
if (x_input != 0) or (y_input != 0) 
{
	len = spd; 
	sprite_index = spr_player_run;
} 
else 
{ 
	len = 0; 
	sprite_index = spr_player;
} 

// Force
if (force_applied > 0)
{
	hspd_force = lengthdir_x(force_applied, force_dir);
	vspd_force = lengthdir_y(force_applied, force_dir);
	force_applied *= 0.9;
}
// Movement
dir = point_direction(0, 0, x_input, y_input);
hspd = lengthdir_x(len, dir) - hspd_force;
vspd = lengthdir_y(len, dir) + vspd_force;

#region Collisions
if (place_meeting(x + hspd, y, obj_collidable))
{
	while (!place_meeting(x + sign(hspd), y, obj_collidable))
	{
		x += sign(hspd);	
	}
	hspd = 0;
}
if (place_meeting(x, y + vspd, obj_collidable))
{
	while (!place_meeting(x, y + sign(vspd), obj_collidable))
	{
		y += sign(vspd);	
	}
	vspd = 0;	
}
#endregion

// Application of movement
x += hspd;
y += vspd;

// Facing direction
if (hspd != 0) and (hspd_force == 0)
{ 
	image_xscale = sign(hspd); 
}
else
{
	var mdir = point_direction(x, y, mouse_x, mouse_y);
	if (mdir > 90) and (mdir < 270) { image_xscale = -1; } 
	else { image_xscale = 1; }
}

// Dropping gun
if (holding != undefined)
{
	if (keyboard_check_pressed(bind_drop))
	{
		var ent = instance_create_layer(x, y-4, "Instances", holding.pickup);
		if (!ent.drop) { ent.drop = true; } 
		ent.unpickable = true;
		
		holding.destroy = true;
		holding.holder = noone;
		holding = undefined;
	}
}


