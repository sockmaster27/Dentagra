extends TileMap


signal damaged(x, y, damage)


var wall_shards_scene := preload("res://scenes/WallShards.tscn")
var wood_sounds_scene := preload("res://scenes/WoodSounds.tscn")

var damage_states := {}

const wall_resistance := 5
const door_resistance := 7

const block_types := {"empty": -1, "wall": 1, "door": [2, 4]}
const block_resistances := {1: wall_resistance, 2: door_resistance, 4: door_resistance}


func find_door_origin(coords: Vector2) -> Vector2:
	var block_type := get_cellv(coords)
	
	if not block_type in block_types.door:
		push_error("provided coords are not part of a door")
		
	else:
		while get_cellv(coords - Vector2(1, 0)) in block_types.door:
			coords -= Vector2(1, 0)
		while get_cellv(coords - Vector2(0, 1)) in block_types.door:
			coords -= Vector2(0, 1)
	
	return coords


func punched(point: Vector2) -> void:
	var damage := 1
	
	var local_point := to_local(point)
	var cell_coords := world_to_map(local_point)
	
	var block_type := get_cellv(cell_coords)
	
	if block_type == block_types.wall:
		emit_signal("damaged", int(cell_coords.x), int(cell_coords.y), damage)
		damage_block(int(cell_coords.x), int(cell_coords.y), damage)
	
	elif block_type == block_types.empty:
		for offset in [Vector2(1, 0), Vector2(-1, 0), Vector2(0, 1), Vector2(0, -1)]:
			var neighbor_type := get_cellv(cell_coords + offset)
			if neighbor_type in block_types.door:
				var origin_coords := find_door_origin(cell_coords + offset)
				emit_signal("damaged", int(origin_coords.x), int(origin_coords.y), damage)
				damage_block(int(origin_coords.x), int(origin_coords.y), damage)
				break
	
	elif block_type in block_types.door:
		var origin_coords := find_door_origin(cell_coords)
		emit_signal("damaged", int(origin_coords.x), int(origin_coords.y), damage)
		damage_block(int(origin_coords.x), int(origin_coords.y), damage)


func damage_block(x: int, y: int, damage: int) -> void:
	var cell_coords := Vector2(x, y)
	
	var wood_sounds: WoodSounds = wood_sounds_scene.instance()
	add_child(wood_sounds)
	wood_sounds.play_punch(map_to_world(cell_coords))
	
	if not damage_states.has(cell_coords):
		damage_states[cell_coords] = damage
	else:
		damage_states[cell_coords] += damage
	
	var block_type := get_cellv(cell_coords)
	if damage_states[cell_coords] >= block_resistances[block_type]:
		destroy(cell_coords)

func destroy(cell_coords: Vector2) -> void:
	var effect_pos: Vector2
	
	var block_type := get_cellv(cell_coords)
	if block_type == block_types.wall:
		set_cellv(cell_coords, -1)
		effect_pos = map_to_world(cell_coords) + cell_size / 2
	
	elif block_type in block_types.door:
		var destroyed_blocks := []
		
		var h_coords := cell_coords
		while get_cellv(h_coords) in block_types.door:
			var v_coords := h_coords
			while get_cellv(v_coords) in block_types.door:
				set_cellv(v_coords, -1)
				destroyed_blocks.append(v_coords)
				v_coords += Vector2(0, 1)
			h_coords += Vector2(1, 0)
		
		var pos_sum := Vector2.ZERO
		for pos in destroyed_blocks:
			pos_sum += map_to_world(pos)
		effect_pos = pos_sum / destroyed_blocks.size()
	
	var wood_sounds: WoodSounds = wood_sounds_scene.instance()
	add_child(wood_sounds)
	wood_sounds.play_break(effect_pos)
	
	var wall_shards := wall_shards_scene.instance()
	wall_shards.set_position(effect_pos)
	add_child(wall_shards)
