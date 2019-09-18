//display_set_gui_size(view_width, view_height); This might screw things up

// Create menu pages
ds_menu_main = scr_create_menu_page
(
	["RESUME",			menu_type.script_runner,	scr_resume_game],
	["SETTINGS",		menu_type.page_transfer,	menu_page.settings],
	["EXIT",			menu_type.script_runner,	scr_exit_game],
);

ds_settings = scr_create_menu_page
(
	["AUDIO",			menu_type.page_transfer,	menu_page.audio],
	["DIFFICULTY",		menu_type.page_transfer,	menu_page.difficulty],
	["GRAPHICS",		menu_type.page_transfer,	menu_page.graphics],
	["CONTROLS",		menu_type.page_transfer,	menu_page.controls],
	["BACK",			menu_type.page_transfer,	menu_page.main],
);

ds_menu_audio = scr_create_menu_page
(
	["MASTER",			menu_type.slider,			scr_change_volume,			.5,		[0, 1]],
	["SOUNDS",			menu_type.slider,			scr_change_volume,			.2,		[0, 1]],
	["MUSIC",			menu_type.slider,			scr_change_volume,			1,		[0, 1]],
	["BACK",			menu_type.page_transfer,	menu_page.settings],
);

ds_menu_difficulty = scr_create_menu_page
(
	["ENEMIES",			menu_type.shift,			scr_change_difficulty,		0,		["HARMLESS", "NORMAL", "TERRIBLE"]],
	["ALLIES",			menu_type.shift,			scr_change_difficulty,		0,		["DIM-WITTED", "NORMAL", "HELPFUL"]],
	["BACK",			menu_type.page_transfer,	menu_page.settings],
);

ds_menu_graphics = scr_create_menu_page
(
	["RESOLUTION",		menu_type.shift,			scr_change_resolution,		1,		["1024 x 576", "1280 x 720", "1366 x 768", "1600 x 900", "1920 x 1080"]],
	["WINDOW MODE",		menu_type.toggle,			scr_change_window_mode,		0,		["FULLSCREEN", "WINDOWED"]],
	["BACK",			menu_type.page_transfer,	menu_page.settings],
);

ds_menu_controls = scr_create_menu_page
(
	["UP",				menu_type.input,			"bind_up",					ord("W")],
	["LEFT",			menu_type.input,			"bind_left",				ord("A")],
	["DOWN",			menu_type.input,			"bind_down",				ord("S")],
	["RIGHT",			menu_type.input,			"bind_right",				ord("D")],
	["BACK",			menu_type.page_transfer,	menu_page.settings],
);	

page = menu_page.main;
menu_pages = [ds_menu_main, ds_settings, ds_menu_audio, ds_menu_difficulty, ds_menu_graphics, ds_menu_controls];
// This loops through all the pages and makes sure that the menu option always starts at the top
var i = 0; repeat(array_length_1d(menu_pages))
{
	menu_option[i] = 0;
	i++;
}

inputting = false;
illegal_keys = [vk_enter, vk_escape, vk_backspace];
