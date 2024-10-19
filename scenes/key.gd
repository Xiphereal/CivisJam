extends Node2D

@export var player_pull_force = 5
@export var boss_pull_force = 1

@export var boss_pull_force_based_on_distance = 0.3

@export var stamina_boost = 20
@export var stamina_loss_per_click = 10

@onready var did_i_win_or_lose: Label = %DidIWinOrLose

@onready var stamina := 100

const YOULOSE = preload("res://audio/YOULOSE.wav")
const YOUWIN = preload("res://audio/YOUWIN.wav")


func _process(delta):
	%Stamina.value=stamina
	if Input.is_action_just_pressed("pull"):
		if stamina > 0:
			player_pull(player_pull_force)
			stamina -= stamina_loss_per_click
			
	_boss_constant_pull(delta)
	
func boss_pull(force):
	position.x += force

func player_pull(force):
	position.x -= player_pull_force

func _boss_constant_pull(delta):
	var boss_distance_force = %Boss.position.distance_to(position) * 0.1
	boss_pull(boss_pull_force * boss_distance_force * delta)

func _on_win(area: Area2D) -> void:
	did_i_win_or_lose.text = "You win!" 
	_reach_end_game()
	%Music.stream = YOUWIN
	%Music.play()

func _on_defeat(area: Area2D) -> void:
	did_i_win_or_lose.text = "You lose..." 
	_reach_end_game()
	%Music.stream = YOULOSE
	%Music.play()
	
func _reach_end_game():
	player_pull_force = 0
	boss_pull_force = 0

func _on_stamina_boost_timeout() -> void:
	if stamina < 100:
		stamina += stamina_boost 

func _on_boss_force_loss_timeout() -> void:
	boss_pull_force *= 0.5
