event_inherited();
//movement
hsp = 0;
max_hsp_initial = 2;
max_hsp = max_hsp_initial;
vsp = 0;
spd = 2;
jump_spd = -6;
hsp_decimal = 0;
vsp_decimal = 0;
facing = choose(-1, 1);
knockbackable = false;

//actions
can_attack = true;
attack_delay = room_speed;

//inhale
attack = false;
inhale = false;
inhale_timer = room_speed *.3;

//breathing
breath_timer_initial = random_range(room_speed * 1.75, room_speed * 2.25);
breath_timer = breath_timer_initial;
image_speed = 0;

//jump
//will he jump this chance
jump_chance = 0.5;
//hoe often to check for a jump chance
jump_timer_initial = random_range(room_speed, room_speed * 1.5);
jump_timer = jump_timer_initial;

//states
enum rocky_states {
	IDLE,
	JUMP_START,
	JUMP,
	JUMP_LAND,
	ATTACK
}

state = rocky_states.IDLE;

states_array[rocky_states.IDLE]			= rocky_idle_state;
states_array[rocky_states.JUMP_START]	= rocky_jump_start_state;
states_array[rocky_states.JUMP]			= rocky_jump_state;
states_array[rocky_states.JUMP_LAND]	= rocky_jump_land_state;
states_array[rocky_states.ATTACK]		= rocky_attack_state;

sprites_array[rocky_states.IDLE]		= s_rocky_idle;
sprites_array[rocky_states.JUMP_START]	= s_rocky_jump_start;
sprites_array[rocky_states.JUMP]		= s_rocky_jump;
sprites_array[rocky_states.JUMP_LAND]	= s_rocky_jump_land;
sprites_array[rocky_states.ATTACK]		= s_rocky_attack;