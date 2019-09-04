/// @desc dog_idle()

// Direction
dir = follow_direction;

// Switching states
if (follow_distance > idle_radius) { state = "Follow"; }