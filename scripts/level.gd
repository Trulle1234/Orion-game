extends Node2D

var scroll_speed = 100

var score_buffer = 0
var score = 0

var junk_part = 0.25
var time_min = 1.0
var time_max = 1.4

var game_over = false

func restart():	
	get_tree().change_scene_to_file("res://scenes/level.tscn")
	
	scroll_speed = 100

	score_buffer = 0
	score = 0

	junk_part = 0.25
	time_min = 1.0
	time_max = 1.4

	game_over = false

func _process(delta: float) -> void:
	if score != score_buffer:
		scroll_speed += 1
		
		junk_part += 0.015
		
		if junk_part >= 0.45:
			junk_part = 0.45
		
		time_min -= 0.03
		time_max -= 0.02
		
		if time_min <= 0.35:
			time_min = 0.35
			
		if time_max <= 0.5:
			time_max = 0.5
			
		#print(
			#"\n" + "score = " + str(score) + "\n" 
			#+ "sroll_speed = " + str(scroll_speed) + "\n"
			#+ "junk_part = " + str(junk_part) + "\n"
			#+ "time min/max = " + str(time_min) + " / " + str(time_max)
		#)
	
	score_buffer = score
