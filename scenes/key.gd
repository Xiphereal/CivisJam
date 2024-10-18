extends Node2D

@export var player_pull_force = 5
@export var boss_pull_force = 1

@onready var did_i_win_or_lose: Label = %DidIWinOrLose

func _process(delta):
	if Input.is_action_pressed("pull"):
		player_pull(player_pull_force)
	
	boss_pull(boss_pull_force)
	
func boss_pull(force):
	position.x += force

func player_pull(force):
	position.x -= player_pull_force

func _on_win(area: Area2D) -> void:
	did_i_win_or_lose.text = "You win!" 
	player_pull_force = 0
	boss_pull_force = 0

func _on_defeat(area: Area2D) -> void:
	did_i_win_or_lose.text = "You lose..." 
	player_pull_force = 0
	boss_pull_force = 0
