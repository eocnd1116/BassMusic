if ( image_xscale != 1 ) 
	image_xscale += 0.2

x += lengthdir_x(10, image_angle);
y += lengthdir_y(10, image_angle);

if ( instance_place(x, y, oWall) ) {
	alarm[0] = 1
}