randomise();
event_inherited();
image_speed = 1;

// Stats
counter = 0;
hspd = 0;
vspd = 0;
dir = 0;
follow = obj_player;
attacking = parent_enemy;
state = "Follow";
target_enemy = undefined;
targetted_enemy = false;
colliding = parent_enemy_collidables;
current_room = room;
attack_damage = 20;
attack_time = 30;
attack_knockback = 2;

// Characteristics
idle_radius = 42;
approach_radius = 128;
attack_radius = 32;
teleport_radius = 256;
follow_spd = 2;
approach_spd = 3;