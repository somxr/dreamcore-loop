extends PathFollow3D

@export var speed: float = 2.0
@export var loop_enabled: bool = true

func _ready():
	# Enable looping
	loop = loop_enabled

func _process(delta):
	# Move along the path
	progress += speed * delta
