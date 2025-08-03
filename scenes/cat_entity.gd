extends Interactable

var dialogue_text: String = "yooooooo get my fish bruh"
var dialogue_duration: float = 3.0

@export var dialogue_texts: Array[String] = ["", "", "", "", ""]  # 5 empty strings
@export var dialogue_durations: Array[float] = [3.0, 3.0, 3.0, 3.0, 3.0]  # 5 default durations
var current_line: int = 0

var is_angry := false
@export var angry_dialogue = "I have nothing to say to you. Leave."
@export var angry_dialogue_accept_fish = "I'll accept my fish, but I wish to see you no longer. Leave."

@onready var audio_player: AudioStreamPlayer3D = $AudioStreamPlayer3D

var sounds = {
	"yap": preload("res://assets/audio/cat yapping.wav"),
	"meow": preload("res://assets/audio/cat meow.wav"),
	"angry": preload("res://assets/audio/angry cat dialogue.wav")
}

var sound_index = 0
func play_sound(sound_name: String):
	if sound_name in sounds:
		audio_player.stream = sounds[sound_name]
		audio_player.play()


func interact(_body):
	var alternating_sounds = ["yap", "meow"]
	play_sound(alternating_sounds[sound_index])
	sound_index = (sound_index + 1) % 2  # Loops between 0 and 1
	
	if not is_angry: 
		
		if _body.fish_collected == 0:
			_body.fish_count_texture.visible = true
			
		if _body.fish_collected < 3: 
			var text: String = dialogue_texts[current_line]
			var duration = dialogue_durations[current_line] if current_line < dialogue_durations.size() else 3.0
			_body.show_dialogue(text, duration)
			
			#only go to next line if the current_line counter hasn't reached the 
			# end of the dialogue texts array 
			if current_line < dialogue_texts.size()-1:
				current_line += 1
			
			if current_line >= dialogue_texts.size()-1:
				is_angry = true
			
		elif _body.fish_collected >= 3:
			_body.show_dialogue("Thank you for bringing back my fish. I missed them dearly. You may go back to your slumber.", dialogue_duration)
			_body.fish_count_texture.visible = false
			_body.current_progress = _body.Progress.SLEEPY
	else:
		_body.current_progress = _body.Progress.WIN
		_body.fish_count_texture.visible = false
		if _body.fish_collected < 3:
			_body.show_dialogue(angry_dialogue, dialogue_duration)
		elif _body.fish_collected >= 3:
			_body.show_dialogue(angry_dialogue_accept_fish, dialogue_duration)
			
