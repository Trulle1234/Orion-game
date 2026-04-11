extends Node2D

var timer = 0.0

var point_1 = Vector2(10, -32)
@onready var point_2 = Vector2(get_viewport().get_visible_rect().size.x - 10, -32)

@onready var food = preload("res://scenes/food.tscn")
@onready var junk = preload("uid://sllwqvvrtoee")

var instance: Node = null

func get_random_point(p1, p2):
	var x_value = randf_range(p1.x, p2.x)
	var y_value = randf_range(p1.y, p2.y)
	
	var random_point = Vector2(x_value, y_value)
	return random_point
	
func spawn():
	if randf() < Level.junk_part:
		instance = junk.instantiate()
		add_child(instance)
	else: 
		instance = food.instantiate()
		add_child(instance)
	
	var spawn_pos = get_random_point(point_1, point_2)
	instance.set_position(spawn_pos)
func schedule_next():
	timer = randf_range(1, 1.4)

func _ready() -> void:
	randomize()
	schedule_next()

func _process(delta: float) -> void:
	timer -= delta
	
	if timer <= 0.0 and !Level.game_over:
		spawn()
		schedule_next()
