function jumped() {
	//standard jump off the ground
	if on_ground() jumps = jumps_initial;
	
	if !on_ground() {
	if jumps > 0 {
		scale_x = scale_min;
		scale_y = scale_max;
		state = states.JUMP;
		vsp_decimal = 0;
		vsp = jump_spd;
		jumps -= 2;
		jump_dust();
		audio_play_sound(snd_jump, 15, false);
		}
	}

	if jumps > 0 {
		scale_x = scale_min;
		scale_y = scale_max;
		state = states.JUMP;
		vsp_decimal = 0;
		vsp = jump_spd;
		jumps -= 1;
		jump_dust();
		audio_play_sound(snd_jump, 15, false);
	}
}
