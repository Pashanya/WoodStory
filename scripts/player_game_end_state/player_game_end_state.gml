///player_game_end_state();
function player_game_end_state() {
	//get input

	//calculate movement
	vsp += global.grav;

	//drag
	hsp = lerp(hsp, 0, drag);

	//stop
	if abs(hsp) <= 0.5 hsp = 0;

	//check state
	if (image_index >= image_number - 1) {
		image_speed = 0;
		if lives <= 0 {
			o_game.game_over_lose = true;
		} else {
			get_input();
			if (jump or attack) and o_game.game_over_won_delay < -room_speed {			
				game_restart();
			}
		}
	}

	//apply movement
	collision();

	//apply animations
	anim();


}
