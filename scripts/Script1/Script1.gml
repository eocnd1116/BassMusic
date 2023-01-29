// 카메라 흔들기 //
function cameraShake(_time, _wx, _hy){
	with(instance_create_depth(0, -30, 0, obj_shake)) {
		obj_shake.range = _time
		obj_shake.wx = _wx
		obj_shake.hy = _hy
	}
}