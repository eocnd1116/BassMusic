x = mouse_x-0.5
y = mouse_y-0.5


if ( mouse_check_button_pressed(mb_left) ) {
	var inst = instance_create_depth(obj_player.x+10, obj_player.y+10, 0, obj_bullet)
	inst.image_angle = point_direction(obj_player.x+10, obj_player.y+10, mouse_x, mouse_y)
}