/// @desc enemy_death()
/// @param points_amount
/// @param dead_instance
/// @param dead_sprite
/// @param create_drop?

var points_amount = argument[0];
var dead_instance = argument[1];
var dead_sprite = argument[2];
var create_drop = argument[3];

if (hp <= 0) 
{ 
	// Create floating points
	var _points = instance_create_layer(x, y, "particles", obj_floating_points);
	_points.amount = points_amount;
	points += _points.amount;
	
	// Create dead body
	var dead_body = instance_create_layer(x, y, "instances", dead_instance);
	dead_body.sprite_index = dead_sprite;
	
	// Chance to create a drop
	if (create_drop)
	{
		if (random(100) <= drop_chance) {
			instance_create_layer(x, y, "instances", drops[random_range(0, array_length_1d(drops))]); 
		}
	}
	
	// Destroy
	instance_destroy(); 
}