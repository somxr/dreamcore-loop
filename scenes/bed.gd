extends Interactable

func interact(_body):
	match _body.current_progress:
		_body.Progress.DREAMING:
			_body.show_dialogue("I'm not sleepy at all", 4)
		_body.Progress.SLEEPY:
			_body.show_dialogue("gn", 4)
		
		
