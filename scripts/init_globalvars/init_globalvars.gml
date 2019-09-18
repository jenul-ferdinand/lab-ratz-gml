/// @desc init_globalvars()

// Macros
#macro RIGHT 0
#macro UP 1
#macro LEFT 2
#macro DOWN 3

globalvar points, pause, game_stop, bind_drop, bind_flashlight, bind_revert, bind_enter, bind_left, bind_right, bind_up, bind_down, bind_shoot, bind_reload;
points = 0;
pause = false;
game_stop = false;

// Binds
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