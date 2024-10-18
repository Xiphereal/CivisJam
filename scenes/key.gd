extends Node2D

func _process(delta):
	if Input.is_action_pressed("pull"):
		position.x -= 1
