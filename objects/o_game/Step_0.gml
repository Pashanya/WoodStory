show_debug_overlay(true);

if mouse_check_button_pressed(mb_middle) {
	repeat(3) {
		instance_create_layer(mouse_x, mouse_y, "Gems", o_gem);	
	}	
}

if mouse_check_button_pressed(mb_middle) {
	if instance_exists(o_player) o_player.hp = 0;
}

if game_over_lose {
	with(o_player) {
		get_input();
		if jump or attack {
			game_restart();	
		}
	}
}
//reduce delay time in game over room
if game_over_won {
	game_over_won_delay--;	
}