/// @descr scr_screen_shake(seconds, shake_amount);
/// @arg seconds_to_shake
/// @arg shake_amount_-1def
function scr_screen_shake(argument0, argument1) {

	var _time = argument0;
	var _amount = argument1;

	with(o_camera) {
		//default
		if _amount == -1 _amount = screen_shake_amount_initial;
		screen_shake = true;
		alarm[SCREEN_SHAKE_TIME] = room_speed * _time;
		screen_shake_amount = _amount;	
	}


}
