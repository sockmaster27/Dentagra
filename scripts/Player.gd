class_name Player
extends KinematicBody2D

export var speed: = 300
var hit_side := "right"


func _process(_delta: float) -> void:
	var velocity := get_movement()
	look_at(get_global_mouse_position())
	move_and_slide(velocity)
	
	if Input.is_action_pressed("hit"):
		animate_hit()


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


func animate_hit() -> void:
	var animation_player: AnimationPlayer = $AnimationPlayer
	if not animation_player.is_playing():
		animation_player.set_current_animation("hit_" + hit_side)
		hit_side = "left" if hit_side == "right" else "right"

func hit() -> void:
	pass
