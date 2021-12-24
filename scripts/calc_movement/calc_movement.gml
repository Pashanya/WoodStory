///calc_movement();
function calc_movement() {
	hsp += (right - left) * walk_spd;
	vsp += global.grav;

	//drag
	hsp = lerp(hsp, 0, drag);

	//stop
	if abs(hsp) <= 0.1 hsp = 0;

	//face correct way
	if hsp != 0 facing = sign(hsp);

	//limit speed
	hsp = min(abs(hsp), max_hsp) * facing;

	//stop stretch
	scale_x = lerp(scale_x, 1, scale_decay);
	scale_y = lerp(scale_y, 1, scale_decay);


}
