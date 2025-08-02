extends Interactable

signal dialogue_triggered(text: String, duration: float)

func interact(_body):

	if _body.has_method("show_dialogue"):
		_body.show_dialogue("yooooooo get my fish bruh", 3)
