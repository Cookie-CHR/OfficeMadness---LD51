extends Label

# Called when the node enters the scene tree for the first time.
func _ready():
	var seconds = GlobalTimer.seconds_passed%60
	var minutes = (GlobalTimer.seconds_passed/60)%60
	var string = ""
	
	if minutes > 0:
		string += str(minutes)+" minutes and"
	string += str(seconds)+" seconds"  
	self.text = string
