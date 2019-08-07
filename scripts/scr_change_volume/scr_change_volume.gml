var type = menu_option[page];
var value = argument[0];

switch (type)
{
	case 0:
		audio_master_gain(value);
		break;
		
	case 1:
		audio_group_set_gain(audiogroup_soundeffects, value, 0);
		break;
		
	case 2:
		audio_group_set_gain(audiogroup_music, value, 0);
		break;
}