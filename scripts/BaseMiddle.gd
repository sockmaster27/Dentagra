extends TileMap


signal damaged(x, y, damage)


var wall_shards_scene := preload("res://scenes/WallShards.tscn")
var wood_sounds_scene := preload("res://scenes/WoodSounds.tscn")

var damage_states := {}

const wall_resistance := 5


func punched(point: Vector2) -> void:
	var local_point := to_local(point)
	var cell_coords := world_to_map(local_point)
	if get_cellv(cell_coords) == 1:
		var damage := 1
		emit_signal("damaged", int(cell_coords.x), int(cell_coords.y), damage)
		damage_block(int(cell_coords.x), int(cell_coords.y), damage)


func damage_block(x: int, y: int, damage: int) -> void:
	var cell_coords := Vector2(x, y)
	
	var wood_sounds: WoodSounds = wood_sounds_scene.instance()
	add_child(wood_sounds)
	wood_sounds.play_punch(map_to_world(cell_coords))
	
	if not damage_states.has(cell_coords):
		damage_states[cell_coords] = damage
	elif damage_states[cell_coords] >= wall_resistance - damage:
		destroy(cell_coords)
	else:
		damage_states[cell_coords] += 1

func destroy(cell_coords: Vector2) -> void:
	var wood_sounds: WoodSounds = wood_sounds_scene.instance()
	add_child(wood_sounds)
	wood_sounds.play_break(map_to_world(cell_coords))
	
	set_cellv(cell_coords, -1)
	var wall_shards := wall_shards_scene.instance()
	wall_shards.set_position(map_to_world(cell_coords) + cell_size / 2)
	add_child(wall_shards)
