extends Interactable

signal dialogue_triggered(text: String, duration: float)

func interact(_body):
	
	#print(prompt_action + "ing " + name)
	#var dialogue_label = _body.find_child("DialogueText")
	#dialogue_label.text = "I am the entity"
	#_body.dialogue_balloon.visible = true
	
	# Connect signal if player has the handler
	if _body.has_method("show_dialogue"):
		_body.show_dialogue("yooooooo get my fish bruh", 3)
