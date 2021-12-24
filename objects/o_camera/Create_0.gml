//get dimensions
var _w = camera_get_view_width(view_camera[0]);
var _h = camera_get_view_height(view_camera[0]);

//create camera
camera = camera_create_view(0, 0, _w, _h, 0, -1, -1, -1, 128, 128);
view_set_camera(0, camera);

//camera following vars
follow = noone;
move_to_x = x;
move_to_y = y;

//how fast the camera pans
camera_pan_speed_initial = 0.05;	//lower = slowed pan
camera_pan_speed = 1;

//reset camera to default pan speed
alarm[CAMERA_RESET] = 3;

//screen shake
screen_shake = false;
screen_shake_amount_initial = 3;
screen_shake_amount = screen_shake_amount_initial;

//move onto main room
room_goto_next();

move = 1;

cam = view_camera[0];
view_w_half = camera_get_view_width(camera) * 0.5;
view_h_half = camera_get_view_height(camera) * 0.5;
xTo = xstart;
yTo = ystart;