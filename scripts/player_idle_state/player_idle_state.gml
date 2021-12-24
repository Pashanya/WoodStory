///player_idle_state();
function player_idle_state() {
	//get input
	get_input();

	//calculate movement
	calc_movement();
	
	image_angle = 0;
	//check state
	if hsp != 0 and state != states.ATTACK state = states.WALK;
 
	if attack and combo < 3 {
		state = states.ATTACK;
		image_index = 0;
	}

	if jump {
		jumped();
	}
	
	if dash state = states.DASH;

	if block {
		state = states.BLOCK;
		hsp = 0;
	}

	if down and !place_meeting(x,y,o_ladder) {
		state = states.CROUCH;
		hsp = 0;	
	}

	//apply movement
	collision();

	//check players hp
	check_player_hp();

	//apply animations
	anim();

	has_block = false;
}
