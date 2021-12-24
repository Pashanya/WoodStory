//bounce off solids
//horizontal check
if tilemap_get_at_pixel(global.map, x + hspeed, y) == SOLID {
	hspeed *= -1;	
}
//vertical check
if tilemap_get_at_pixel(global.map, x, y + vspeed) == SOLID {
	vspeed *= -1;	
}