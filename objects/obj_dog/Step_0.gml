if (!targetted_enemy) {
	target_enemy = instance_nearest(x, y, attacking);
	targetted_enemy = true;
}
enemy_direction = point_direction(x, y, target_enemy.x, target_enemy.y);
enemy_distance = point_distance(x, y, target_enemy.x, target_enemy.y);
follow_direction = point_direction(x, y, follow.x, follow.y);
follow_distance = point_distance(x, y, follow.x, follow.y);

if (dir > 90) and (dir < 270) { image_xscale = 1 } else { image_xscale = -1; }

switch (state)
{
	case "Follow": 
		dog_follow();
		sprite_index = spr_dog_run;
		break;
		
	case "Idle": 
		dog_idle(); 
		sprite_index = spr_dog_idle;
		break;
		
	case "Approach Enemy":
		dog_approach();
		sprite_index = spr_dog_run;
		break;
		
	case "Attack":
		dog_attack();
		sprite_index = spr_dog_attack;
		break;
}