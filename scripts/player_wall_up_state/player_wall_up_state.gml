function player_wall_up_state() {
	//player_jump_state();
	//get input
	get_input();
	
	var side;
	//determine which side to test
	if facing > 0 side = bbox_right else side = bbox_left;
	
	var t1 = tilemap_get_at_pixel(global.map, side + facing, y);
	var t2 = tilemap_get_at_pixel(global.map, side - 5 * facing, y + 1);
		if t1 == SOLID y -= 1; else
			if t2 != SOLID 
			{
				hsp += facing * walk_spd;
			    hsp = lerp(hsp, 0, drag);
				hsp = min(abs(hsp), max_hsp) * facing;
			} else state =  states.IDLE;

	//apply movement
	collision();

	//check players hp
	check_player_hp();

	//apply animations
	anim();

	has_block = false;
}
