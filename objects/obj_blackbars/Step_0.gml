// Animation
if (slide_in)
{
	bar_height = lerp(bar_height, bar_height_max, bar_lerp);
	if (bar_height >= bar_height_max)
	{
		bar_height = bar_height_max;
		slide_in = false;
	}
}
if (slide_out) and (!slide_in)
{
	bar_height = lerp(bar_height, bar_height_min, bar_lerp);
	if (bar_height <= bar_height_min)
	{
		bar_height = bar_height_min;
		slide_out = false;
	}
}