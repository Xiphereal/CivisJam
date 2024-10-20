extends Timer

@export var min_time = 1
@export var max_time = 4

@export var min_force = 10
@export var max_force = 30

const _PULL = preload("res://audio/PULL.wav")

const _ROPE1 = preload("res://audio/ROPE 1.wav")
const _ROPE2 = preload("res://audio/ROPE 2.wav")
const _ROPE3 = preload("res://audio/ROPE 3.wav")

const sfx_array := [_PULL, _ROPE1, _ROPE2, _ROPE3]

var current_stream = sfx_array[0]

func _on_timeout() -> void:
	if !%Key.holding:
		%Key.boss_pull(randi_range(min_force, max_force))
	
		current_stream = sfx_array[randi_range(0, 3)]
		%SFX.stream = current_stream
		%SFX.play()
	
		%Camera.initiate_shake(1)
	
	change_timer_randomly()
	
func change_timer_randomly():
	wait_time = randi_range(min_time, max_time)
