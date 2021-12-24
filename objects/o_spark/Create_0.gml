//init variables
line_width = 2;
direction = random(360);
speed = random_range(2, 15);

//how fast the particles changes direction
dir_change = random_range(-20, 20);
dir_change_decay = 0.93;
//how fast the particle will slow down
speed_decay = random_range(0.87, 0.98);

//colour
col_head = 0;
col_tail = 0;

//XPrevious
xp = x;
yp = y;

//XPreviousPrevious
xpp = xprevious;
ypp = yprevious;

//lighting
intensity = 20;