//destroy associated light
with(o_light) {
	if id = other.light_id {
		instance_destroy();
		break;
	}
}