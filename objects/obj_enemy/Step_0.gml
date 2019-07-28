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