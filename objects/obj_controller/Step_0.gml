// Pause game
if (keyboard_check_pressed(vk_escape)) { pause = !pause }
// Restart game
if (keyboard_check_pressed(ord("R")))
{
	game_restart();	
}