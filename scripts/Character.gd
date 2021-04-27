class_name Character
extends KinematicBody2D

signal hit


var hit_side := "right"


func punch() -> void:
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
		if collider.has_method("punched"):
			# Kollisionspunktet skal overshootes lidt, for at undgå afrundingsfejl
			var point := to_local(ray.get_collision_point())
			var overshot_point := point * 1.01 
			collider.punched(to_global(overshot_point))

func punched(_point: Vector2) -> void:
	var sample := (randi() % 6) + 1
	var slap_player: AudioStreamPlayer2D = get_node("Slap/Slap%s" % sample)
	slap_player.set_pitch_scale(rand_range(0.9, 1.1))
	slap_player.play()
