extends Interactable
@onready var tween: Tween

var is_open := false
var open_rotation := 100.0
var close_rotation := 0.0
var rotation_speed := 150.0  # degrees per second

func interact(_body):
	# Kill any existing tween
	if tween:
		tween.kill()
	
	# Calculate target and duration based on current position
	var target_rotation = open_rotation if not is_open else close_rotation
	var rotation_distance = abs(target_rotation - rotation_degrees.y)
	var duration = rotation_distance / rotation_speed
	
	# Create new tween
	tween = create_tween()
	tween.tween_property(self, "rotation_degrees:y", target_rotation, duration)
	
	# Toggle state
	is_open = not is_open
