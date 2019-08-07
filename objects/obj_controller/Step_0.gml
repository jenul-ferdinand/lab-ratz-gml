// Pause game
if (keyboard_check_pressed(vk_escape)) 
{ 
	pause = !pause;
	game_stop = !game_stop;
}

if (pause)
{
	game_stop = true;	
}
else
{
	game_stop = false;	
}