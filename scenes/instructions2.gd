extends VideoStreamPlayer

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pull"):
		_go_to_fight()

func _go_to_fight():
	get_tree().change_scene_to_file("res://scenes/main.tscn")
