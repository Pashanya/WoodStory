var _msg = "Find the chest to open the door";

if other.stage != 999 {
	//get layer id
	var layer_id = layer_get_id("Stage" + string(other.stage));

	//activate layer
	instance_activate_layer(layer_id);

	//destroy trigger
	instance_destroy(other);
	
	//play spawn sound
	audio_play_sound(snd_enemies_spawn, 30, false);
	
	//close door
	if other.stage == 5 and !o_chest.open {
		var layer_id = layer_get_id("Door");
		if layer_get_visible(layer_id) audio_play_sound(snd_door_opening_closing, 50, false);
		layer_set_visible(layer_id, false);
		
		//give player a msg
		show_msg(_msg, 4);
	}
} else {
	//game end
	if o_chest.open {
		o_game.game_over_won = true;
		fade_to_room(rm_game_end, 0, 0, 1, c_black);
		state = states.GAME_END;
		instance_destroy(other);
	} else {
		//give player a msg
		show_msg(_msg, 4);
	}
}