/// @desc dog_follow()

// Move
x += hspd;
y += vspd;

// Vector
dir = follow_direction;
hspd = lengthdir_x(follow_spd, dir);
vspd = lengthdir_y(follow_spd, dir);

// Switching states
if (follow_distance < idle_radius) { state = "Idle"; }
if (enemy_distance < approach_radius) { state = "Approach Enemy"; } 
if (enemy_distance < attack_radius) { state = "Attack"; } 

