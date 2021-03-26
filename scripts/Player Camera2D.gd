extends Camera2D

# For at kameraet ikke bevæger sig lidt bag ved spilleren
func _process(_delta: float) -> void:
	align()
