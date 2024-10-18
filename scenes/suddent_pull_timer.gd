extends Timer

@export var min_time = 1
@export var max_time = 4

@export var force = 5

func _on_timeout() -> void:
	%Key.boss_pull(force)

	change_timer_randomly()
	print("timeout!")
	
func change_timer_randomly():
	wait_time = randi_range(min_time, max_time)
