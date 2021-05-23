class_name PvPMode
extends Node2D


onready var enemy_orb: EnemyOrb = $Map/EnemyBase/Orb
onready var flag_zone: FlagZone = $Map/FlagZone
onready var player: Player = $Player
onready var enemy: Enemy = $Enemy
onready var GUI_animation_player := $GUI/AnimationPlayer

const menu_path := "res://scenes/Menu.tscn"
const error_dialog: PackedScene = preload("res://scenes/ErrorDialog.tscn")


func _ready() -> void:
	enemy_orb.connect("picked_up", self, "orb_collected")
	flag_zone.connect("player_wins", self, "victory")
	
func orb_collected() -> void:
	player.orb_collected()
	GUI_animation_player.play("orb_captured")

func connection_error(reason: String) -> void:
	get_tree().set_pause(true)
	
	var error_popup: ErrorDialog = error_dialog.instance()
	error_popup.set_text(reason)
	error_popup.connect("dismiss", self, "exit")
	add_child(error_popup)

func exit() -> void:
	get_tree().set_pause(false)
	get_tree().change_scene(menu_path)


func victory() -> void:
	player.pop_orb()
	flag_zone.disable()
	GUI_animation_player.play("victory")

func defeat() -> void:
	enemy.pop_orb()
	flag_zone.disable()
	GUI_animation_player.play("defeat")
