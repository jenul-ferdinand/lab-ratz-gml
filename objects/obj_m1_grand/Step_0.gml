// Inherit code from parent
event_inherited();

// The ping sound effect
if (mag <= 0)
{
	if (!ping_played)
	{
		audio_play_sound(snd_m1_grand_ping, 0, 0);
		ping_played = true;
	}
}
if (mag > 0) { ping_played = false; } 