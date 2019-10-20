// Objective
if (state != undefined)
{
	switch (state)
	{
		case objective_state.annihilate:
			// Initialization
			if (!objective_created)
			{
				// Execute Objective
				execute_objective_cinematic(state);
				
				// Done
				objective_created = true;
				objective_destroy = true;
			}
			
			// Deactivation
			if (objective_destroy)
			{
				objective_counter++;
				if (objective_counter >= objective_counter_time)
				{
					// Bootstrap objective
					bootstrap_objective_cinematic();
				
					// Deactivate objective_room
					if (blackbars.slide_out = false) 
					{
						objective_created = false;
						objective_destroy = false;
					}
				}
			}
			
			// Objective completion
			if (!instance_exists(parent_enemy))
			{	
				state = undefined;
				target_door.complete = true;
				instance_destroy();
			}
			break;
	}
}
