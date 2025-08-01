extends CollisionObject3D
class_name Interactable

@export var prompt_action = "Interact"

func interact(_body):
	print(prompt_action + "ing " + name)
