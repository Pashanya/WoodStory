/// @descr fade_to_room(target_room, target_x, target_y, facing, colour);
/// @arg target_room
/// @arg target_x
/// @arg target_y
/// @arg facing
/// @arg colour
function fade_to_room(argument0, argument1, argument2, argument3, argument4) {

	var _fade = instance_create_layer(x, y, "Fade", o_fade);
	with(_fade) {
		target_rm	= argument0;
		target_x	= argument1;
		target_y	= argument2;
		facing		= argument3;
		col			= argument4;
	}


}
