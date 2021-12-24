//draw line
//set blend mode
gpu_set_blendmode(bm_add);
//draw head
draw_set_colour(col_head);
draw_line_width(xp, yp, x, y, min(abs(speed), 1) * line_width);
//draw tail
draw_set_colour(col_tail);
draw_line_width(xpp, ypp, xp, yp, min(abs(speed), 1) * line_width);
//draw lighting
draw_circle_color(x, y, speed, merge_colour(c_black, col_head, speed * intensity), c_black, 0);	
//reset blendmode
gpu_set_blendmode(bm_normal);

//update variables
//update positions
xpp = xp;
ypp = yp;
//xp = x;
//yp = y;
xp = xprevious;
yp = yprevious;

//update dir
direction += dir_change;
dir_change *= dir_change_decay;

//update speed
speed *= speed_decay;

//die
if abs(speed) < 0.1 instance_destroy();