extends VideoStreamPlayer

func _on_finished() -> void:
	_go_to_instructions()
	
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pull"):
		_go_to_instructions()
	
func _go_to_instructions():
	get_tree().change_scene_to_file("res://scenes/instructions.tscn")
