extends PlayerBaseTop

func _ready() -> void:
	pass



func is_roof(x: int, y: int) -> bool:
	return get_cell(x, y) != null

func separete_tile(x: int, y: int, child_tilemap: TileMap) -> void:
	child_tilemap.set_cell(x, y, 0)
	set_cell(x, y, 1)

func seperate_roof(seed_x: int, seed_y: int) -> void:
	var child_tilemap := TileMap.new()

func separate_all_roofs() -> void:
	pass
