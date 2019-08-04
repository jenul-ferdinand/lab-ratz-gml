#macro RIGHT 0
#macro UP 1
#macro LEFT 2
#macro DOWN 3

globalvar pause, bind_drop, bind_flashlight, bind_revert, bind_enter, bind_left, bind_right, bind_up, bind_down, bind_shoot, bind_reload;
pause = true;
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

//instance_create_layer(x, y, "Instances", obj_camera);
//instance_create_layer(x, y, "Instances", obj_menu);
//instance_create_depth(x, y, -9999, obj_depth);

//room_goto_next();