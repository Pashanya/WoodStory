///player_block_state()
function player_block_state() {
	//get input
	get_input();

	//calculate movement
	calc_movement();

	//check state
	//blocking
	block_check();

	if attack {
		state = states.ATTACK;
		image_index = 0;
	}

	if jump {
		jumped();
	}

	//apply movement
	collision();

	//check players hp
	check_player_hp();

	//apply animations
	anim();

	has_block = true;
}
