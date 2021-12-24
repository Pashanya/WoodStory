/// desc show_msg(message, secs_to_display);
/// @arg message
/// @secs_to_display
/// show message for the required time
function show_msg(argument0, argument1) {

	var _msg		= argument0;
	var _time		= argument1;

	with(o_game) {
		alarm[DISPLAY_MSG] = _time * room_speed;
		msg = _msg;
	}


}
