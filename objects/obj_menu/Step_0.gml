if (!pause) exit;

down_key = keyboard_check_pressed(bind_down);
up_key = keyboard_check_pressed(bind_up);
enter_key = keyboard_check_pressed(bind_enter);

var ds_grid = menu_pages[page];
var ds_height = ds_grid_height(ds_grid);

if (inputting)
{
	switch (ds_grid[# 1, menu_option[page]])
	{
		case menu_type.shift: 
			var h_input = keyboard_check_pressed(bind_right) - keyboard_check_pressed(bind_left);
			if (h_input != 0)
			{
				ds_grid[# 3, menu_option[page]] += h_input;
				var shift_len = array_length_1d(ds_grid[# 4, menu_option[page]])-1;
				ds_grid[# 3, menu_option[page]] = clamp(ds_grid[# 3, menu_option[page]], 0, shift_len);
				
				// Sound effect here
			}
			break;
		case menu_type.slider:		
			var h_input = keyboard_check(bind_right) - keyboard_check(bind_left);
			if (h_input != 0)
			{
				ds_grid[# 3, menu_option[page]] += h_input * 0.01;
				ds_grid[# 3, menu_option[page]] = clamp(ds_grid[# 3, menu_option[page]], 0, 1); 
			}
			break;
		case menu_type.toggle:
			var h_input = keyboard_check_pressed(bind_right) - keyboard_check_pressed(bind_left);
			if (h_input != 0)
			{
				ds_grid[# 3, menu_option[page]] += h_input;
				ds_grid[# 3, menu_option[page]] = clamp(ds_grid[# 3, menu_option[page]], 0, 1);
				
				// Sound effect here
			}
			break;
		case menu_type.input:
			for (var i = 0; i < array_length_1d(illegal_keys); i++)
			{
				var binding_key = keyboard_lastkey;
				if (mouse_check_button_pressed(mb_left)) { binding_key = mb_left; } 
				if (binding_key != illegal_keys[i])
				{
					if (binding_key != ds_grid[# 3, menu_option[page]])
					{
						ds_grid[# 3, menu_option[page]] = binding_key;	
						audio_play_sound(snd_punch, 10, 0);	
					}
					variable_global_set(ds_grid[# 2, menu_option[page]], binding_key);
				}
			}
			break;
	}
}
else
{
	var option_change = down_key - up_key;
	if (option_change != 0)
	{
		menu_option[page] += option_change;
		menu_option[page] = clamp(menu_option[page], 0, ds_height-1);
	}
}

if (enter_key) 
{
	switch (ds_grid[# 1, menu_option[page]])
	{
		case menu_type.script_runner: 
			script_execute(ds_grid[# 2, menu_option[page]]);
			break;
		case menu_type.page_transfer:
			page = ds_grid[# 2, menu_option[page]];
			break;
		case menu_type.shift:
		case menu_type.slider:
		case menu_type.toggle:
			if (inputting) { script_execute(ds_grid[# 2, menu_option[page]], ds_grid[# 3, menu_option[page]]); }
		case menu_type.input:
			inputting = !inputting;
			break;
		 
	}
	
	audio_play_sound(snd_punch, 10, false);
}
 