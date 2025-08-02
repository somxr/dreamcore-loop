extends Interactable

@export var dialogue_text: String = "yooooooo get my fish bruh"
@export var dialogue_duration: float = 3.0

func interact(_body):
	if _body.fish_collected < 3:
		_body.show_dialogue(dialogue_text, dialogue_duration)
		
	elif _body.fish_collected >= 3:
		_body.show_dialogue("Thank you for bringing back my fish. I missed them dearly. You may go back to your slumber.", dialogue_duration)
		_body.current_progress = _body.Progress.SLEEPY
