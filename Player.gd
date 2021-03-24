extends KinematicBody2D

export var speed: = 300

func get_movement() -> Vector2:
	var velocity := Vector2()
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
	if Input.is_action_pressed('move_down'):
		velocity.y += 1
	if Input.is_action_pressed('move_left'):
		velocity.x -= 1
	if Input.is_action_pressed('move_right'):
		velocity.x += 1
	velocity = velocity.normalized() * speed
	return velocity

func _physics_process(delta: float) -> void:
	var velocity = get_movement()
	look_at(get_global_mouse_position())
	move_and_slide(velocity)
