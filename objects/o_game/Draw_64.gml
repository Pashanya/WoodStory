//720x360
//get gui dimensions

var gw = display_get_gui_width();
var gh = display_get_gui_height();

if room != rm_menu {
	if room != rm_game_end {
		//Gems
		#region
		draw_set_font(fnt_stats);
		draw_set_halign(fa_left);
		draw_set_valign(fa_middle);
		var _col = make_color_rgb(173, 144, 159);
		draw_set_color(_col);

		//set draw location
		var xx = gw - 92;
		var yy = 2;
		//draw_sprite(s_gem_gui, 0, xx, yy);

		//text
		var text_xx = 7;
		var text_yy = 22;
		draw_set_color(c_black);
		//draw_text(xx + text_xx + 1, yy + text_yy + 1, o_player.gems);
		draw_set_color(_col);
		//draw_text(xx + text_xx, yy + text_yy, o_player.gems);
		#endregion

		//HP bar
		#region
		xx = 48;
		yy = 25;
		//draw_sprite_ext(s_hp_bar, 2, xx, yy, o_player.hp/o_player.max_hp, 1, 0, c_white, image_alpha);
		//draw_sprite(s_hp_bar, 0, xx, yy);
		draw_sprite(s_hp_bar, 2, xx, yy);
		draw_sprite_stretched(s_health, 0, xx + 1, yy - 6, (o_player.hp/o_player.max_hp) * healthbar_width, healthbar_height);
		
		//draw line
		if o_player.hp > 0 {
			draw_sprite_stretched(s_health, 1, xx + (o_player.hp/o_player.max_hp) * healthbar_width + 1, yy - 6, 1, healthbar_height);
			draw_sprite_stretched(s_health, 2, xx + (o_player.hp/o_player.max_hp) * healthbar_width , yy - 6, 1, healthbar_height);
		}
		//draw_sprite(s_health, 1, xx + (o_player.hp/o_player.max_hp) * 79, yy - 5);
		draw_sprite(s_hp_bar, 1, xx, yy);

		#endregion

		//lives
		#region
		xx = 48;
		yy = 32;
		var gap = 22;
		if lives > 0 {
			//draw number of lives
			for (var i = 0; i < lives; i++) {
				//draw_sprite(s_lives, 0, xx + i * gap, yy);
			}
		}
		#endregion
		//score
		#region
	xx = gw / 2;
	yy = 11;
	//draw_sprite(s_score, 0 , xx, yy);
	draw_set_halign(fa_right);
	text_xx = 54;
	text_yy = 14;
	//draw shadow
	draw_set_color(c_black);
	//draw_text(xx + text_xx + 1, yy + text_yy + 1, score);
	//draw text
	draw_set_color(_col);
	//draw_text(xx + text_xx, yy + text_yy, score);
	#endregion
	}
	//game over
	#region
	if game_over_lose or (game_over_won and game_over_won_delay <= 0) {
		//center gui
		if game_over_won {
			var mx = gw/4;
			var my = gh/2;
		} else {
			//game over lose
			var mx = gw/2;
			var my = gh/2;
		}
		//draw game over
		draw_sprite(s_game_over, 0, mx, my);
		if game_over_lose var _index = 0 else var _index = 1;
		draw_sprite(s_game_over_text, _index, mx, my);
		draw_set_halign(fa_right);
		draw_set_color(c_white);
	
		//create array of text to output
		var text;
	
		//line1
		//gems value | gems | gems total
		text[0] = string(o_player.gems_value) + " x";
		text[1] = o_player.gems;
		var _gems_total = o_player.gems * o_player.gems_value;
		text[2] = _gems_total;
	
		//line2
		//lives value | lives | lives total
		text[3] = string(o_player.lives_value) + " x";
		text[4] = lives;
		var _lives_total = lives * o_player.lives_value;
		text[5] = _lives_total;
	
		//line3
		//blank | "Score" | score
		text[6] = "";
		text[7] = "Score";
		text[8] = score;
	
		//line4
		//blank | "Total Score" | total score
		text[9] = "";
		text[10] = "Total Score";
		var _score_total = score + _gems_total + _lives_total;
		text[11] = _score_total;
	
		//update highscore
		if _score_total > highscore {
			highscore = _score_total;
			ini_open(savename);
			ini_write_real("Score", "Highscore", highscore);
			ini_close();
		}
	
		//set starting pos
		var xx = mx - 10;
		var yy = my - 32;
		//set gaps
		var gap_c = 40;
		var gap_r = 30;
		//what line we are on
		var line = 0;
		var rows = 4;
		var columns = 3;
		for (var j = 0; j < rows; j++) {
			for (var i = 0; i < columns; i++) {
				draw_text(xx + i * gap_c, yy, text[i + line * columns]);
			}
			yy += gap_r;
			line++;
			//move down extra for the last line
			if j = 2 yy += gap_r/3;
		}
	}
#endregion
} else {
	//draw main menu and fade to first level
	//draw bounce
	var start_y = 350;		//how far the animation moves
	var factor = start_y;
	
	var max_frames = 60;		//how long animation goes for
	if current_frame < max_frames {
		current_frame++;
		var move = EaseOutBounce(current_frame, 0, 1, max_frames)
	} else {
		move = 1;
		//alow game start as menu has dropped
		if (keyboard_check_pressed(vk_space) or gamepad_button_check_pressed(0, gp_face1)) and
		!instance_exists(o_fade) {
			//move to the next room on the list
			//get string of the next room i.e. "rm_01"
			//var next_room_str = room_get_name(room_next(room));
			//get asset index of next room i.e 1, 2, 3...rooms start at 0
			//var next_room_name = asset_get_index(next_room_str);			
			fade_to_room(room_next(room), 0, 0, 1, c_black);
		}
	}
	draw_sprite(s_main_menu, 0, 0, (move * factor) - start_y);
	
	//draw highscore
	if current_frame == max_frames {
		draw_set_halign(fa_right);
		draw_set_font(fnt_bookman);
		draw_text_ext_colour(gw - 10, 28, highscore, 5, 100, c_aqua, c_aqua, c_gray, c_gray, 1);
	}
}

//fade screen in
if fade_in {
	alpha = lerp(alpha, 0, fade_spd);
	draw_set_alpha(alpha);
	draw_rectangle_colour(0, 0, gw, gh, c_black, c_black, c_black, c_black, false);
	draw_set_alpha(1);
}

//display msg
if alarm[DISPLAY_MSG] > 0 {
	draw_set_halign(fa_center);
	draw_set_font(fnt_bookman);
	draw_set_color(c_black);
	draw_text(gw/2 + 1, gh *.85 + 1, msg);
	draw_set_color(c_white);
	draw_text(gw/2, gh *.85, msg);	
}
