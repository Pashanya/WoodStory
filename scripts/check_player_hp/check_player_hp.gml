///check_players_hp
function check_player_hp() {
	if hp <= 0 {
		state = states.DIE;
		image_index = 0;
		image_speed = 1;
		scale_x = 1;
		scale_y = 1;
		lives--;
		audio_play_sound(snd_player_die, 5, false);
	}


}
