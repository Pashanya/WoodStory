function calc_entity_movement() {
	//calculate movement for entities

	vsp += global.grav;

	//drag
	hsp = lerp(hsp, 0, drag);

	//stop
	if abs(hsp) <= 0.1 hsp = 0;


}
