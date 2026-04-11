extends Node2D

@onready var final_score: Label = $FinalScore
@onready var restart: Button = $Restart

func _ready() -> void:
	self.visible = false

func _process(delta: float) -> void:
	if Level.game_over:
		self.visible = true
		final_score.text = "Your final score was: " + str(Level.score)
		
		if Level.scroll_speed > 0:
			Level.scroll_speed -= 20 * delta
		else:
			Level.scroll_speed = 0

func _on_restart_pressed() -> void:
	Level.restart()
