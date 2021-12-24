///player_die_state();
function player_die_state() {
	//get input
	
	//calculate movement
	vsp += global.grav;

	//drag
	hsp = lerp(hsp, 0, drag);

	//stop
	if abs(hsp) <= 0.5 hsp = 0;

	//check state
	if (image_index >= image_number - 1) {
		image_speed = 0;
		if lives <= 0 {
			o_game.game_over_lose = true;
		} else {
			//restart msg
			get_input(); 
			if !instance_exists(o_slide)
				instance_create_layer(x, y, "Fade", o_slide);
			if keyboard_check(vk_anykey) and o_slide.can_restart == true {			
				fade_to_room(room, room_start_pos_x, room_start_pos_y, room_start_facing, c_black);
				o_slide.can_restart = false;
				//allow instant camera panning
				with(o_camera) {
					//enable instant panning
					camera_pan_speed = 1;
					//reset camera pan speed
					alarm[CAMERA_RESET] = 3;
				}
			}
		}
	}

	//apply movement
	collision();

	//apply animations
	anim();


}
