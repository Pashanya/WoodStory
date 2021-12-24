/// anim();
function anim() {
	sprite_index = sprites_array[state];
	mask_index = mask_array[state];
	image_xscale = facing;

	switch(state) {
		case states.JUMP:
			if vsp < 0 image_index = 0 else image_index = 1;
		break;
		case states.ATTACK:
		
			if !on_ground() {
				if combo == 2 sprite_index = s_player_air_attack2; else
				sprite_index = s_player_air_attack;
			}
			else
			//on ground
				if hsp != 0 and state != states.ATTACK sprite_index = s_player_attack_walk
				else  {
					if 	switch_atack == true sprite_index = s_player_attack2;
					else
					sprite_index = s_player_attack;
				}
		break;
		case states.HURTING:
			if !on_ground() {
				sprite_index = s_player_jump;	
				if vsp < 0 image_index = 0 else image_index = 1;
			}
		break;
	}


}
