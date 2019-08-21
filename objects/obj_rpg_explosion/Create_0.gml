// Stats
creator = undefined;
bullet_creator = undefined;
target = undefined;
last_direction = undefined;
damage = 100;
others_hit = ds_list_create();

// Lighting
lighting_inner_radius = 0;
lighting_inner_radius_increase = 1;
lighting_inner_radius_max = 16;
lighting_outer_radius = 0;
lighting_outer_radius_increase = 1.5;
lighting_outer_radius_max = 32;
lighting_inner_colour = c_white;
lighting_outer_colour = c_dkgray;
lighting_shake_amount = 2;

// Shake
shake = 8;

// Audio
emitter_min = 64;
emitter_max = 128;
emitter = audio_emitter_create();
audio_falloff_set_model(audio_falloff_exponent_distance);
audio_emitter_falloff(emitter, emitter_min, emitter_max, 1);
// Audio Emitter
audio_emitter_position(emitter, x, y, 0);
var explosion = audio_play_sound_on(emitter, snd_explosion, 0, 0);
audio_sound_gain(explosion, 0.5, 0);