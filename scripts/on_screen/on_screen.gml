/// @descr on_screen(buffer);
/// @arg buffer
/// is the object on the screen
function on_screen(argument0) {

	var _buffer = argument0;
	var _left = global.cx - _buffer;
	var _right = global.cx + global.cw + _buffer;
	var _top = global.cy - _buffer;
	var _bottom = global.cy + global.ch + _buffer;
	if x > _left and x < _right and y > _top and y < _bottom
	return true else return false;


}
