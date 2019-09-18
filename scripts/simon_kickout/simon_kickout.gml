/// @desc simon_kickout()

// Reset max turns
player_max_turns = turns;
simon_max_turns = turns;
// Execute reset
stage = 0;
state = "Idle";
obj_player.freeze = false;
interacted = false;
// Knockback
apply_force_player(270, 5, 10);		
// Bars
bars.slide_out = true;			
// Clear list
ds_list_clear(player_list)
ds_list_clear(simon_list);