function rocky_idle_state() {
	//check health
	check_enemy_hp();

	//get inputs
	breathing();

	//calculate movement
	calc_entity_movement();

	//modify state
	//attack
	var detect_player_dis = 40;
	var player_alert = false;	//player in front and within range, but attack is not rdy
	//player is with detected distance and we are facing the player and we can attack
	if (distance_to_object(o_player) < detect_player_dis) and sign(o_player.x - x) = facing {
		if o_player.hp > 0 {
			if can_attack {
				//attack
				can_attack = false;
				state = rocky_states.ATTACK;
				image_index = 0;
				image_speed = 1;
			}
			player_alert = true;
		}
	}

	if (jump_timer < 0) and !player_alert {
		//reset timer
		jump_timer = jump_timer_initial;
		//do we jump?
		var _jump = random(1);
		if _jump > jump_chance {
			state = rocky_states.JUMP_START;
			//reset breath values
			image_index = 0;
			image_speed = 1;
			max_hsp = max_hsp_initial;
			var turned = false;
			//look for solid one tile ahead
			var t1 = tilemap_get_at_pixel(global.map, x + sign(facing) * global.tile_size, bbox_bottom);
			if t1 == SOLID {
				facing *= -1;
				turned = true;
			}
			//look for void one tile ahead
			var t1 = tilemap_get_at_pixel(global.map, x + sign(facing) * global.tile_size, bbox_bottom + 1);
			if t1 == VOID {
				if !turned facing *= -1;
			}		
			//look for voids multiple tiles ahead
			for (var i = 3; i > 0; i--) {
				t1 = tilemap_get_at_pixel(global.map, x + sign(facing) * global.tile_size * i, bbox_bottom + 1);
				if t1 == VOID {
					//find furthest solid jump point
					var tile_start_x =	(x + sign(facing) * global.tile_size * i) -
										(x + sign(facing) * global.tile_size * i) mod global.tile_size;
					//half of mask
					var half_mask = (bbox_right + 1 - bbox_left)/2;
					if facing {
						var target = tile_start_x - half_mask;	
					} else {
						var target = tile_start_x + half_mask + global.tile_size;
					}
					//adjust max_hsp to land at target
					//speed = distance/time
					//how long is frog in air = 48
					var steps_in_air = 48;
					max_hsp = abs(target - x)/steps_in_air;
				}
			
			}		
		}
	} else {
		jump_timer--;	
	}

	//apply movement
	collision();

	//animations
	rocky_anim();


}
