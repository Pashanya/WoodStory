function player_jump_state() {
	//player_jump_state();
	//get input
	get_input();

	//calculate movement
	calc_movement();

	//ledge grab
	var side;
	//determine which side to test
	if facing > 0 side = bbox_right else side = bbox_left;

	var t1 = tilemap_get_at_pixel(global.map, side + 5 * facing, y - 24);
	var t2 = tilemap_get_at_pixel(global.map, side + 5 * facing, y - 20);

	if	!on_ground() and vsp > 0 and t2 == SOLID and t1 != SOLID { 
		//grab on wall
								
		scale_x = 1;
		scale_y = 1;
		vsp = 0;
		hsp = 0;
		jumps = 1;	
		state = states.LEDGE_GRAB;
	}


	//check state
	if on_ground() {
		//apply stretch
		scale_x = scale_max;
		scale_y = scale_min;
		if hsp != 0 state = states.WALK else state = states.IDLE;
		//create dust if landing
		if vsp > 0 {
			instance_create_layer(x, y, "Dust", o_player_dust_land);
			audio_play_sound(snd_landing, 20, false);
		}
	}

	if attack {
		state = states.ATTACK;
		image_index = 0;
	}

	//enable double jumps
	if jump {
		jumped();
	}

	if down and place_meeting(x,y,o_ladder) {
		state = states.CLIM;
	}

	//enable smaller jumps
	if vsp < 0 and !jump_held vsp = max(vsp, jump_spd/jump_dampner);

	//apply movement
	collision();

	//check players hp
	check_player_hp();

	//apply animations
	anim();

	has_block = false;
}
