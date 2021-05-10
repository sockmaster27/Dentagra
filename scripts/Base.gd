class_name Base
extends Node2D


signal damaged(x, y, damage)


var width := 63
var height := 111

onready var base_ground := $BaseGround
onready var base_middle := $BaseMiddle
onready var base_top := $BaseTop


func _ready() -> void:
	save_data()
	base_middle.connect("damaged", self, "damaged")

func damaged(x: int, y: int, damage: int) -> void:
	emit_signal("damaged", x, y, damage)

func damage_block(x: int, y: int, damage: int) -> void:
	base_middle.damage_block(x, y, damage)


enum Direction {RIGHT, LEFT, UP, DOWN}

func get_cell_direction(x: int, y: int, tilemap: TileMap) -> int:
	var transposed := tilemap.is_cell_transposed(x, y)
	var x_flipped := tilemap.is_cell_x_flipped(x, y)
	
	var result: int
	if !transposed and !x_flipped:
		result = Direction.DOWN
	elif transposed and !x_flipped:
		result = Direction.RIGHT
	elif !transposed and x_flipped:
		result = Direction.UP
	elif transposed and x_flipped:
		result = Direction.LEFT
	return result

func get_layer_data(layer: TileMap) -> PoolIntArray:
	var data: PoolIntArray = []
	var consecutive_cells := 0
	var previous_cell := -1
	var previous_direction = Direction.DOWN
	
	for x in width:
		for y in height:
			var cell := layer.get_cell(x, y)
			var direction := get_cell_direction(x, y, layer)
			
			if cell == previous_cell and direction == previous_direction:
				consecutive_cells += 1
			else:
				data.append(consecutive_cells)
				data.append(previous_cell)
				data.append(previous_direction)
				consecutive_cells = 1
				previous_cell = cell
				previous_direction = direction
	
	return data

func get_data() -> Array:
	var ground_data := get_layer_data(base_ground)
	var middle_data := get_layer_data(base_middle)
	var top_data := get_layer_data(base_top)
	return [ground_data, middle_data, top_data]


func index_to_coords(index: int) -> Vector2:
	var x := floor(float(index) / float(height))
	var y: int = index % height
	return Vector2(x, y)

func set_layer_data(layer: TileMap, data: PoolIntArray) -> void:
	var index := 0
	for i in range(float(data.size()) / 3.0):
		var consecutive_cells := data[3 * i]
		var cell := data[3 * i + 1]
		var direction := data[3 * i + 2]
		for j in consecutive_cells:
			var transposed := direction in [Direction.RIGHT, Direction.LEFT]
			var flipped := direction in [Direction.UP, Direction.LEFT]
			layer.set_cellv(index_to_coords(index), cell, flipped, flipped, transposed)
			index += 1

func set_data(data: Array) -> void:
	var ground_data: PoolIntArray = data[0]
	var middle_data: PoolIntArray = data[1]
	var top_data: PoolIntArray = data[2]
	
	set_layer_data(base_ground, ground_data)
	set_layer_data(base_middle, middle_data)
	set_layer_data(base_top, top_data)
	
	base_top.separate_all_roofs()


func save_data() -> void:
	var data := get_data()
	var file := File.new()
	file.open("user://base.dat", File.WRITE)
	file.store_var(data)
	file.close()
