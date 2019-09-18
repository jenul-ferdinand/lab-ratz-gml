// Targetting
if (!targetted_enemy)
{
	if (instance_exists(attacking))
	{
		target_enemy = instance_nearest(x, y, attacking);
		enemy_direction = point_direction(x, y, target_enemy.x, target_enemy.y);
		enemy_distance = point_distance(x, y, target_enemy.x, target_enemy.y);
		targetted_enemy = true;	
	}
}
else
{
	if (instance_exists(target_enemy)) 
	{
		enemy_direction = point_direction(x, y, target_enemy.x, target_enemy.y);
		enemy_distance = point_distance(x, y, target_enemy.x, target_enemy.y);
	
		if (!instance_exists(target_enemy)) 
		{
			target_enemy = undefined;
			targetted_enemy = false;
			state = "Idle";
		}
	}
}
if (!instance_exists(target_enemy)) 
{ 
	targetted_enemy = false;
	if (state == "Attack")
	{
		state = "Follow";
	}
} 

follow_direction = point_direction(x, y, follow.x, follow.y);
follow_distance = point_distance(x, y, follow.x, follow.y);

// Switching sprite angles
if (dir > 90) and (dir < 270) { image_xscale = 1 } else { image_xscale = -1; }

// States
switch (state)
{
	case "Idle": 
		dog_idle(); 
		sprite_index = spr_dog_idle;
		break;
		
	case "Follow": 
		dog_follow();
		sprite_index = spr_dog_run;
		break;
		
	case "Approach Enemy":
		dog_approach();
		sprite_index = spr_dog_run;
		break;
		
	case "Attack":
		dog_attack();
		sprite_index = spr_dog_attack;
		break;
		
	case "Teleport":
		dog_teleport();
		sprite_index = spr_dog_run;
		break;
}

// Teleporting
if (follow_distance > teleport_radius) { state = "Teleport"; }
if (current_room != room) { state = "Teleport"; }

// Collisions
var collisions = [obj_wall_bottom, obj_wall_top, obj_pod, obj_pod_broken, parent_enemy, obj_wood_table];
for (var i = 0; i < array_length_1d(collisions); i++)
{
	if (place_meeting(x + hspd, y, collisions[i]))
	{
		while (!place_meeting(x + sign(hspd), y, collisions[i]))
		{
			x += sign(hspd);	
		}
		hspd = 0;
	}
	if (place_meeting(x, y + vspd, collisions[i]))
	{
		while (!place_meeting(x, y + sign(vspd), collisions[i]))
		{
			y += sign(vspd);	
		}
		vspd = 0;	
	}
}