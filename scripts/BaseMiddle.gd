extends TileMap


signal block_destroyed(x, y)


func punched(point: Vector2) -> void:
	var local_point := to_local(point)
	var cell_coords := world_to_map(local_point)
	if get_cellv(cell_coords) == 1:
		set_cellv(cell_coords, -1)
		emit_signal("block_destroyed", cell_coords.x, cell_coords.y)
