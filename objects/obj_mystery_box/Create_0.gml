event_inherited();
randomise();

interact_distance = unit
interact_cost = 950;

back_sprite = spr_mystery_box_back;
front_sprite = spr_mystery_box_front;
top_sprite = spr_mystery_box_roof;

spr_height = 9;

top_vertex = 18;
top_min = -1;
top_yaxis = top_min;

anim_open_box = false;
anim_close_box = false;
anim_wave_top = false;
anim_guncycle = false;

gun_sprites = [
	spr_ak47, 
	spr_acr300, 
	spr_vector, 
	spr_aug, 
	spr_raygun,
	spr_seneca,
	spr_deserteagle,
	spr_ruger,
	spr_awp,
	spr_famas,
	spr_flaregun,
	spr_rpg,
	spr_mp5,
	spr_m1_grand,
];
gun_objects = [
	obj_ak47, 
	obj_acr300, 
	obj_vector, 
	obj_aug, 
	obj_raygun,
	obj_seneca,
	obj_deserteagle,
	obj_ruger,
	obj_awp,
	obj_famas,
	obj_flaregun,
	obj_rpg,
	obj_mp5,
	obj_m1_grand,
]

gun_yaxis = spr_height+8;
gun_xaxis = 4;
index = 0;
index_max = array_length_1d(gun_sprites);
index_counter = 0;
index_time = 10;
index_loop = 0;
index_maxloops = 1;
index_choose = false;
