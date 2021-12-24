with(other) {
	if can_pickup {
		die = true;
		other.gems++;
		audio_play_sound(snd_pickup_gem, 5, false);
	}	
}