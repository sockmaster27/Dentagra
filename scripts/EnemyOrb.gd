class_name EnemyOrb
extends Orb

signal picked_up

func _ready() -> void:
	$Area2D.connect("body_entered", self, "touched")

func touched(body: Node) -> void:
	if body.is_class("Player"):
		emit_signal("picked_up")
		collect()
