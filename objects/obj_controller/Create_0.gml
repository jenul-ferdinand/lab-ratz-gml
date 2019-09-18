instance_create_depth(x, y, -9999, obj_console);
cursor_sprite = spr_crosshair;

// Init
init_globalvars();
init_enums();

// Audio
audio_group_load(audiogroup_music);
audio_group_load(audiogroup_soundeffects);

// Create gun stats
scr_guns_stats();

// Debug
show_debug_overlay(true);
godmode = false;