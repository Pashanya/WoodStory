/// @description 
//flash red when taking damage
if hurt {
	flash_counter++;
	var flash_on_time = 8;	//how long the sprite will stay red
	if flash_counter < flash_on_time {
		//comment all out for an empty flash
		//flash white
		gpu_set_fog(true, c_white, 0, 0);
		draw_self();
		gpu_set_fog(false, c_white, 0, 0);
		//flash red
		//draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_maroon, image_alpha);	
	} else {
		draw_self();
		if flash_counter > flash_on_time * 4 flash_counter = 0;
	}
} else {
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale * scale_x, image_yscale * scale_y, image_angle, c_white, image_alpha);
}
//show bounding box
//draw_set_alpha(0.3);
//draw_rectangle_colour(bbox_left, bbox_top, bbox_right, bbox_bottom, c_red, c_red, c_red, c_red, false);
//draw_set_alpha(1);

//draw_text(x, y + 10, dash_dis);
//draw_text(x, y + 20, state);
//draw_text(x,y+20,"y " + string(y));
//draw_text(x,y+30,bbox_top);
//draw_text(x+ 20,y,switch_atack);