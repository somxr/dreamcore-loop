extends Interactable

func interact(_body):
	match _body.current_progress:
		_body.Progress.DREAMING:
			_body.show_dialogue("I'm not sleepy at all", 4)
		_body.Progress.SLEEPY:
			_body.show_dialogue("gn", 4)
			get_tree().reload_current_scene()
		_body.Progress.WIN:
			# transition to win screen
			get_tree().change_scene_to_file("res://scenes/win_screen.tscn")
		
