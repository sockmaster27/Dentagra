class_name Room
extends Node

enum Side {left, right}


var player_node: Player
var enemy_node: Enemy

var player_base_node: Base
var enemy_base_node: Base


func _ready() -> void:
	set_physics_process(false)
	rpc_id(1, "client_ready")


remote func start(player1: Dictionary, player2: Dictionary) -> void:
	var id := get_tree().get_network_unique_id()
	
	var this_player := player1 if player1.id == id else player2
	var other_player := player1 if player1.id != id else player2
	
	player_node = get_node("/root/PvP Mode Scene/Player")
	enemy_node = get_node("/root/PvP Mode Scene/Enemy")
	
	player_base_node = get_node("/root/PvP Mode Scene/Map/PlayerBase")
	enemy_base_node = get_node("/root/PvP Mode Scene/Map/EnemyBase")
	
	print(other_player.name)
	
	if this_player.side == Side.right:
		get_node("/root/PvP Mode Scene/Map").set_rotation_degrees(180)
		# TODO: flip kamera
	
	player_node.set_position(this_player.pos)
	enemy_node.set_position(other_player.pos)
	
	player_node.connect("hit", self, "send_hit")
	
	player_base_node.connect("damaged", self, "send_player_base_damaged")
	enemy_base_node.connect("damaged", self, "send_enemy_base_damaged")
	
	set_physics_process(true)
	get_tree().set_pause(false)

remote func enemy_disconnected() -> void:
	var pvp_scene: PvPMode = get_node("/root/PvP Mode Scene")
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


func send_player_base_damaged(x: int, y: int, damage: int) -> void:
	rpc_id(1, "player_base_damaged", x, y, damage)

func send_enemy_base_damaged(x: int, y: int, damage: int) -> void:
	rpc_id(1, "enemy_base_damaged", x, y, damage)


remote func receive_player_base_damaged(x: int, y: int, damage: int) -> void:
	player_base_node.damage_block(x, y, damage)
	
remote func receive_enemy_base_damaged(x: int, y: int, damage: int) -> void:
	enemy_base_node.damage_block(x, y, damage)
