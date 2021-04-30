class_name Base
extends Node2D


signal damaged(x, y, damage)


onready var base_middle := $BaseMiddle


func _ready() -> void:
	base_middle.connect("damaged", self, "damaged")

func damaged(x: int, y: int, damage: int) -> void:
	emit_signal("damaged", x, y, damage)

func damage_block(x: int, y: int, damage: int) -> void:
	base_middle.damage_block(x, y, damage)
