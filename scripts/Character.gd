class_name Character
extends KinematicBody2D


var hit_side := "right"


func hit() -> void:
	var animation_player: AnimationPlayer = $AnimationPlayer
	var audio_player: AudioStreamPlayer2D = $AudioStreamPlayer2D
	
	if not animation_player.is_playing():
		
		animation_player.set_current_animation("hit_" + hit_side)
		hit_side = "left" if hit_side == "right" else "right"
		
		audio_player.set_pitch_scale(rand_range(0.9, 1.1))
		audio_player.set_volume_db(rand_range(-35, -40))
		audio_player.play()
