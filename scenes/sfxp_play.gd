extends Timer

@export var min_time = 2
@export var max_time = 8

const min := 0
const max := 3


const KEYS1 = preload("res://audio/KEYS 1.wav")
const KEYS2 = preload("res://audio/KEYS 2.wav")
const KEYSPULL = preload("res://audio/KEYS PULL.wav")
const KEYSSWING = preload("res://audio/KEYS SWING.wav")

const sfx_array := [KEYS1, KEYS2, KEYSPULL, KEYSSWING]

var current_stream = sfx_array[0]

func _on_timeout() -> void:
	current_stream = sfx_array[randi_range(min, max)]
	
	%SFX.stream = current_stream
	%SFX.play()
	
	change_timer_randomly()
	
	
func change_timer_randomly():
	wait_time = randi_range(min_time, max_time)
