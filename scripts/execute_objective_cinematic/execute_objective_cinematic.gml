/// @desc execute_objective_cinematic()
/// @param objective_type

// Assign objective type
execute_objective(argument[0]);
// Create black bars
blackbars = instance_create_depth(x, y, -1000, obj_blackbars);
blackbars.slide_in = true;
// Zoom into player
obj_camera.zoom_in = true
// Freeze player
obj_player.freeze = true;