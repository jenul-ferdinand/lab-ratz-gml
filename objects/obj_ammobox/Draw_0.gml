// Shadow
draw_sprite_ext(sprite_index, image_index, x, y, 1, shadow_yscale, image_angle, shadow_colour, shadow_alpha);
// Item
var hover = scr_wave(y-hover_y1, y-hover_y2, 1, 0);
draw_sprite(sprite_index, image_index, x, hover);