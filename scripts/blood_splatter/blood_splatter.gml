/// @desc blood_splatter
/// @param min
/// @param max

var blood = instance_create_layer(x, y, "wall_bottom", obj_blood);
blood.x = other.x + (irandom_range(argument[0], argument[1])*choose(-1, 1));
blood.y = other.y + (irandom_range(argument[0], argument[1])*choose(-1, 1));