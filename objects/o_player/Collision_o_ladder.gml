with (o_player) {
	if up {
		state = states.CLIM;
		o_player.x = other.x;
		o_player.y = other.y;
	}
}
