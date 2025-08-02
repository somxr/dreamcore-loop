extends Interactable

func interact(_body):
	
	if _body.has_method("collect_fish"):
		_body.collect_fish()

	# the object deletes itself from the world freeing memory
	queue_free()
