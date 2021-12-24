//cycle through all enemies and see if they were hit
with(instance_place(x, y, o_player)) {
	//process_enemy_attack(5, 2.5);
}

//enable death at begin step
die = true;

if die instance_destroy();