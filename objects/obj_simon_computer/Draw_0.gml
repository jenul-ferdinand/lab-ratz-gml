draw_self();

// Green
if (simon_picked[col.green]) or (player_picked[col.green])
{
	double_circle_lighting(
		green_light_xbuffer,
		green_light_ybuffer,
		green_light_high_inner_colour,
		green_light_high_outer_colour,
		inner_radius,
		outer_radius,
		shake_amount,
	);
	light_counter_start = true;
}
else
{
	double_circle_lighting(
		green_light_xbuffer,
		green_light_ybuffer,
		green_light_low_inner_colour,
		green_light_low_outer_colour,
		inner_radius,
		outer_radius,
		shake_amount,
	);
}

// Blue
if (simon_picked[col.blue]) or (player_picked[col.blue])
{
	double_circle_lighting(
		blue_light_xbuffer,
		blue_light_ybuffer,
		blue_light_high_inner_colour,
		blue_light_high_outer_colour,
		inner_radius,
		outer_radius,
		shake_amount,
	);
	light_counter_start = true;
}
else
{
		double_circle_lighting(
		blue_light_xbuffer,
		blue_light_ybuffer,
		blue_light_low_inner_colour,
		blue_light_low_outer_colour,
		inner_radius,
		outer_radius,
		shake_amount,
	);
}

// Red
if (simon_picked[col.red]) or (player_picked[col.red])
{
	double_circle_lighting(
		red_light_xbuffer,
		red_light_ybuffer,
		red_light_high_inner_colour,
		red_light_high_outer_colour,
		inner_radius,
		outer_radius,
		shake_amount,
	);
	light_counter_start = true;
}
else
{
	double_circle_lighting(
		red_light_xbuffer,
		red_light_ybuffer,
		red_light_low_inner_colour,
		red_light_low_outer_colour,
		inner_radius,
		outer_radius,
		shake_amount,
	);
}

// Yellow
if (simon_picked[col.yellow]) or (player_picked[col.yellow])
{
	double_circle_lighting(
		yellow_light_xbuffer,
		yellow_light_ybuffer,
		yellow_light_high_inner_colour,
		yellow_light_high_outer_colour,
		inner_radius,
		outer_radius,
		shake_amount,
	);
	light_counter_start = true;
}
else
{
	double_circle_lighting(
		yellow_light_xbuffer,
		yellow_light_ybuffer,
		yellow_light_low_inner_colour,
		yellow_light_low_outer_colour,
		inner_radius,
		outer_radius,
		shake_amount,
	);
}