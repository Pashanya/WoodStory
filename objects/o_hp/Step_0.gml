//movement
calc_entity_movement();

//bounce
if on_ground() and !bounce {
	//give vert movement
	vsp = vsp_initial * random_range(.7, .8);
	bounce = true;
	can_pickup = true;	
}

//bounce off walls
if sign(hsp_initial) var side = bbox_right else var side = bbox_left;
var t1 = tilemap_get_at_pixel(global.map, side + sign(hsp_initial), bbox_bottom);
if t1 == SOLID {
	//wall found, reverse direction
	hsp = hsp_initial * .75 * -1;
}

//destroy gem if falls out of room
if y > room_height instance_destroy();

//generate sparks
if die {
		repeat(o_game.gem_sparks) {
			var inst = instance_create_depth(x, y, depth, o_spark);
			inst.col_head = c_white;
			inst.col_tail = c_maroon;
		}
		instance_destroy();
}
//collision
collision();

//update the lights position
with(o_light) {
	if id = other.light_id {
		x = other.x;
		y = other.y;
	}
}
