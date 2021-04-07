extends Node


func _ready() -> void:
	print(get_path())
	rpc("bruh")

remote func bruh() -> void:
	print("bruh")
