//Get inputs (1 = pressed, 0 = not pressed)
key_right = keyboard_check(vk_right);
key_left = keyboard_check(vk_left);
key_jump = keyboard_check_pressed(vk_up);
key_dash = keyboard_check_pressed(vk_shift);

if ( key_right )
	sprite_index = spr_player_rigth
if ( key_left )
	sprite_index = spr_player_left
if ( key_jump )
	sprite_index = spr_player_stop


dashDuration = max(dashDuration - 1, 0)
if ( place_meeting(x,y+1,oWall) ) {
	dashNum = 1
	jumpNum = 2
	jumpCoolTime = 0
}

//Workout where to move horizontally
hsp = (key_right - key_left) * hsp_walk;

//Work out where to move vertically
if ( dashDuration > 0 ) vsp = 0
else vsp = vsp + grv;

//Work out if we should jump
if ( (( place_meeting(x,y+1,oWall)) || jumpNum == 1 ) && key_jump && jumpCoolTime==0 )  {
    vsp = vsp_jump; 
	jumpNum--
	jumpCoolTime = 5
}

//Dash!!
if ( key_dash && dashNum != 0 && ( key_right || key_left || ( key_jump && ( key_right || key_left ) ) ) ) {
	if ( key_jump ) {
		if ( key_right ) {
			var inst = instance_create_depth(x-20, y+20, 0, obj_an)
			inst.sprite_index = spr_ef_dash
			inst.image_angle = 45
		}
		else if ( key_left ) {
			var inst = instance_create_depth(x-10, y+30, 0, obj_an)
			inst.sprite_index = spr_ef_dash
			inst.image_angle = 135
		}
	}
	else {
		var inst = instance_create_depth(x, y-10, 0, obj_an)
		inst.sprite_index = spr_ef_dash
	}
	inst.image_xscale = 1.5
	dashNum--
	dashDuration = 10
	hsp = (key_right - key_left) * dashSpd
	vsp = key_jump* -1 * dashSpd
}

//Check for horizontal collisions and then move if we can
var onepixel = sign(hsp) //moving left or right? right = 1, left = -1.
if (place_meeting(x+hsp,y,oWall))
{
    //move as close as we can
    while (!place_meeting(x+onepixel,y,oWall))
    {
        x = x + onepixel;
    }
    hsp = 0;
}
x = x + hsp;

//Check for vertical collisions and then move if we can
var onepixel = sign(vsp) //up = -1, down = 1.
if ( place_meeting(x,y+vsp,oWall) )
{
    //move as close as we can
    while (!place_meeting(x,y+onepixel,oWall))
    {
        y = y + onepixel;
    }
    vsp = 0;
}
y = y + vsp;

if ( jumpCoolTime != 0 )
	jumpCoolTime--