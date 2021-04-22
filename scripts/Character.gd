class_name Character
extends KinematicBody2D


var hit_side := "right"


func hit() -> void:
	var animation_player: AnimationPlayer = $AnimationPlayer
	if not animation_player.is_playing():
		animation_player.set_current_animation("hit_" + hit_side)
		hit_side = "left" if hit_side == "right" else "right"
