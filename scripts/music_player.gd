extends AudioStreamPlayer2D

const MUSIC = [
	"res://assets/rossini.mp3",
	"res://assets/vivaldi.mp3"
]

func _ready() -> void:
	randomize()

	if not finished.is_connected(_on_music_finished):
		finished.connect(_on_music_finished)

	play_random_music()

func play_random_music() -> void:
	if playing:
		stop()

	var path = MUSIC[randi() % MUSIC.size()]
	stream = load(path) as AudioStream

	var length := stream.get_length()
	var max_start = max(length - 30.0, 0.0)
	var start_pos = randf_range(0.0, max_start)

	play(start_pos)

func _on_music_finished() -> void:
	play_random_music()
