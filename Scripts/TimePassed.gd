extends Timer


var seconds_passed


# Called when the node enters the scene tree for the first time.
func _ready():
	seconds_passed = 0

func _on_Timer_timeout():
	seconds_passed += 1
