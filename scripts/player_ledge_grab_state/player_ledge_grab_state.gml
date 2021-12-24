function player_ledge_grab_state() {
	//player_jump_state();
	//get input
	get_input();
	
	scale_x = 1;
		scale_y = 1;
		vsp = 0;
		hsp = 0;
		
	var side;
	//determine which side to test
	if facing > 0 side = bbox_right else side = bbox_left;

	var t1 = tilemap_get_at_pixel(global.map, side + facing, y - 21);
	var t2 = tilemap_get_at_pixel(global.map, side + facing, y - 20);
	
	if t1 != SOLID y += 1;
	if t2 != SOLID x += facing;
	
	//calculate movement
	if down {
		state = states.IDLE;
	}
		
	//jump wall
	if (jump and facing > 0 and left) or (jump and facing < 0 and right)
		{
			vsp += jump_spd;
			state = states.JUMP;
		} else

	// up to wall
	if jump or up {
		state = states.WALL_UP;
	}
		
		
	//apply movement
	collision();

	//check players hp
	check_player_hp();

	//apply animations
	anim();

	has_block = false;
}
