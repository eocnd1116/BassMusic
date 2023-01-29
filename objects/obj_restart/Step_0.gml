if ( instance_place(x, y, obj_player) ) {
	instance_create_depth(camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), -1, obj_fade_in)
	alarm[0] = 20
}