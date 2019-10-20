image_index = 0;
image_speed = 0;
freeze_counter = 0;
freeze_counter_start = false;
freezed = false;
freeze_time = room_speed * 4;

// Interaction
interact_distance = 76;
open = false;
enterable = false;

// Puzzles & Challenges
normal = true;
complete = false;
locked = false;

keycard = false;
annihilate = false;



// Room changing
goal_x = undefined;
goal_y = undefined;
transfer = undefined;
transition = transition_slidefade;

// Lighting
x_buffer = 1;
y_buffer = -10;
lighting_type = col.green;
lighting_inner_radius = 10;
lighting_outer_radius = 15;
lighting_shake_amount = 0.5;