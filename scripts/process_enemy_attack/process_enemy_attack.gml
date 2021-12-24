/// @desc process_enemy_attack(hurt_knockback, block_knockback);
/// @arg hurt_knockback_def_-1
/// @arg block_knockback_def_-1
function process_enemy_attack(argument0, argument1) {

	var hk = argument0;
	var bk = argument1;

	//set some default values
	if hk = -1 hk = 4;
	if bk = -1 bk = 2.5;


	if o_player.hp > 0 and !hurt {
		if !block or (block and sign(x - other.x) == facing) {
			hurt = true;
			
			//face the enemy
			facing = sign(other.x - x);
		
			//ensure facing can never be 0
			if facing == 0 facing = 1;
		
			//ensure enemy faces player
			other.facing = -facing;
				
			//move player away
			var knockback_dis = hk;
			hsp = -facing * knockback_dis;
			
			//damage player
			hp -= 1;
			
			//set hurt timer
			alarm[HURT] = hurt_time;
		
			//change state
			state = states.HURTING;
			image_index = 0;
		
			//screen_shake
			scr_screen_shake(0.125, -1);
		
			//sound
			audio_play_sound(snd_player_hit, 40, false);
		
		} else {
			//blocking damage	
			if state != states.KNOCKBACK {
				state = states.KNOCKBACK;
				image_index = 0;
				image_speed = 1;
				
				//zero hsp_decimal as precision is more important here
				hsp_decimal = 0;
				
				//move player away from the attack
				var knockback_dis = bk;
				hsp = sign(x - other.x) * knockback_dis;
			
				//screen_shake
				scr_screen_shake(.125, -1);
			
				//sound
				audio_play_sound(snd_block, 40, false);
			
				//enemy gets knocked back too
				with(other) {
					if object_index = o_bug {
						//zero decimal to get exact movement
						hsp_decimal = 0;
						//knock the enemy away from the player
						hsp = sign(x - o_player.x) * other.knockback_dis;
						alarm[KNOCKEDBACK] = other.knockback_time;
					}
				}
			}
		}
	}


}
