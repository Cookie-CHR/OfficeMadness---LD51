extends Timer


var seconds_passed


# Called when the node enters the scene tree for the first time.
func _ready():
	_play()

func _on_Timer_timeout():
	seconds_passed += 1

func _play():
	seconds_passed = 0
	start()

func _stop():
	stop()
