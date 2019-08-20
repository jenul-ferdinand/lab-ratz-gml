// Arbitrary judgement
counter++;
if (counter >= idle_time)
{
	var flip = choose(0, 1)
	switch (flip)
	{
		// Change states
		case 0:
			state = "Wander";
			counter = 0;
			break;
					
		// Retry
		case 1: 
			counter = 0; 
			break;
	}
}
		
// Animation
sprite_index = sprite_idle;