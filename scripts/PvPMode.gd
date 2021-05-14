class_name PvPMode
extends Node2D
onready var enemy_orb: EnemyOrb = $Map/EnemyBase/EnemyOrb

const menu_path := "res://scenes/Menu.tscn"
const error_dialog: PackedScene = preload("res://scenes/ErrorDialog.tscn")

func _ready() -> void:
	enemy_orb.connect("picked_up", self, "orb_collected")
	
func orb_collected() -> void:
	var player: Player = $Player
	player.orb_collected()

func connection_error(reason: String) -> void:
	get_tree().set_pause(true)
	
	var error_popup: ErrorDialog = error_dialog.instance()
	error_popup.set_text(reason)
	error_popup.connect("dismiss", self, "exit")
	add_child(error_popup)

func exit() -> void:
	get_tree().set_pause(false)
	get_tree().change_scene(menu_path)
