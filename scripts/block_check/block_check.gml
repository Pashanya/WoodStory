function block_check() {
	if block {
		if down state = states.CROUCH_BLOCK;
		else state = states.BLOCK;
		hsp = 0;	
	} else {
		//leave the block state
		if down {
			state = states.CROUCH;
			hsp = 0;
		} else {
			if hsp != 0 {
				if !on_ground() state = states.JUMP else state = states.WALK;	
			} else {
				state = states.IDLE;	
			}
		}
	}


}
