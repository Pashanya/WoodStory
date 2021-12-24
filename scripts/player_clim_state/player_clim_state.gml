function player_clim_state() {
	//get input
	get_input();

	//default on ladder
	facing = 1;
	scale_x = 1;
	scale_y = 1;
	jumps = jumps_initial + 2;
		
	//calculate movement
	hsp = 0;
	
	//check state
	if up or down {
		with (o_ladder)
		{
			if place_meeting(x,y,o_player)	other.x = x;
		}
			if up {
				vsp -= 5;
				vsp = min(abs(vsp), min_vsp);
			} else 
			{
				vsp += 5;
				vsp = min(abs(vsp), max_vsp);
			}
	} else vsp = 0;
	
	if !place_meeting(x, y, o_ladder)
		state = states.IDLE;
	
	if !place_meeting(x, y + vsp, o_ladder)
		vsp = 0;
	
	if jump {
		jumped();
	}
	
	if on_ground()
	state = states.IDLE;
	
	//apply movement
	collision();

	//check players hp
	check_player_hp();

	//apply animations
	anim();

	has_block = false;
}
