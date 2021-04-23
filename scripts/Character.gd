class_name Character
extends KinematicBody2D

signal hit


var hit_side := "right"


func get_class() -> String:
	return "Character"

func is_class(name: String) -> bool:
	return name == get_class()


func hit() -> void:
	emit_signal("hit")
	
	var animation_player: AnimationPlayer = $AnimationPlayer
	animation_player.set_current_animation("hit_" + hit_side)
	hit_side = "left" if hit_side == "right" else "right"
	
	var whoosh_player: AudioStreamPlayer2D = $Whoosh
	whoosh_player.set_pitch_scale(rand_range(0.9, 1.1))
	whoosh_player.set_volume_db(rand_range(-35, -40))
	whoosh_player.play()
	
	var ray: RayCast2D = $RayCast2D
	ray.force_raycast_update()
	if ray.is_colliding():
		var collider := ray.get_collider()
		if collider.is_class("Character"):
			smack()

func smack() -> void:
	var sample := (randi() % 6) + 1
	var slap_player: AudioStreamPlayer2D = get_node("Slap/Slap%s" % sample)
	slap_player.play()
