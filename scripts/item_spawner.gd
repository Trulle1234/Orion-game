extends Node2D

var food_spawn_rate = 0.5

var point_1 = Vector2(0, -64)
@onready var point_2 = Vector2(get_viewport().get_visible_rect().size.x, 0)

@onready var food = preload("res://scenes/food.tscn")

func get_random_point(p1, p2):
	var x_value = randf_range(p1.x, p2.x)
	var y_value = randf_range(p1.y, p2.y)
	
	var random_point = Vector2(x_value, y_value)
	return random_point
	
func spawn():
	var food_instance: Node = food.instantiate()
	add_child(food_instance)
	
	var spawn_pos = get_random_point(point_1, point_2)
	food_instance.set_position(spawn_pos)

func _ready() -> void:
	randomize()

func _process(delta: float) -> void:
	if randf() < min(food_spawn_rate * delta, 1.0):
		spawn()
