// Inherit the parent event
event_inherited();

// Create the trail effect
var trail = instance_create_layer(x, y, "instances", obj_bullet_trail);
trail.image_angle = image_angle;
trail.image_alpha = image_alpha;
trail.image_yscale = image_yscale;
trail.x = x;
trail.y = y;

// Bullet life
image_alpha -= alpha_loss;
if (image_alpha <= 0)
{
	instance_destroy();
}	