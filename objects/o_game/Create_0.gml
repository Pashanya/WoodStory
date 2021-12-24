//macros
macros();

global.grav = 0.25;

//set gui size
display_set_gui_size(720, 360);

//how many sparks come off gems
gem_sparks = 6;
//how many sparks come off dead enemies
enemy_sparks = 6;

//game over
//game over and we lost
game_over_lose = false;

//game over and we won
game_over_won = false;

//score delay
game_over_won_delay = room_speed * 3;

//health 
healthbar_width = 79; 
healthbar_height = 10;


//main menu
current_frame = 0;
   
//fade in menu
fade_in = true;
alpha = 1;
fade_spd = 0.02;

//highscore
savename = "game.sav";
highscore = 0;

//open savefile
ini_open(savename);
//read an old highscore, or set it to 0 if none
highscore = ini_read_real("Score", "Highscore", 0);
ini_close();

//final room
msg = "";

//tooltip messages
//msg#, properties
//0 - pre msg
//1 - post msg
//2 - keyboard button
//3 - pad button
//4 - time on screen
//5 - has it been shown this game?

//create grid
global.tooltip = ds_grid_create(5, 6);

//attack
global.tooltip[# 0, 0] = "Press";
global.tooltip[# 0, 1] = "to Attack";
global.tooltip[# 0, 2] = "Shift";
global.tooltip[# 0, 3] = "B";
global.tooltip[# 0, 4] = 3;
global.tooltip[# 0, 5] = 0;

//block
global.tooltip[# 1, 0] = "Press";
global.tooltip[# 1, 1] = "to Block";
global.tooltip[# 1, 2] = "Z";
global.tooltip[# 1, 3] = "Shoulder Buttons";
global.tooltip[# 1, 4] = 3;
global.tooltip[# 1, 5] = 0;

//Jump
global.tooltip[# 2, 0] = "Press";
global.tooltip[# 2, 1] = "to Jump";
global.tooltip[# 2, 2] = "Space";
global.tooltip[# 2, 3] = "A";
global.tooltip[# 2, 4] = 3;
global.tooltip[# 2, 5] = 0;

//Double Jump
global.tooltip[# 3, 0] = "Press";
global.tooltip[# 3, 1] = "again to Double Jump";
global.tooltip[# 3, 2] = "Space";
global.tooltip[# 3, 3] = "A";
global.tooltip[# 3, 4] = 3;
global.tooltip[# 3, 5] = 0;

//Duck
global.tooltip[# 4, 0] = "Press";
global.tooltip[# 4, 1] = "to Duck";
global.tooltip[# 4, 2] = "Down";
global.tooltip[# 4, 3] = "Down";
global.tooltip[# 4, 4] = 3;
global.tooltip[# 4, 5] = 0;
