extends Node2D

var scroll_speed = 100

var score = 0
var junk_part = 0.3

var game_over = false

func restart():	
	get_tree().change_scene_to_file("res://scenes/level.tscn")
	
	scroll_speed = 100

	score = 0
	junk_part = 0.2

	game_over = false
