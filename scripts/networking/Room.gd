class_name Room
extends Node


var player_node: Player
var enemy_node: Enemy


func _ready() -> void:
	set_physics_process(false)
	rpc_id(1, "client_ready")


remote func start(player1: Dictionary, player2: Dictionary) -> void:
	var id := get_tree().get_network_unique_id()
	
	var this_player := player1 if player1.id == id else player2
	var other_player := player1 if player1.id != id else player2
	
	player_node = get_node("/root/PvP Mode Scene/Player")
	enemy_node = get_node("/root/PvP Mode Scene/Enemy")
	
	print(other_player.name)
	
	player_node.set_position(this_player.pos)
	enemy_node.set_position(other_player.pos)
	
	player_node.connect("hit", self, "send_hit")
	
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
