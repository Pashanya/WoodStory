if !instance_exists(o_fade) {
script_execute(states_array[state]);
} else {
	//stop animations playing
	image_index = 0;
}