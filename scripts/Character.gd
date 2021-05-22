class_name Character
extends KinematicBody2D

signal hit
signal orb_collected

var hit_side := "right"
var has_orb := false


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
	var slaps := $Slap.get_children()
	var slap_player: AudioStreamPlayer2D = slaps[randi() % slaps.size()]
	slap_player.set_pitch_scale(rand_range(0.9, 1.1))
	slap_player.play()


func orb_collected() -> void:
	emit_signal("orb_collected")
	$Sprite/Orb.visible = true
	has_orb = true

func pop_orb() -> void:
	if has_orb:
#		has_orb = false
		$Sprite/Orb.visible = false
		$Sprite/OrbParticles.set_emitting(true)
