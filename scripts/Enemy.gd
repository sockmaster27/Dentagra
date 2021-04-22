class_name Enemy
extends Character


# Forventet mellemrum mellem nye positionsopdateringer
var expected_delta := 1.0 / Engine.iterations_per_second
var elapsed := 0.0

var pre_pos: Vector2
var new_pos: Vector2

var pre_rot: float
var new_rot: float


func _ready() -> void:
	set_process(false)

func _process(delta: float) -> void:
	elapsed += delta
	
	var weight :=  elapsed / expected_delta
	
	var pos: Vector2 = lerp(pre_pos, new_pos, weight)
	set_position(pos)
	
	var rot: float = lerp_angle(pre_rot, new_rot, weight)
	set_rotation(rot)


func update_transform(position: Vector2, rotation: float):
	elapsed = 0.0
	
	pre_pos = get_position()
	new_pos = position
	
	pre_rot = get_rotation()
	new_rot = rotation
	
	set_process(true)
