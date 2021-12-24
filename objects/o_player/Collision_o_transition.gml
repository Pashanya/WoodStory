if hp > 0 {
	with(other) {
		if !active {
			fade_to_room(target_rm, target_x, target_y, other.facing, c_black);
			active = true;
		}
	}
}