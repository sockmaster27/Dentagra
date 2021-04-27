extends TileMap


signal block_destroyed(x, y)


var wall_shards_scene := preload("res://scenes/WallShards.tscn")


func punched(point: Vector2) -> void:
	var local_point := to_local(point)
	var cell_coords := world_to_map(local_point)
	if get_cellv(cell_coords) == 1:
		destroy(cell_coords)

func destroy(cell: Vector2) -> void:
		set_cellv(cell, -1)
		var wall_shards := wall_shards_scene.instance()
		wall_shards.set_position(map_to_world(cell) + cell_size / 2)
		add_child(wall_shards)
		wall_shards.emitting = true
		
		emit_signal("block_destroyed", cell.x, cell.y)
