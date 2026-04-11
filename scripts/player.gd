extends CharacterBody2D

const MAX_SPEED = 300.0
const ACCEL = 500.0
const FRICTION = 40.0
const BOUNCE_FACTOR = 0.9

const MAX_TURN_SPEED = 3.0
const TURN_ACCEL = 10.0
const TURN_DECEL = 8.0

const FORWARD_OFFSET = deg_to_rad(-90)
const BOUNCE_ROT_SMOOTH = 8.0

var move_input = 0.0
var turn_input = 0.0

var turn_velocity = 0.0
var target_rotation = 0.0

func _ready() -> void:
	target_rotation = rotation

func _physics_process(delta: float) -> void:
	player_movement(delta)
	
func get_input() -> void:
	move_input = Input.get_action_strength("up")
	turn_input = Input.get_axis("right", "left")

func player_movement(delta: float) -> void:
	if !Level.game_over:
		get_input()

	var target_turn_velocity = turn_input * MAX_TURN_SPEED
	var turn_step = TURN_ACCEL if turn_input != 0.0 else TURN_DECEL
	turn_velocity = move_toward(turn_velocity, target_turn_velocity, turn_step * delta)

	if turn_input != 0.0:
		target_rotation += turn_velocity * delta

	rotation = lerp_angle(rotation, target_rotation, BOUNCE_ROT_SMOOTH * delta)

	var forward = Vector2.RIGHT.rotated(rotation + FORWARD_OFFSET)

	if move_input > 0.0:
		velocity += forward * move_input * ACCEL * delta
		velocity = velocity.limit_length(MAX_SPEED)
	else:
		if velocity.length() > FRICTION * delta:
			velocity -= velocity.normalized() * FRICTION * delta
		else:
			velocity = Vector2.ZERO

	var collision = move_and_collide(velocity * delta)

	if collision:
		velocity = velocity.bounce(collision.get_normal()) * BOUNCE_FACTOR

		if velocity.length() > 0.001:
			target_rotation = velocity.angle() - FORWARD_OFFSET
