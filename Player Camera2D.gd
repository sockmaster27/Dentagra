extends Camera2D

# For at kameraet ikke bevæger sig lidt bag ved spilleren
func _process(delta: float) -> void:
	align()
