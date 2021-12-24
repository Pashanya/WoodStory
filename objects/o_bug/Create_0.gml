event_inherited();
//movement
hsp = 0;
max_hsp_initial = .5;
max_hsp = max_hsp_initial;
vsp = 0;
spd = .5;
hsp_decimal = 0;
vsp_decimal = 0;
facing = choose(-1, 1);
drag = 0.04;
hp = 6;
death_gem_value = 5;
knockbackable = true;

//patrol
//how far the bug moves in one direction
patrol_dis = 96;
//patrol start position
start_x = x;
start_y = y;
//how long to wait before patrolling
wait_time_initial = random_range(room_speed * 2, room_speed * 4);
wait_time = wait_time_initial;

//chase
//target to move to
target_x = 0;
target_y = 0;
chase_spd = 1;
//minimum distance to start chasing
chase_distance = 100;

//hurt
hurt_time = room_speed / 2;

//states
enum bug_states {
	IDLE,
	PATROL,
	CHASE
}

state = bug_states.IDLE;

states_array[bug_states.IDLE]			= bug_idle_state;
states_array[bug_states.PATROL]			= bug_patrol_state;
states_array[bug_states.CHASE]			= bug_chase_state;

sprites_array[bug_states.IDLE]			= s_bug_idle;
sprites_array[bug_states.PATROL]		= s_bug_idle;
sprites_array[bug_states.CHASE]			= s_bug_chase;