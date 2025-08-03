extends Interactable

@export var wiggle_amount: float = 0.1  # Radians
@export var wiggle_speed: float = 0.5   # Seconds per direction

func _ready():
	start_wiggle()
		# Find the cat in the scene and connect to its signal
	var cat = get_tree().get_first_node_in_group("cat")
	if cat:
		cat.cat_talked.connect(_on_cat_talked)

func start_wiggle():
	var tween = create_tween().set_loops().set_trans(Tween.TRANS_SINE)
	tween.tween_property(self, "rotation:y", wiggle_amount, wiggle_speed)
	tween.tween_property(self, "rotation:y", -wiggle_amount, wiggle_speed)

func interact(_body):
	
	if _body.has_method("collect_fish"):
		_body.collect_fish()
	# the object deletes itself from the world freeing memory
	queue_free()

func _on_cat_talked():
	enable()
