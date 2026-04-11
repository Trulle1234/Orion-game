extends Area2D

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var nom: AudioStreamPlayer2D = $AudioStreamPlayer2D

var rotation_velocity = 0
var move_speed = 0

func _on_body_entered(body: Node2D) -> void:
	if !Level.game_over:
		Level.score += 1
		self.visible = false
		
		var player = body.get_node("AnimatedSprite2D")
		
		player.play("eat")
		
		nom.pitch_scale = randf_range(0.8, 1.2)
		nom.play()
		await nom.finished
		
		player.play("idle")
		
		self.queue_free()
		
func _ready() -> void:	
	rotation = deg_to_rad(randi_range(0, 360))
	rotation_velocity = deg_to_rad(randi_range(40, 140))
	
	move_speed = Level.scroll_speed + randi_range(-50, 50)
	
	var size_moify = randf_range(1, 1.2)
	scale = Vector2(size_moify, size_moify)

func _physics_process(delta: float) -> void:
	position.y += move_speed * delta
	rotation += rotation_velocity * delta
	
	if position.y > get_viewport().get_visible_rect().size.y + 128:
		self.queue_free()
