randomise();
event_inherited();

// Stats
hspd = 0;
vspd = 0;
dir = 0;
follow = obj_player;
attacking = parent_enemy;
state = "Follow";
target_enemy = undefined;
targetted_enemy = false;

// Characteristics
idle_radius = 64;
approach_radius = 128;
attack_radius = 16;
follow_spd = 2;
approach_spd = 3;