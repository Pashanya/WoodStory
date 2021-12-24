//flash red when taking damage
if hurt {
	flash_counter++;
	var flash_on_time = 8;	//how long the sprite will stay red
	if flash_counter < flash_on_time {
		draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_maroon, image_alpha);	
	} else {
		draw_self();
		if flash_counter > flash_on_time * 2 flash_counter = 0;
	}
} else {
	draw_self();	
}