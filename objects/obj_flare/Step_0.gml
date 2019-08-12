image_alpha -= 0.008;
speed *= 0.9788976;
if (speed <= 0)
{
	speed = 0;	
}

if (counter_start) counter++;
if (counter >= death_time)
{
	instance_destroy();	
}