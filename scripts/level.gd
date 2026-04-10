extends Node2D

var scroll_speed = 100

var score = 0
var score_buffer = 0

func _process(delta: float) -> void:
	if score != score_buffer:
		print(score)
	score_buffer = score
