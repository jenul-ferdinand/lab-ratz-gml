// Inherit the parent event
event_inherited();

// Create the trail effect
var trail = instance_create_layer(x, y, "instances", obj_bullet_trail);
trail.image_angle = image_angle;
trail.x = x;
trail.y = y;

