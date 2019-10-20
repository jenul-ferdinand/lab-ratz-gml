show_debug_overlay(debug);

// Pause game
if (instance_exists(obj_player))
{
	if (keyboard_check_pressed(vk_escape)) and (!obj_player.freeze)
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
}

if (keyboard_check_pressed(ord("P"))) { game_restart(); } 

// God mode
if (godmode)
{
	obj_player.hp = 100;	
}

// Ambient sounds
if (!audio_is_playing(snd_ambient_1))
{
	audio_play_sound(snd_ambient_1, 0, 0);
}
//if (!audio_is_playing(snd_soundtrack))
//{
//	audio_play_sound(snd_soundtrack, 0, 0);
//}	
