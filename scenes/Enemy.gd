class_name Enemy
extends KinematicBody2D

onready var position_tween: Tween = $PositionTween
onready var rotation_tween: Tween = $RotationTween

func go_to_position(position: Vector2) -> void:
	#TODO: Interpolér og ekstrapolér
	set_position(position)

func rotate_to_degrees(rotation: float) -> void:
	#TODO: Interpolér og ekstrapolér
	set_rotation_degrees(rotation)
