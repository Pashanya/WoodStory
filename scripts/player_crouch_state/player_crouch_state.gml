///player_crouch_state();
function player_crouch_state() {
	//get input
	get_input();

	//calculate movement
	calc_movement();

	//check state
	//blocking
	block_check();
	
	hsp = 0;	

	if attack {
		state = states.ATTACK;
		image_index = 0;
	}

	if dash state = states.DASH;

	if jump {
		jumped();
	}

	//apply movement
	collision();

	//check players hp
	check_player_hp();

	//apply animations
	anim();

	has_block = false;
}
