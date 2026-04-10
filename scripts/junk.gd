extends Area2D

@onready var sprite_2d: Sprite2D = $Sprite2D

var rotation_velocity = 0

func _on_body_entered(body: Node2D) -> void:
	Level.score -= 1
	self.queue_free()

func _ready() -> void:
	sprite_2d.modulate = Color(1.0, 0.0, 0.0, 1.0)
	
	rotation = deg_to_rad(randi_range(0, 360))
	rotation_velocity = deg_to_rad(randi_range(40, 140))
	
	var size_moify = randf_range(1, 1.2)
	scale = Vector2(size_moify, size_moify)

func _physics_process(delta: float) -> void:
	position.y += Level.scroll_speed * delta
	rotation += rotation_velocity * delta
	
	if position.y > get_viewport().get_visible_rect().size.y + 128:
		self.queue_free()
