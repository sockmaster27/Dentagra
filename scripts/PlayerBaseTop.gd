extends TileMap

const roof_tile_set: TileSet = preload("res://assets/tilesets/layer2.tres")

func _ready() -> void:
	separate_all_roofs()

func is_roof(x: int, y: int) -> bool:
	var cell := get_cell(x, y)
	return cell == 0

func separate_tile(x: int, y: int, child_tile_map: TileMap) -> void:
	child_tile_map.set_cell(x, y, 0)
	set_cell(x, y, 1)

func scan(lx: int, rx: int, y: int, s: Array) -> void:
	var added := false
	for x in range(lx, rx + 1):
		if not is_roof(x, y):
			added = false
		elif not added:
			s.push_back([x, y])
			added = true

func separate_roof(seed_x: int, seed_y: int) -> void:
	var child_tile_map := TileMap.new()
	child_tile_map.tile_set = roof_tile_set
	add_child(child_tile_map)
	
	if not is_roof(seed_x, seed_y):
		return
	
	var s := []
	
	s.push_back([seed_x, seed_y])
	
	while not s.empty():
		var package: Array = s.pop_back()
		var x: int = package[0]
		var y: int = package[1]
		var lx := x
		while is_roof(lx - 1, y):
			separate_tile(lx - 1, y, child_tile_map)
			lx -= 1
		while is_roof(x, y):
			separate_tile(x, y, child_tile_map)
			x += 1
		scan(lx, x - 1, y + 1, s)
		scan(lx, x - 1, y - 1, s)
		

func separate_all_roofs() -> void:
	var seeds := get_used_cells_by_id(0)
	while not seeds.empty():
		var s: Vector2 = seeds[seeds.size() - 1] 
		var x: int = s.x
		var y: int = s.y
		separate_roof(x, y)
		seeds = get_used_cells_by_id(0)
