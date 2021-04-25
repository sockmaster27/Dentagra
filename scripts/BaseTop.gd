extends TileMap

const roof_scene := preload("res://scenes/Roof.tscn")

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
	var child_tile_map := roof_scene.instance()
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
		var s: Vector2 = seeds[0] 
		var x: int = int(s.x)
		var y: int = int(s.y)
		separate_roof(x, y)
		seeds = get_used_cells_by_id(0)
