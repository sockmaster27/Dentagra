class_name EnemyOrb
extends Sprite

signal picked_up

func _ready() -> void:
	$Area2D.connect("body_entered", self, "touched")

func touched(body: Node) -> void:
	if body.is_class("Player"):
		visible = false
		emit_signal("picked_up")
		$CollectedSfx.play()

