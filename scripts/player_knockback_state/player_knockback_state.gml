///player_knockback_state();
function player_knockback_state() {
	//get input
	get_input();

	//calculate movement
	vsp += global.grav;

	//drag
	hsp = lerp(hsp, 0, drag);

	//stop
	if abs(hsp) <= 0.5 hsp = 0;

	//check state
	//change state after animation
	if (image_index >= image_number - image_speed) and hsp == 0 {
		//chnage state
		if block {
			if down state = states.CROUCH_BLOCK else state = states.BLOCK;	
		} else {
			state = states.IDLE;
		}
	}

	//apply movement
	collision();

	//check players hp
	check_player_hp();

	//apply animations
	anim();


}
