class_name Room
extends Node

enum Side {left, right}


var pvp_scene: Node2D

var player_node: Player
var enemy_node: Enemy

var player_base_node: Base
var enemy_base_node: Base


func _ready() -> void:
	set_physics_process(false)
	
	var file := File.new()
	var error := ERR_FILE_ALREADY_IN_USE
	while error == ERR_FILE_ALREADY_IN_USE:
		error = file.open("user://base.dat", File.READ)
	var base_data: Array = file.get_var()
	file.close()
	rpc_id(1, "client_ready", base_data)


remote func start(side: int, player_pos: Vector2, enemy_pos: Vector2, enemy_name: String, own_name: String, enemy_base: Array) -> void:
	pvp_scene = get_node("/root/PvP Mode Scene")
	
	player_node = get_node("/root/PvP Mode Scene/Player")
	enemy_node = get_node("/root/PvP Mode Scene/Enemy")
	
	player_base_node = get_node("/root/PvP Mode Scene/Map/PlayerBase")
	enemy_base_node = get_node("/root/PvP Mode Scene/Map/EnemyBase")
	
	enemy_base_node.set_data(enemy_base)
	
	pvp_scene.get_node("GUI/EnemyName").set_text(enemy_name)
	pvp_scene.get_node("GUI/PlayerName").set_text(own_name)
	
	if side == Side.right:
		pvp_scene.get_node("Map").set_rotation(PI)
		pvp_scene.get_node("PlayerCamera2D").set_rotation(PI)
		player_node.flip_controls = true
	
	player_node.set_position(player_pos)
	enemy_node.set_position(enemy_pos)
	
	player_node.connect("hit", self, "send_hit")
	player_node.connect("orb_collected", self, "send_orb_collected")
	
	player_base_node.connect("damaged", self, "send_player_base_damaged")
	enemy_base_node.connect("damaged", self, "send_enemy_base_damaged")
	
	pvp_scene.connect("victory", self, "send_victory")
	
	set_physics_process(true)
	get_tree().set_pause(false)

remote func enemy_disconnected() -> void:
	pvp_scene.connection_error("Enemy disconnected")



func _physics_process(_delta: float) -> void:
	send_transform()


func send_transform() -> void:
	var position := player_node.get_position()
	var rotation := player_node.get_rotation()
	rpc_unreliable_id(1, "update_transform", position, rotation)

remote func receive_transform(enemy_position: Vector2, enemy_rotation: float) -> void:
	enemy_node.update_transform(enemy_position, enemy_rotation)


func send_hit() -> void:
	rpc_id(1, "hit")

remote func receive_hit() -> void:
	enemy_node.punch()


func send_orb_collected() -> void:
	rpc_id(1, "orb_collected")

remote func receive_orb_collected() -> void:
	enemy_node.orb_collected()
	player_base_node.get_node("Orb").collect()


func send_player_base_damaged(x: int, y: int, damage: int) -> void:
	rpc_id(1, "player_base_damaged", x, y, damage)

func send_enemy_base_damaged(x: int, y: int, damage: int) -> void:
	rpc_id(1, "enemy_base_damaged", x, y, damage)


remote func receive_player_base_damaged(x: int, y: int, damage: int) -> void:
	player_base_node.damage_block(x, y, damage)
	
remote func receive_enemy_base_damaged(x: int, y: int, damage: int) -> void:
	enemy_base_node.damage_block(x, y, damage)



func send_victory() -> void:
	rpc_id(1, "victory")

remote func receive_defeat() -> void:
	pvp_scene.defeat()
