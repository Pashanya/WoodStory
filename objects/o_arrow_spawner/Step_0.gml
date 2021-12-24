//shoot if within view
if on_screen(global.tile_size) {
	//onject is within the screen
	if can_fire {
		can_fire = false;	
		fire_delay = fire_delay_initial;			
		//set spawn position from the centre
		var ypos = ((sprite_get_height(sprite_index) / 2) - 2) * spawn_pos;
		//switch position for next arrow
		spawn_pos *= -1;
		
		//create arrow
		var inst = instance_create_layer(x, y + ypos, "Arrow_shoot", o_arrow);
		inst.facing = facing;
		
		//create spark
		if facing var side = bbox_right else var side = bbox_left;
		var inst = instance_create_layer(side, y + ypos, "Arrow_shoot", o_arrow_spark);
		inst.image_xscale = facing;
		
		//sound
		audio_play_sound(snd_arrow_firing, 10, false);
		
	} else {
		fire_delay--;
		if fire_delay <= 0 {
			can_fire = true;
		}
	}
} else {
	fire_delay--;	
}