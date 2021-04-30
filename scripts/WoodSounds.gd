class_name WoodSounds
extends Node2D

func play_punch(position: Vector2) -> void:
	set_position(position)
	var punches := $Punch.get_children()
	var punch_player: AudioStreamPlayer2D = punches[randi() % punches.size()]
	punch_player.set_pitch_scale(rand_range(0.9, 1.1))
	punch_player.connect("finished", self, "queue_free")
	punch_player.play()

func play_break(position: Vector2) -> void:
	set_position(position)
	var breaks := $Break.get_children()
	var break_player: AudioStreamPlayer2D = breaks[randi() % breaks.size()]
	break_player.play()
