extends Area2D

func _on_body_entered(body: Node2D) -> void:
	Level.score += 1
	self.queue_free()

func _physics_process(delta: float) -> void:
	position.y += Level.scroll_speed * delta
	
	if position.y > get_viewport().get_visible_rect().size.x + 128:
		self.queue_free()
