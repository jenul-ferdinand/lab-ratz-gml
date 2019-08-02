// Moving
mp_potential_step_object(obj_player.x, obj_player.y, 1, parent_enemy_collidables);
sprite_index = spr_enemy_scientist_run;

// Shooting
//counter++;
//if (counter >= 30)
//{
//	var inst = instance_create_layer(x, y, "Instances", obj_laser);
//	inst.direction = point_direction(x, y, obj_player.x, obj_player.y);
//	inst.image_angle = inst.direction;
//	inst.speed = 2;
//	counter = 0;
//}

if (direction > 120) and (direction < 240) { image_xscale = -1 } else { image_xscale = 1; }

// Death
if (hp <= 0) { instance_destroy(); }

// Flash
if (hit) 
{ 
	flash_alpha = 0.75; 
	hit = false; 
}
if (flash_alpha > 0) 
{
	flash_alpha -= 0.05;	
}