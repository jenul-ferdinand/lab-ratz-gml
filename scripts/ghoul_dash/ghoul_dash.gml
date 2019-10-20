// Vector
hspd = lengthdir_x(dash_speed, player_direction);
vspd = lengthdir_y(dash_speed, player_direction);

// Move
#region Collisions
if (place_meeting(x + hspd, y, colliding))
{
	while (!place_meeting(x + sign(hspd), y, colliding))
	{
		x += sign(hspd);	
	}
	hspd = 0;
}
if (place_meeting(x, y + vspd, colliding))
{
	while (!place_meeting(x, y + sign(vspd), colliding))
	{
		y += sign(vspd);	
	}
	vspd = 0;
} 
#endregion
x += hspd;
y += vspd;
	
// Create dash effect
//var dash = instance_create_layer(x, y, "instances", obj_xenomorph_ghost);
//dash.sprite_index = sprite_index;
	
// Hitting
if (player_distance < dash_attack_radius) 
{ 
	state = "Dash Attack";
}
if (player_distance > dash_radius)
{
	state = "Chase";	
}

// Animation
sprite_index = sprite_run;