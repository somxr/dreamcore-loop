extends Interactable

func interact(_body):
	
	if _body.has_method("collect_fish"):
		_body.collect_fish()
	else:
		print("function collect fish not found")
	queue_free()
