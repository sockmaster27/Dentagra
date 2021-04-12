class_name Enemy
extends KinematicBody2D


onready var position_tween: Tween = $PositionTween
onready var rotation_tween: Tween = $RotationTween

var expected_delta := 1.0 / Engine.iterations_per_second


func go_to_position(new_position: Vector2) -> void:
	# TODO: Ekstrapolér
	position_tween.interpolate_property(
		self, 
		"position", 
		get_position(), 
		new_position,
		expected_delta
	)
	position_tween.start()

func rotate_to_degrees(new_rotation: float) -> void:
	# TODO: Ekstrapolér
	# TODO: Gør så den ikke laver de der vilde 360's (selvom de er ret syge)
	position_tween.interpolate_property(
		self, 
		"rotation_degrees", 
		get_rotation_degrees(), 
		new_rotation,
		expected_delta
	)
	position_tween.start()
