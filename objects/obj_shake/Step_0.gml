range -= 0.1
if ( range == 0 ) {
	instance_destroy()
}
camera_set_view_pos(view_camera[0], view_x+(wx==1?random_range(-range, range):0), view_y+(hy==1?random_range(-range, range):0))