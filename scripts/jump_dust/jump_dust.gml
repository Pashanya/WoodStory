function jump_dust() {
	//jump_dust();
	var inst = instance_create_layer(x, y, "Dust", o_player_dust_jump);
	inst.image_xscale = facing;



}
