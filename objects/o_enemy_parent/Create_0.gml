hurt = false;
hurt_time = room_speed / 4;
hp = 99;
flash_counter = 0;

//slowdown
drag = 0.12;

//how many gems to drop on death
death_gem_value = 3;

//hp
hp_drop_chance = 0.3;

//puff of smoke on spawn
if room == rm_02 {
	alarm[SPAWN] = 1;	
}