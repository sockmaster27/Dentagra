class_name FlagZone
extends Node2D

signal player_wins


func _ready() -> void:
	$Area2D.connect("body_entered", self, "entered")

func entered(body: Node) -> void:
	if body.is_class("Player") and body.has_orb:
		emit_signal("player_wins")

func disable() -> void:
	$Area2D.set_deferred("monitoring", false)
