// Functions
if (keyboard_check_pressed(vk_tab)) and (!pause)
{ 
	alarm[0] = 1;
	console_open = !console_open; 
	game_stop = !game_stop;
}
if (console_open) { game_stop = true; } else { game_stop = false; }

if (!console_open) exit;
if (pause) console_open = false; 

// Adding text
if (keyboard_check(vk_anykey)) and (string_length(console_text) < 20)
{
	console_text += string(keyboard_string);
	keyboard_string = "";
}

// Removing text
if (keyboard_check(vk_backspace)) and (!keyboard_check_pressed(vk_backspace)) and (text_delete_timer == 2)
{
	console_text = string_delete(console_text, string_length(console_text), 1);
	text_delete_timer = 0;
	keyboard_string = "";
}
if (keyboard_check_pressed(vk_backspace))
{
	console_text = string_delete(console_text, string_length(console_text), 1);
	keyboard_string = "";
	text_delete_timer = -4;
}

// Handling timer
if (text_delete_timer != 2) { text_delete_timer++; }
