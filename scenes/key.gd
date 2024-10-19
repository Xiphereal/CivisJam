extends Node2D

@export var player_pull_force = 5
@export var boss_pull_force = 1

@export var boss_pull_force_based_on_distance = 0.3

@onready var did_i_win_or_lose: Label = %DidIWinOrLose

func _process(delta):
	if Input.is_action_just_pressed("pull"):
		player_pull(player_pull_force)
	
	_boss_constant_pull(delta)
	
func boss_pull(force):
	position.x += force

func player_pull(force):
	position.x -= player_pull_force

func _boss_constant_pull(delta):
	var boss :Node2D = %Boss
	var position_after_pull :int = position.lerp(
		boss.position,
		boss_pull_force_based_on_distance * delta).x
		
	position.x = position_after_pull

func _on_win(area: Area2D) -> void:
	did_i_win_or_lose.text = "You win!" 
	_reach_end_game()

func _on_defeat(area: Area2D) -> void:
	did_i_win_or_lose.text = "You lose..." 
	_reach_end_game()
	
func _reach_end_game():
	player_pull_force = 0
	boss_pull_force = 0
