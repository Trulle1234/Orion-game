extends AudioStreamPlayer2D


func _ready() -> void:
	randomize()
	self.finished.connect(_on_music_finished)
	play_random_music()

func play_random_music() -> void:
	var path = "res://assets/rossini.mp3"
	var stream = load(path) as AudioStream

	self.stream = stream

	self.play()

func _on_music_finished() -> void:
	play_random_music()
