extends Node2D

@export var player_pull_force = 5
@export var boss_pull_force = 1

func _process(delta):
	if Input.is_action_pressed("pull"):
		position.x -= player_pull_force
		
	position.x += boss_pull_force
