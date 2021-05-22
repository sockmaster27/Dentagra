class_name Player
extends Character

export var speed: = 300
var has_orb := false

func is_class(name: String) -> bool:
	return name == "Player"

func _process(_delta: float) -> void:
	var velocity := get_movement()
	look_at(get_global_mouse_position())
	move_and_slide(velocity)
	
	if Input.is_action_pressed("hit"):
		if not $AnimationPlayer.is_playing():
			punch()


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


func orb_collected() -> void:
	$Sprite/Orb.visible = true
	has_orb = true

