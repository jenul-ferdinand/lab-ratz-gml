/// @desc transition_slidefade()
/// @param goal
/// @param goal_x
/// @param goal_y

var fade = instance_create_depth(obj_player.x, obj_player.y, -9999, obj_slidefade);
fade.goal = argument[0];
fade.goal_x = argument[1];
fade.goal_y = argument[2];
fade.script = true;