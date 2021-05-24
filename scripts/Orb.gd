class_name Orb
extends Sprite

func collect() -> void:
	visible = false
	$CollectedSfx.play()
	$Collider.queue_free()
