function rocky_jump_start_state() {
	//check health
	check_enemy_hp();

	//get inputs

	//calculate movement
	calc_entity_movement();

	//modify state
	if image_index >= image_number - image_speed {
		state = rocky_states.JUMP;
		vsp = jump_spd;
		if on_screen(40) audio_play_sound(snd_frog_jump, 20, false);
	}

	//apply movement
	collision();

	//animations
	rocky_anim();

}
