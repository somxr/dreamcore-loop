extends Interactable

@export var wiggle_amount: float = 0.1  # Radians
@export var wiggle_speed: float = 0.5   # Seconds per direction

func _ready():
	start_wiggle()

func start_wiggle():
	var tween = create_tween().set_loops().set_trans(Tween.TRANS_SINE)
	tween.tween_property(self, "rotation:y", wiggle_amount, wiggle_speed)
	tween.tween_property(self, "rotation:y", -wiggle_amount, wiggle_speed)

func interact(_body):
	
	if _body.has_method("collect_fish"):
		_body.collect_fish()

	# the object deletes itself from the world freeing memory
	queue_free()
