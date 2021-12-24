function rocky_jump_land_state() {
	//check health
	check_enemy_hp();

	//get inputs

	//calculate movement
	calc_entity_movement();

	//modify state
	if image_index >= image_number - image_speed {
		state = rocky_states.IDLE;
		image_index = 0;
		image_speed = 0;
	}

	//apply movement
	collision();

	//animations
	rocky_anim();


}
