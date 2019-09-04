/// @desc dog_approach()

// Move
x += hspd;
y += vspd;

// Vector
dir = enemy_direction;
hspd = lengthdir_x(approach_spd, dir);
vspd = lengthdir_y(approach_spd, dir);

// Switching states
if (enemy_distance > approach_radius) { state = "Follow"; }
if (enemy_distance < attack_radius) { state = "Attack"; }