function player_attack_state() {
	//player_attack_state()
	
	//get input
	
	//calculate movement
	calc_movement();
	
	end_atack = false;
	
    hsp = 0;
	
	//check state
	if image_index >= image_number - image_speed {
		if !on_ground() state = states.JUMP else
		if hsp != 0 state = states.WALK else state = states.IDLE;
		alarm[END_OF_COMBO] = room_speed/1.5;
		end_atack = true;
	}
	
	if combo == 1 and end_atack == true
	switch_atack = true;
	
	if combo != 1 and end_atack == true
	switch_atack = false;
	
	if jump {
		jumped();
		state = states.ATTACK;	
	}

	//create hitbox
	if image_index >= 2 and image_index <= 6 {
		var inst = instance_create_layer(x, y, "Player", o_player_attack_hitbox);
		inst.image_xscale = facing;
		//hsp += facing * walk_spd/3;
		//hsp = lerp(hsp, 0, drag);
		//hsp = min(abs(hsp), max_hsp) * facing; 
		if image_index == 2 audio_play_sound(snd_sword_swing, 20, false);
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
