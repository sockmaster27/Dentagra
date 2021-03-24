extends KinematicBody2D

export var speed: = 300
var velocity = Vector2()

func calculate_direction():
	velocity = Vector2()
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
	if Input.is_action_pressed('move_down'):
		velocity.y += 1
	if Input.is_action_pressed('move_left'):
		velocity.x -= 1
	if Input.is_action_pressed('move_right'):
		velocity.x += 1
	velocity = velocity.normalized() * speed

func _physics_process(delta: float) -> void:
	calculate_direction()
	velocity = move_and_slide(velocity)
