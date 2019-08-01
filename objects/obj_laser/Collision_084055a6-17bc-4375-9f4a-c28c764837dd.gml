// Hit
other.hit = true;
// Damage
var dmg;
with (obj_player.holding) { dmg = damage; }
other.hp -= dmg;
// Hitmarker
audio_play_sound(snd_hitmarker, 10, 0);
// Destroy Bullet
instance_destroy();