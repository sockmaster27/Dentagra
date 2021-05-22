extends Node2D


func _ready() -> void:
	$Area2D.connect("body_entered", self, "won")

func won(body: Node) -> void:

	if body.is_class("Player") and body.has_orb:
		print("won")
