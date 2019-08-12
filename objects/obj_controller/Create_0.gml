instance_create_depth(x, y, -9999, obj_console);
cursor_sprite = spr_crosshair;

#macro RIGHT 0
#macro UP 1
#macro LEFT 2
#macro DOWN 3
// Binds
globalvar pause, game_stop, bind_drop, bind_flashlight, bind_revert, bind_enter, bind_left, bind_right, bind_up, bind_down, bind_shoot, bind_reload;
pause = true;
game_stop = false;
bind_drop = ord("Q");
bind_flashlight = ord("F");
bind_revert = ord("X");
bind_enter = vk_enter;
bind_left = ord("A");
bind_right = ord("D");
bind_up = ord("W");
bind_down = ord("S");
bind_shoot = mb_left;
bind_reload = ord("R");
// Audio
audio_group_load(audiogroup_music);
audio_group_load(audiogroup_soundeffects);
//audio_play_sound(snd_soundtrack, 0, 0);
// Create gun stats
scr_guns_stats();