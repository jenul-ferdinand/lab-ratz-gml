text_alpha -= alpha_reduction;
y -= floatup_speed;
alpha -= alpha_reduction;

if (text_alpha <= 0) { instance_destroy(); }