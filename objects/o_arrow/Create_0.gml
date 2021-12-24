//init
hsp = 0;
vsp = 0;
hsp_decimal = 0;
vsp_decimal = 0;
spd = 4;
facing = -1;
image_speed = 0;
hit_wall = false;

//destroy object
die = false;

//change objects layer after a set time
alarm[LAYER_CHANGE] = room_speed/7;