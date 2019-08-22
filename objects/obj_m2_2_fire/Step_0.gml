// Destroy
if (destroy) { instance_destroy(); }

// Holding
var _holding = obj_player.holding;
if (_holding != undefined)
{
	// Rotation
	image_angle = point_direction(_holding.x, _holding.y, mouse_x, mouse_y);
	// Origin
	x = _holding.x + lengthdir_x(_holding.bullet_buffer, image_angle);
	y = _holding.y + lengthdir_y(_holding.bullet_buffer, image_angle);
}
else
{ 
	// Destroy particle
	instance_destroy(); 
} 
