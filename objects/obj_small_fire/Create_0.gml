randomise();

scale = 1;
image_xscale = choose(-scale, scale)
image_speed = 1;

// Audio
emitter_min = 32;
emitter_max = 64;
emitter = audio_emitter_create();
audio_falloff_set_model(audio_falloff_exponent_distance);
audio_emitter_falloff(emitter, emitter_min, emitter_max, 1)

// Lighting
lighting = true;
lighting_height_buffer = -6;
lighting_inner_colour = c_white;
lighting_outer_colour = c_dkgray;
lighting_inner_radius = 12;
lighting_outer_radius = 24;
lighting_shake_amount = 1;