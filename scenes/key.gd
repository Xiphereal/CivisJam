extends Node2D

@export var player_pull_force = 5
@export var boss_pull_force = 1

@export var boss_pull_force_based_on_distance = 0.3

@onready var stamina := 100
@export var stamina_gain = 30
@export var stamina_loss_per_click = 10

@onready var hold_stamina := 100

@onready var did_i_win_or_lose: Button = %DidIWinOrLose

const YOULOSE = preload("res://audio/YOULOSE.wav")
const YOUWIN = preload("res://audio/YOUWIN.wav")

const min := 0
const max := 3

const KEYS1 = preload("res://audio/KEYS 1.wav")
const KEYS2 = preload("res://audio/KEYS 2.wav")
const KEYSPULL = preload("res://audio/KEYS PULL.wav")
const KEYSSWING = preload("res://audio/KEYS SWING.wav")

const sfx_array := [KEYS1, KEYS2, KEYSPULL, KEYSSWING]

var current_stream = sfx_array[0]

var pressed := false
var holding := false

func _process(delta):
	%Stamina.value=stamina
	if Input.is_action_just_pressed("pull"):
		_update_stamina()
		_play_sfx()
			
	_update_hold_stamina()
	_update_holding()
	_boss_constant_pull(delta)
	
func _play_sfx():
	if randi_range(0, 1) > 0.9:
		current_stream = sfx_array[randi_range(min, max)]
		%SFX.stream = current_stream
		%SFX.pitch_scale = randi_range(1, 10)
		%SFX.play()
		%SFX.pitch_scale = 1
			
func _update_holding():
	holding = pressed and hold_stamina > 0
	
func _update_stamina():
	if stamina > 0:
		player_pull(player_pull_force)
		stamina -= stamina_loss_per_click

func _update_hold_stamina():
	if Input.is_action_just_pressed("pull"):
		pressed = true
	if Input.is_action_just_released("pull"):
		pressed = false
		
	if pressed:
		hold_stamina -= 3
	hold_stamina += 1
	hold_stamina = max(hold_stamina, 0)
	hold_stamina = min(hold_stamina, 100)
	
func boss_pull(force):
	position.x += force

func player_pull(force):
	position.x -= player_pull_force

func _boss_constant_pull(delta):
	var boss_distance_force = %Boss.position.distance_to(position) * 0.1
	boss_pull(boss_pull_force * boss_distance_force * delta)

func _on_win(area: Area2D) -> void:
	did_i_win_or_lose.win()
	_reach_end_game()
	%Music.stream = YOUWIN
	%Music.play()

func _on_defeat(area: Area2D) -> void:
	did_i_win_or_lose.lose()
	_reach_end_game()
	%Music.stream = YOULOSE
	%Music.play()
	
func _reach_end_game():
	player_pull_force = 0
	boss_pull_force = 0

func _on_stamina_boost_timeout() -> void:
	if stamina < 100:
		stamina += stamina_gain

func _on_boss_force_loss_timeout() -> void:
	boss_pull_force *= 0.5
