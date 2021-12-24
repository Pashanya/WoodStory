with(other) {
	if can_pickup {
		die = true;
		with(other) {
			if hp < max_hp hp++;	
		}
		audio_play_sound(snd_pickup_hp, 15, false);
	}	
}