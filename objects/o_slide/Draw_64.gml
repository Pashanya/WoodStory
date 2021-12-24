//get dimensions
var dw = display_get_gui_width();
var dh = display_get_gui_height();


//fade to colour
if fade_to_colour {
	alpha += fade_spd;
	if alpha >= 1 {
		fade_to_colour = false;
		//pan camera quickly
		o_camera.camera_pan_speed = 1;
	}
} else {
	//fade from colour
	alpha = 1;
	
}

draw_set_alpha(alpha);
draw_rectangle_colour(0, 0, dw, dh, col, col, col, col, false);

	var mx = dw/2;
	var my = dh/2;	
	
	if alpha >= 1 {
		msg = "Press any key"
		dh = dh + sin(get_timer()/500000)*5;
		draw_set_halign(fa_center);
		draw_set_font(fnt_bookman);
		draw_set_color(c_red);
		draw_text(dw/2 + 1, dh *.90 + 1, msg);
		draw_set_color(c_white);
		draw_text(dw/2, dh *.90, msg);	
	}
	
	o_player.depth = layer_get_depth(layer_get_id("Fade")) - 1;

	draw_sprite(s_die, 0, mx, my - 20);
	
	

