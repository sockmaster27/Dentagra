class_name Roof
extends TileMap

func fade_out() -> void:
	var alpha := 0
	fade(alpha)

func fade_in() -> void:
	var alpha := 1
	fade(alpha)

func fade(alpha: int) -> void:
	var duration := 0.2
	var tween: Tween = $Tween
	tween.stop_all()
	tween.interpolate_property(
		self, 
		"modulate", 
		get_modulate(), 
		Color(1, 1, 1, alpha), 
		duration,
		Tween.TRANS_CUBIC,
		Tween.EASE_IN_OUT
	)
	tween.start()
