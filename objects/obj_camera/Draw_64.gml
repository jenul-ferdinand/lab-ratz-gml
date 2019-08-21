// Healthbar
hp_draw = lerp(hp_draw, obj_player.hp, 0.1);
var xx = 10, yy = 10;
draw_sprite(spr_healthbar_back, 0, xx, yy);
draw_sprite_ext(spr_healthbar_front, 0, xx + 45, yy, ceil(hp_draw)/100, 1, 0, c_white, 1); 

#region Ammo amount
if (obj_player.holding != undefined) and (obj_player.holding != parent_keycard)
{
	var gun_ammo, gun_mag, gun_sprite, gun_holding, height_buffer, gun_x, gun_y, xx, yy, c, str;
	with (obj_player) 
	{
		// Reloading bar
		if (holding.reload_counter_start)
		{
			var x1 = 10;
			var y1 = window_height - 90;
			var x2 = 250;
			var y2 = window_height - 65;
			var value = (holding.reload_counter / holding.reload_time) * 100;
			draw_healthbar(x1, y1, x2, y2, value, c_gray, c_white, c_white, 0, true, false);
		}
	
		gun_ammo = holding.ammo;
		gun_mag = holding.mag;
		gun_sprite = object_get_sprite(holding);
		gun_holding = holding;
		other.ammo_draw = lerp(other.ammo_draw, gun_ammo, 0.1);
	}

	
	
	// Gun
	height_buffer = 30
	gun_x = 15 + sprite_get_width(gun_sprite);
	gun_y = window_height - height_buffer;
	draw_sprite_ext(gun_sprite, 0, gun_x, gun_y, 4, 4, 0, c_white, 1);
	
	if (gun_holding != obj_ruger)
	{
		// Counter
		height_buffer = 50;
		xx = (gun_x*2.5) + 10;
		yy = window_height - height_buffer;
		str = string(gun_mag) + "/" + string(round(ammo_draw));
		draw_set_font(fnt_ammo);
		c = c_black;
		draw_text_colour(xx+5, yy, str, c,c,c,c, 1);
		c = make_colour_rgb(255, 222, 92); 
		draw_text_colour(xx, yy, str, c,c,c,c, 1);
		draw_set_font(-1)
	}
	else
	{
		// Infinity
		height_buffer = 50;
		xx = (gun_x*2.5) + 10;
		yy = window_height - height_buffer;
		draw_sprite_ext(spr_infinity, 0, xx, yy, .5, .5, 0, c_white, 1);
	}
}
#endregion

// Version text
draw_set_font(fnt_main);
draw_set_halign(fa_right);
	var c, str, xx, yy, buffer;
	str = "dev build v1.0"
	xx = window_width - 10;
	yy = window_height - 34;
	buffer = 4;
	
	c = c_black; 
		draw_text_colour(xx+3, yy + buffer, str, c,c,c,c, 1);
	c = make_colour_rgb(255, 222, 92); 
		draw_text_colour(xx, yy, str, c,c,c,c, 1);
draw_set_halign(fa_left);
draw_set_font(-1);

// Points Text
draw_set_font(fnt_points);
draw_set_halign(fa_right);
	var c, str, xx, yy, buffer;
	points_draw = lerp(points_draw, points, 0.1);
	str = string(ceil(points_draw));
	xx = window_width - 10;
	yy = 10;
	buffer = 4;
	
	c = c_black; 
		draw_text_colour(xx+3, yy + buffer, str, c,c,c,c, 1);
	c = c_white; 
		draw_text_colour(xx, yy, str, c,c,c,c, 1);
draw_set_halign(fa_left);
draw_set_font(-1);