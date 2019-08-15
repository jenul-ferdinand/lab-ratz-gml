// Audio Emitter
audio_emitter_position(emitter, x, y, 0);
if (!audio_is_playing(snd_smallfire)) 
{
	audio_play_sound_on(emitter, snd_smallfire, 0, 0);
}