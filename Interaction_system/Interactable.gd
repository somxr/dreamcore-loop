extends CollisionObject3D
class_name Interactable

@export var prompt_action = "Interact"
@export var enabled: bool = true

func interact(_body):
	pass

func set_enabled(value: bool):
	enabled = value

func disable():
	enabled = false

func enable():
	enabled = true
