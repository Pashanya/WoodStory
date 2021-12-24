///player_crouch_state();
function player_dash_state() {
	//get input

	//calculate movement
	calc_movement();

	//check state
	
	if dash_dis >= 0 {
		hsp += facing * 6;
		hsp = lerp(hsp, 0, drag);
		hsp = min(abs(hsp), max_hsp) * facing;
		dash_dis--;
	} else 
	{
		dash_dis = dash_initial;
		state = states.IDLE;
	}
	
	//apply movement
	collision();

	//check players hp
	check_player_hp();

	//apply animations
	anim();

	has_block = false;
}
