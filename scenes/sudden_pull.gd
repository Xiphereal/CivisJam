extends ProgressBar

func _ready() -> void:
	value = %SuddentPull.time_left
	
func _process(delta: float) -> void:
	value = %SuddentPull.time_left
