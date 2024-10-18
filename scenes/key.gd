extends Node2D

@export var player_pull_force = 5
@export var boss_pull_force = 1

func _process(delta):
	if Input.is_action_pressed("pull"):
		position.x -= player_pull_force
		
	position.x += boss_pull_force

func _on_win(area: Area2D) -> void:
	player_pull_force = 0
	boss_pull_force = 0


func _on_defeat(area: Area2D) -> void:
	player_pull_force = 0
	boss_pull_force = 0
