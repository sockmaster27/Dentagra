extends TileMap

const roof_tile_set: TileSet = preload("res://assets/tilesets/layer2.tres")

func _ready() -> void:
	separate_all_roofs()

func is_roof(x: int, y: int) -> bool:
	var cell := get_cell(x, y)
	return cell != -1

func separete_tile(x: int, y: int, child_tile_map: TileMap) -> void:
	child_tile_map.set_cell(x, y, 0)
	set_cell(x, y, 1)

func seperate_roof(seed_x: int, seed_y: int) -> void:
	var child_tile_map := TileMap.new()
	child_tile_map.tile_set = roof_tile_set
	add_child(child_tile_map)
	
	if not is_roof(seed_x, seed_y):
		return
	
	var s := []
	
	s.push_back([seed_x, seed_x, seed_y - 1, -1])
	s.push_back([seed_x, seed_x, seed_y, 1])
	
	var package: Array 
	var x1: int 
	var x2: int
	var y: int
	var dy: int
	var x: int
	
	while not s.empty():
		package = s.pop_back()
		x1 = package[0]
		x2 = package[1]
		y = package[2]
		dy = package[3]
		x = x1
		breakpoint
		
		if is_roof(x, y):
			while is_roof(x - 1, y):
#				breakpoint
				separete_tile(x - 1, y, child_tile_map)
				x -= 1
		if x < x1:
			s.push_back([x, x1 - 1, y - dy, -dy])
		while x1 < x2:
			while is_roof(x1, y):
				separete_tile(x1, y, child_tile_map)
				x1 += 1
			s.push_back([x, x1 - 1, y + dy, dy])
			if x1 - 1 > x2:
				s.push_back([x2 + 1, x1 - 1, y - dy, -dy])
			while x1 < x2 and not is_roof(x1, y):
				x1 += 1
			x = x1

func separate_all_roofs() -> void:
	var seeds := get_used_cells_by_id(0)
	while not seeds.empty():
		var s: Vector2 = seeds[seeds.size() - 1] 
		var x: int = s.x
		var y: int = s.y
		seperate_roof(x, y)
		seeds = get_used_cells_by_id(0)
		breakpoint
		
