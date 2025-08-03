extends Node3D

func _ready() -> void:
	float_object_up()

func float_object_up():
	var tween = create_tween()
	tween.tween_property(self,"position",position + Vector3(0,1,0), 0.5).set_trans(Tween.TRANS_SINE)
	tween.tween_callback(float_object_down)
func float_object_down():
	var tween = create_tween()
	tween.tween_property(self,"position",position + Vector3(0,1,0), 0.5).set_trans(Tween.TRANS_SINE)
	tween.tween_callback(float_object_up)
