extends ProgressBar

func _ready() -> void:
	max_value = %BossExhaust.wait_time
	
func _process(delta: float) -> void:
	value = %BossExhaust.time_left
